import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertPythonJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos de Python',
    'topic': 'Sintaxis Básica',
    'subtopic': 'Estructura de un programa Python',
    'definition': '''
Cuando empiezas a escribir en Python, lo primero que notas es su limpieza visual. A diferencia de otros lenguajes, aquí no necesitas escribir llaves o puntos y comas por todos lados. Todo fluye de forma más directa y natural.

¿Te estás preguntando por qué esto importa? 

Bueno, resulta que esa sencillez hace que Python sea muy fácil de leer y escribir. Ideal si estás dando tus primeros pasos en el mundo de la programación o si vienes de otros lenguajes más verbosos.

Un programa en Python normalmente arranca ejecutando las instrucciones de arriba hacia abajo. Puedes tener declaraciones de variables, funciones definidas con `def`, bloques condicionales y bucles. Todo esto organizado de forma jerárquica usando la indentación (espacios al inicio de cada línea) en lugar de símbolos como en otros lenguajes. Lo esencial es que el código se vea limpio y bien estructurado, porque Python realmente se preocupa por la forma en la que escribes. De hecho, un error de indentación puede hacer que tu programa ni siquiera arranque.

Algunas reglas básicas: el código se ejecuta en el orden en que lo escribes (a menos que uses condiciones o funciones), puedes definir funciones antes de usarlas, y todo comienza con la línea principal, o simplemente el primer bloque que se ejecuta si no tienes una función `main()` como tal. 
''',
    'code_example': '''
# Estructura básica de un programa Python

# Esto es una función
def saludar():
    print("Hola desde Python")

# Llamamos a la función
saludar()

# También podemos hacer operaciones básicas
numero = 5 + 3
print("El resultado es:", numero)

# Incorrecto: sin indentación
# def error():
# print("Esto da error")  # ← Error de indentación
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos de Python',
    'topic': 'Sintaxis Básica',
    'subtopic': 'Comentarios (#, """)',
    'definition': '''
Hablemos de los comentarios en Python.  Son esas pequeñas notas que le dejas a tu futuro yo (o a otros programadores) dentro del código.  Piensa en ellos como post-its que te ayudan a recordar qué hace cada parte del programa.

Seguramente te preguntarás, ¿por qué son tan importantes? Bueno, los comentarios son cruciales para hacer que tu código sea más legible y comprensible.  Cuando escribes código, puede que todo tenga sentido en ese momento, pero créeme, cuando vuelvas a verlo semanas o meses después, ¡te alegrarás de haber dejado comentarios!

Ahora, vamos al grano.  En Python, tienes dos formas principales de escribir comentarios: los comentarios de una sola línea y los comentarios multilínea.  Los comentarios de una sola línea empiezan con el símbolo `#`.  Todo lo que escribas después del `#` en esa línea será ignorado por el intérprete de Python.  Son perfectos para explicar una línea de código o añadir una nota rápida.  Por otro lado, los comentarios multilínea se escriben usando tres comillas dobles `"""` al principio y al final del bloque de texto.  Estos son ideales para explicar funciones completas, bloques de código complejos o cualquier cosa que requiera una explicación más extensa.  Usar buenos comentarios es una habilidad clave; ¡te lo agradecerás a ti mismo en el futuro! 🚀
''',
    'code_example': '''
# Este es un comentario de una sola línea
print("¡Hola, mundo!")  # Imprime "¡Hola, mundo!"

"""
Este es un comentario
multilínea.
Puede ocupar varias líneas.
"""

def mi_funcion(parametro):
    """
    Esta función hace algo muy importante.
    Recibe un parámetro y devuelve un resultado.
    """
    # Aquí va el código de la función
    return parametro * 2

# Ejemplo de un comentario innecesario (¡Evitar!)
# x = x + 1  # Suma 1 a x
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos de Python',
    'topic': 'Sintaxis Básica',
    'subtopic': 'Indentación',
    'definition': '''
Hablemos de la indentación en Python.  Si vienes de otros lenguajes, esto te va a parecer... peculiar.  En Python, la indentación no es solo para que el código se vea bonito (aunque ayuda 💅), ¡es parte de la sintaxis del lenguaje!

¿Te estás preguntando qué significa "indentación"? Básicamente, es el espacio en blanco al principio de una línea de código.  En otros lenguajes, se usan llaves `{}` o palabras clave como `begin` y `end` para definir bloques de código (como el cuerpo de una función o un bucle).  Python, en cambio, usa la indentación.

Ahora, profundicemos.  La indentación le dice al intérprete de Python qué líneas de código pertenecen a qué bloque.  Por ejemplo, las líneas dentro de una función o un bucle `for` deben estar indentadas.  Si la indentación es incorrecta, Python lanzará un error (`IndentationError`) y tu programa no funcionará.  La convención es usar 4 espacios por nivel de indentación, aunque también puedes usar tabulaciones (¡pero es mejor no mezclarlos!).  Esto puede parecer quisquilloso, pero te obliga a escribir código limpio y legible.  Al final, lo agradecerás (aunque al principio te cueste un poco 😅).
''',
    'code_example': '''
def mi_funcion():
    print("Esta línea está indentada, pertenece a la función")
    if True:
        print("Esta línea también está indentada, pertenece al if")
    print("Esta línea también pertenece a la función")

print("Esta línea no está indentada, está fuera de la función")

# Ejemplo de error de indentación
# def otra_funcion():
# print("Esta línea debería estar indentada") # IndentationError: expected an indented block
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos de Python',
    'topic': 'Sintaxis Básica',
    'subtopic': 'Bloques de código',
    'definition': '''
Siguiendo con la idea de la indentación, hablemos ahora de los bloques de código en Python.  Un bloque de código es un conjunto de líneas de código que se agrupan y se tratan como una unidad.  Piensa en ellos como párrafos en un libro; cada párrafo tiene un propósito y contribuye a la historia general.

¿Te preguntas dónde encontramos estos bloques? Los bloques de código aparecen en varias partes de un programa Python, como dentro de funciones, bucles (`for` y `while`), sentencias condicionales (`if`, `elif`, `else`) y clases.  La clave para definir un bloque en Python es la indentación.  Todas las líneas dentro de un bloque deben estar indentadas al mismo nivel.

Ahora, lo importante.  La indentación consistente es crucial.  Si mezclas diferentes niveles de indentación dentro de un bloque, Python se confundirá y te dará un error.  Esto puede parecer un poco estricto, pero tiene una gran ventaja: hace que el código sea mucho más fácil de leer y entender.  Puedes ver de un vistazo qué líneas pertenecen a qué bloque, lo que facilita la depuración y el mantenimiento del código.  Además, fomenta un estilo de programación limpio y organizado.  Así que, ¡abraza la indentación y escribe código Python como un pro! 😎
''',
    'code_example': '''
def mi_funcion():
    # Este es un bloque de código dentro de la función
    print("Inicio de la función")
    if True:
        # Este es un bloque de código dentro del if
        print("Dentro del if")
        print("Otra línea dentro del if")
    print("Fin de la función")

for i in range(3):
    # Este es un bloque de código dentro del bucle for
    print("Inicio del bucle")
    print("Valor de i:", i)
    print("Fin del bucle")

# Ejemplo de indentación incorrecta (¡Error!)
# if True:
# print("Esta línea debería estar indentada")
#  print("Esta línea también debería estar indentada") # IndentationError: unindent does not match any outer indentation level
'''
  });

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Tipos básicos (int, float, bool, str)',
      'definition': '''
Hablemos de los tipos básicos de datos en Python.  Estos son los bloques de construcción fundamentales con los que trabajamos para representar información.  Piensa en ellos como los ingredientes esenciales en la cocina de la programación.

Seguramente te estarás preguntando, ¿qué tipos son esos? Bueno, tenemos los enteros (`int`), que son números enteros sin decimales (como 5, -10, 0).  Luego están los flotantes (`float`), que son números con decimales (como 3.14, -2.5, 0.0).  También tenemos los booleanos (`bool`), que representan valores de verdad: `True` o `False`.  Y finalmente, las cadenas (`str`), que son secuencias de caracteres (como "Hola", "Python", "123").

Ahora, profundicemos un poco más.  Cada tipo de dato tiene sus propias características y operaciones permitidas.  Por ejemplo, puedes sumar dos `int` o dos `float`, pero no puedes sumar directamente un `int` y un `str` (a menos que los conviertas primero).  Los booleanos son muy útiles para controlar el flujo del programa (como en las sentencias `if`).  Y las cadenas son esenciales para trabajar con texto.  Entender estos tipos básicos es crucial para escribir programas que manejen la información correctamente.  ¡Dominarlos te abrirá un mundo de posibilidades! 🚀
''',
      'code_example': '''
# Ejemplos de tipos básicos
edad = 30          # int
altura = 1.75      # float
es_estudiante = True  # bool
nombre = "Carlos"    # str

# Operaciones con int y float
suma = edad + 10
altura_duplicada = altura * 2

# Operaciones con str
saludo = "Hola, " + nombre  # Concatenación

# Ejemplo de error de tipo (¡Cuidado!)
# suma_incorrecta = edad + nombre  # TypeError: unsupported operand type(s) for +: 'int' and 'str'
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Tipos complejos (list, tuple, set, dict)',
      'definition': '''
Ahora, hablemos de los tipos de datos complejos en Python.  Estos son como contenedores que pueden almacenar múltiples valores, lo que nos permite organizar la información de manera más eficiente.  Piensa en ellos como las estanterías y cajones de tu habitación, que te ayudan a mantener todo en orden.

Seguramente te estarás preguntando, ¿cuáles son estos tipos? Tenemos las listas (`list`), que son secuencias ordenadas de elementos que pueden ser de cualquier tipo (incluso otras listas).  Luego están las tuplas (`tuple`), que son similares a las listas pero inmutables (es decir, no se pueden modificar después de su creación).  También tenemos los conjuntos (`set`), que son colecciones no ordenadas de elementos únicos.  Y finalmente, los diccionarios (`dict`), que almacenan pares clave-valor, permitiéndote acceder a los valores mediante sus claves.

Profundicemos un poco.  Las listas son muy versátiles y se usan mucho para almacenar colecciones de elementos que pueden cambiar a lo largo del tiempo.  Las tuplas son útiles cuando quieres asegurarte de que los datos no se modifiquen.  Los conjuntos son ideales para eliminar duplicados y realizar operaciones de conjuntos (como la unión y la intersección).  Y los diccionarios son perfectos para representar relaciones entre datos, como un diccionario de palabras y sus definiciones.  Dominar estos tipos complejos te permitirá manejar grandes cantidades de información de manera efectiva.  ¡Prepárate para llevar tu programación al siguiente nivel! 🚀
''',
      'code_example': '''
# Ejemplos de tipos complejos
mi_lista = [1, 2, 3, "a", "b"]  # list
mi_tupla = (4, 5, 6)             # tuple
mi_conjunto = {7, 8, 9}           # set
mi_diccionario = {"clave1": "valor1", "clave2": "valor2"}  # dict

# Operaciones con listas
mi_lista.append("c")  # Agregar un elemento
mi_lista[0] = 10      # Modificar un elemento

# Error con tuplas (¡No se pueden modificar!)
# mi_tupla[0] = 40  # TypeError: 'tuple' object does not support item assignment
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Declaración e inicialización de variables',
      'definition': '''
Ahora, hablemos de cómo declarar e inicializar variables en Python.  Las variables son como etiquetas que le pones a los datos para poder referirte a ellos más tarde.  Imagina que estás organizando cajas 📦 en un almacén; cada caja necesita una etiqueta para saber qué contiene, ¿verdad?  Pues las variables son esas etiquetas en el mundo de la programación.

Seguramente te estarás preguntando, ¿cómo se crean estas etiquetas? En Python, es muy sencillo.  Simplemente eliges un nombre para la variable y le asignas un valor usando el operador de asignación `=`.  Por ejemplo, si quieres guardar tu edad, puedes escribir `edad = 30`.  ¡Y ya está!  Python automáticamente determina el tipo de dato de la variable basándose en el valor que le asignas.

Profundicemos un poco más.  La primera vez que le asignas un valor a una variable, se dice que la estás "inicializando".  Después de eso, puedes cambiar el valor de la variable tantas veces como quieras.  Los nombres de las variables deben seguir ciertas reglas: pueden contener letras, números y guiones bajos, pero deben empezar con una letra o un guion bajo.  Además, Python distingue entre mayúsculas y minúsculas, así que `edad` y `Edad` son variables diferentes.  Elegir buenos nombres para las variables es crucial para que tu código sea fácil de leer y entender.  ¡Un buen nombre puede ahorrarte muchos dolores de cabeza en el futuro! 😅
''',
      'code_example': '''
# Declaración e inicialización de variables
edad = 30
nombre = "Alice"
altura = 1.65
es_estudiante = True

# Cambiando el valor de una variable
edad = 31

# Nombres de variables válidos
mi_variable = 10
_mi_variable = 20
miVariable1 = 30

# Nombres de variables inválidos (¡Evitar!)
# 1mi_variable = 40  # SyntaxError: invalid syntax
# mi-variable = 50  # SyntaxError: invalid syntax
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Ámbito de variables (global, local)',
      'definition': '''
Ahora, hablemos del ámbito de las variables en Python.  El ámbito de una variable se refiere a la parte del programa donde esa variable es accesible.  Piensa en ello como el territorio de una variable; algunas variables solo son conocidas dentro de su propio "barrio", mientras que otras son conocidas en toda la "ciudad".

Seguramente te estarás preguntando, ¿cuáles son esos "barrios" y "ciudades" en Python? Bueno, tenemos el ámbito local y el ámbito global.  Una variable local se define dentro de una función y solo es accesible dentro de esa función.  Es como una variable que solo existe dentro de una "habitación" específica.  Por otro lado, una variable global se define fuera de cualquier función y es accesible desde cualquier parte del programa.  Es como una variable que está disponible en toda la "casa".

Profundicemos un poco más.  Es importante entender la diferencia entre estos ámbitos para evitar confusiones y errores.  Si intentas acceder a una variable local fuera de su función, Python te dará un error.  Además, si tienes una variable local y una variable global con el mismo nombre, la variable local "oculta" a la variable global dentro de la función.  Usar variables globales con moderación es una buena práctica, ya que pueden hacer que el código sea más difícil de entender y mantener.  ¡Un buen manejo del ámbito de las variables es clave para escribir código limpio y organizado! 🚀
''',
      'code_example': '''
# Variable global
variable_global = "Soy global"

def mi_funcion():
    # Variable local
    variable_local = "Soy local"
    print(variable_local)  # Acceso a la variable local
    print(variable_global) # Acceso a la variable global

mi_funcion()
print(variable_global)  # Acceso a la variable global
# print(variable_local)  # Error: NameError: name 'variable_local' is not defined

def otra_funcion():
    variable_global = "Soy global pero modificada localmente" # Esto CREA una nueva variable local
    print(variable_global)

otra_funcion()
print(variable_global)
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Operadores',
      'subtopic': 'Operadores aritméticos (+, -, *, /, %, **, //)',
      'definition': '''
Hablemos de los operadores aritméticos en Python. Son los símbolos que usamos para realizar operaciones matemáticas, ¡como en la calculadora! Piensa en ellos como las herramientas básicas para hacer cálculos en tus programas.

Seguramente te estarás preguntando, ¿cuáles son esos operadores? Bueno, tenemos los clásicos: `+` para la suma, `-` para la resta, `*` para la multiplicación y `/` para la división. Pero Python también nos da algunos extras interesantes.

Profundicemos un poco. El operador `%` nos da el resto de una división (útil para saber si un número es par o impar), `**` se usa para elevar un número a una potencia (como 2 al cubo sería `2 ** 3`), y `//` realiza la división entera, descartando la parte decimal. Estos operadores nos permiten hacer cálculos complejos de manera sencilla. ¡Son una parte esencial de la caja de herramientas de cualquier programador! 🚀
''',
      'code_example': '''
# Ejemplos de operadores aritméticos
a = 10
b = 3

suma = a + b       # 13
resta = a - b      # 7
multiplicacion = a * b # 30
division = a / b    # 3.333...
resto = a % b       # 1
potencia = a ** b    # 1000
division_entera = a // b # 3

# Ejemplo de uso del operador % para verificar si un número es par
numero = 7
if numero % 2 == 0:
    print(f"{numero} es par")
else:
    print(f"{numero} es impar")

# Un error común es dividir por cero (¡Cuidado!)
# division_por_cero = 10 / 0  # ZeroDivisionError: division by zero
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Operadores',
      'subtopic': 'Operadores de comparación (==, !=, >, <, >=, <=)',
      'definition': '''
Ahora, hablemos de los operadores de comparación en Python. Estos operadores nos permiten comparar valores y determinar si una afirmación es verdadera o falsa. Son como los jueces que deciden si dos cosas son iguales, diferentes, mayores, menores, etc.

Seguramente te estarás preguntando, ¿cuáles son esos jueces? Tenemos `==` para verificar si dos valores son iguales, `!=` para verificar si son diferentes, `>` para mayor que, `<` para menor que, `>=` para mayor o igual que, y `<=` para menor o igual que.

Profundicemos un poco. Estos operadores siempre devuelven un valor booleano: `True` si la comparación es verdadera, y `False` si es falsa. Son esenciales para controlar el flujo de un programa, por ejemplo, para decidir si se debe ejecutar un bloque de código o no (¡lo veremos más adelante con las estructuras de control!). ¡Dominar estos operadores te permitirá tomar decisiones inteligentes en tu código! 🚀
''',
      'code_example': '''
# Ejemplos de operadores de comparación
a = 10
b = 5

igual = a == b       # False
diferente = a != b   # True
mayor_que = a > b    # True
menor_que = a < b    # False
mayor_o_igual = a >= b # True
menor_o_igual = a <= b # False

# Uso común en una sentencia if
if a > b:
    print("a es mayor que b")
else:
    print("a no es mayor que b")

# Un error común es usar = en lugar de == (¡Cuidado!)
# if a = b:  # SyntaxError: invalid syntax
#     print("Esto está mal")
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Operadores',
      'subtopic': 'Operadores lógicos (and, or, not)',
      'definition': '''
Sigamos con los operadores lógicos en Python. Estos operadores nos permiten combinar o negar condiciones. Son como los conectores y negadores en una oración, que nos permiten crear afirmaciones más complejas.

Seguramente te estarás preguntando, ¿cuáles son esos conectores y negadores? Tenemos `and` para "y" lógico (ambas condiciones deben ser verdaderas), `or` para "o" lógico (al menos una condición debe ser verdadera), y `not` para la negación (invierte el valor de la condición).

Profundicemos un poco. Los operadores lógicos también devuelven valores booleanos (`True` o `False`). Son muy útiles para crear condiciones compuestas en las sentencias `if` y los bucles. Por ejemplo, puedes verificar si un número está dentro de un rango usando `and`, o si cumple alguna de varias condiciones usando `or`. ¡Dominar estos operadores te permitirá crear lógica compleja en tu código! 🚀
''',
      'code_example': '''
# Ejemplos de operadores lógicos
a = True
b = False

y_logico = a and b   # False
o_logico = a or b    # True
no_logico = not a    # False

# Uso común en una sentencia if
edad = 20
es_estudiante = True

if edad >= 18 and es_estudiante:
    print("Eres mayor de edad y estudiante")
else:
    print("No cumples ambas condiciones")

# Un error común es confundir and con or (¡Cuidado!)
# if edad >= 18 or es_estudiante:
#     print("Esto no es lo que queríamos")
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Operadores',
      'subtopic': 'Operadores de asignación (=, +=, -=, *=, /=, %=, **=, //=)',
      'definition': '''
Finalmente, hablemos de los operadores de asignación en Python. Ya conocemos el operador `=` para asignar un valor a una variable. Pero Python nos ofrece algunos operadores de asignación combinados que nos permiten realizar una operación y una asignación al mismo tiempo. Son como atajos para hacer nuestro código más conciso.

Seguramente te estarás preguntando, ¿cuáles son esos atajos? Tenemos `+=` para sumar y asignar, `-=` para restar y asignar, `*=` para multiplicar y asignar, `/=` para dividir y asignar, `%=` para calcular el resto y asignar, `**=` para elevar a una potencia y asignar, y `//=` para dividir entero y asignar.

Profundicemos un poco. Estos operadores modifican el valor de la variable original. Por ejemplo, `x += 5` es equivalente a `x = x + 5`. Son muy útiles para actualizar contadores o acumuladores en bucles. ¡Dominar estos operadores te permitirá escribir código más eficiente y legible! 🚀
''',
      'code_example': '''
# Ejemplos de operadores de asignación
x = 10

x += 5     # x es ahora 15 (x = x + 5)
x -= 3     # x es ahora 12 (x = x - 3)
x *= 2     # x es ahora 24 (x = x * 2)
x /= 4     # x es ahora 6.0 (x = x / 4)
x %= 5     # x es ahora 1.0 (x = x % 5)
x **= 2    # x es ahora 36.0 (x = x ** 2)
x //= 7    # x es ahora 5.0 (x = x // 7)

# Un error común es usar el operador de asignación incorrecto (¡Cuidado!)
# x =+ 5  # Esto es válido, pero no hace lo que probablemente querías (es equivalente a x = +5)
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Estructuras de Control',
      'subtopic': 'Sentencias if-elif-else',
      'definition': '''
Hablemos de las sentencias `if-elif-else` en Python. Estas estructuras nos permiten tomar decisiones en nuestro código, ejecutando diferentes bloques de código según si se cumplen ciertas condiciones. Piensa en ellas como los "si... entonces... sino..." de la vida real, pero aplicados a la programación.

Seguramente te estarás preguntando, ¿cómo funcionan exactamente? Bueno, la sentencia `if` evalúa una condición. Si la condición es verdadera (`True`), se ejecuta el bloque de código que está debajo del `if`. Si la condición es falsa (`False`), se puede usar la sentencia `else` para especificar un bloque de código alternativo que se ejecutará. Además, se pueden usar las sentencias `elif` (abreviatura de "else if") para evaluar condiciones adicionales en caso de que la condición del `if` sea falsa.

Profundicemos un poco. Puedes usar tantas sentencias `elif` como necesites para cubrir diferentes casos. Es importante recordar que solo se ejecutará uno de los bloques de código (`if`, `elif` o `else`). Si la condición del `if` es verdadera, los `elif` y el `else` se ignoran. Si la condición del `if` es falsa, se evalúan los `elif` en orden, y si ninguna de sus condiciones es verdadera, se ejecuta el bloque del `else` (si está presente). ¡Dominar estas sentencias te permitirá crear programas que respondan de manera inteligente a diferentes situaciones! 🚀
''',
      'code_example': '''
# Ejemplos de sentencias if-elif-else
edad = 25

if edad < 18:
    print("Eres menor de edad")
elif edad >= 18 and edad < 65:
    print("Eres adulto")
else:
    print("Eres adulto mayor")

# Otro ejemplo
nota = 85

if nota >= 90:
    print("Excelente")
elif nota >= 80:
    print("Muy bien")
elif nota >= 70:
    print("Bien")
else:
    print("A mejorar")

# Un error común es olvidar los dos puntos (:) al final de la línea if, elif o else (¡Cuidado!)
# if edad < 18
#     print("Esto está mal")  # SyntaxError: invalid syntax
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Estructuras de Control',
      'subtopic': 'Bucles (for, while)',
      'definition': '''
Ahora, hablemos de los bucles en Python. Los bucles nos permiten repetir un bloque de código varias veces. Son como los "haz esto una y otra vez" de la programación, lo que nos ahorra mucho trabajo cuando necesitamos realizar la misma tarea repetidamente.

Seguramente te estarás preguntando, ¿qué tipos de bucles hay? Python nos ofrece dos tipos principales: el bucle `for` y el bucle `while`. El bucle `for` se usa para iterar sobre una secuencia (como una lista, una tupla o un rango de números) y ejecutar el bloque de código para cada elemento de la secuencia. El bucle `while` se usa para ejecutar un bloque de código mientras se cumpla una condición.

Profundicemos un poco. Los bucles son una herramienta poderosa para automatizar tareas repetitivas. Por ejemplo, puedes usar un bucle `for` para procesar todos los elementos de una lista, o un bucle `while` para ejecutar un juego hasta que el usuario decida terminar. Es importante asegurarse de que la condición del bucle `while` eventualmente se vuelva falsa, de lo contrario, el bucle se ejecutará indefinidamente (¡lo que se conoce como un bucle infinito y puede colgar tu programa!). ¡Dominar los bucles te permitirá escribir código mucho más eficiente! 🚀
''',
      'code_example': '''
# Ejemplos de bucles
# Bucle for
for i in range(5):  # Itera 5 veces (de 0 a 4)
    print("Valor de i:", i)

# Bucle while
contador = 0
while contador < 5:
    print("Contador:", contador)
    contador += 1  # Incrementa el contador

# Ejemplo de bucle infinito (¡Cuidado!)
# while True:
#     print("Esto se repetirá para siempre")

# Un error común es olvidar incrementar el contador en un bucle while (¡Cuidado!)
# contador = 0
# while contador < 5:
#     print("Contador:", contador)
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Estructuras de Control',
      'subtopic': 'Break y continue',
      'definition': '''
Sigamos con las sentencias `break` y `continue` en Python. Estas sentencias nos permiten tener un control más preciso sobre la ejecución de los bucles. Son como los botones de "pausa" y "saltar" para los bucles.

Seguramente te estarás preguntando, ¿qué hacen exactamente? La sentencia `break` se usa para salir de un bucle inmediatamente. Cuando se encuentra un `break`, el bucle se detiene y la ejecución continúa con la siguiente instrucción después del bucle. La sentencia `continue`, por otro lado, se usa para saltar el resto de la iteración actual del bucle y pasar a la siguiente iteración. Cuando se encuentra un `continue`, el bloque de código restante dentro del bucle se omite para la iteración actual, y el bucle continúa con la siguiente iteración.

Profundicemos un poco. `break` es útil cuando encuentras una condición que hace que no sea necesario seguir iterando en el bucle. `continue` es útil cuando quieres saltar algunas iteraciones basadas en una condición específica, pero quieres que el bucle siga ejecutándose. ¡Dominar estas sentencias te dará un mayor control sobre tus bucles! 🚀
''',
      'code_example': '''
# Ejemplos de break y continue
# Break
for i in range(10):
    if i == 5:
        break  # Sale del bucle cuando i es 5
    print("Valor de i (break):", i)

# Continue
for i in range(10):
    if i % 2 == 0:
        continue  # Salta las iteraciones donde i es par
    print("Valor de i (continue):", i)

# Ejemplo de uso de break para encontrar un elemento en una lista
lista = [1, 5, 10, 15, 20]
objetivo = 10
encontrado = False
for elemento in lista:
    if elemento == objetivo:
        encontrado = True
        break
if encontrado:
    print("Elemento encontrado")
else:
    print("Elemento no encontrado")
'''
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Python',
      'topic': 'Estructuras de Control',
      'subtopic': 'Pass statement',
      'definition': '''
Finalmente, hablemos de la sentencia `pass` en Python. Esta sentencia es un poco peculiar, ya que no hace nada. Es como un marcador de posición que le dice a Python: "Aquí irá algo, pero todavía no sé qué".

Seguramente te estarás preguntando, ¿por qué necesitamos una sentencia que no hace nada? Bueno, `pass` es útil en situaciones donde la sintaxis de Python requiere que haya un bloque de código, pero aún no has decidido qué código poner allí. Por ejemplo, puedes usar `pass` dentro de una función o una sentencia condicional que aún no has implementado.

Profundicemos un poco. `pass` es especialmente útil durante el desarrollo y la planificación del código. Te permite escribir la estructura básica de tu programa sin tener que preocuparte por los detalles de implementación de inmediato. También puede ser útil para evitar errores de sintaxis cuando estás escribiendo código y aún no has completado una parte. Aunque `pass` en sí mismo no realiza ninguna acción, juega un papel importante en la escritura de código limpio y estructurado. ¡Es una herramienta sencilla pero poderosa! 🚀
''',
      'code_example': '''
# Ejemplos de pass statement
def mi_funcion():
    pass  # La función aún no está implementada

if True:
    pass  # El bloque if aún no está implementado
else:
    print("Esto sí se ejecuta")

for i in range(5):
    if i == 3:
        pass  # No hacer nada cuando i es 3
    else:
        print("Valor de i:", i)

# Ejemplo de uso de pass en una clase vacía
class MiClase:
    pass
'''
    },
  );
}

Future<void> insertPythonJrLevel2Data(Database db) async {
  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 2,
      'tittle_level': 'Programación Orientada a Objetos',
      'topic': 'Clases y Objetos',
      'subtopic': 'Definición de clases (class)',
      'definition': '''
¡Entramos al fascinante mundo de la Programación Orientada a Objetos (POO)! Para empezar, hablemos de las clases. Piensa en una clase como un plano o una plantilla para crear objetos. Es como el molde para hacer galletas 🍪, donde el molde define la forma y las características de cada galleta.

Seguramente te estarás preguntando, ¿qué define exactamente una clase? Una clase define los atributos (las características) y los métodos (las acciones) que tendrán los objetos creados a partir de ella. Los atributos son como las variables que almacenan información sobre el objeto, y los métodos son como las funciones que definen el comportamiento del objeto.

Profundicemos un poco. En Python, se usa la palabra clave `class` para definir una clase. El nombre de la clase generalmente sigue la convención de usar CamelCase (por ejemplo, `MiClase`, `CocheDeportivo`). Dentro de la clase, se definen los atributos y los métodos. Un método especial llamado `__init__` es el constructor de la clase (lo veremos en detalle más adelante). ¡Las clases son la base de la POO y nos permiten crear código más organizado y reutilizable! 🚀
''',
      'code_example': '''
# Definición de una clase simple
class Coche:
    # Atributos (características)
    marca = "Toyota"
    modelo = "Corolla"
    color = "Azul"

    # Métodos (acciones)
    def arrancar(self):
        print("El coche está arrancando")

    def acelerar(self):
        print("El coche está acelerando")

    def frenar(self):
        print("El coche está frenando")

# Ejemplo de una clase más compleja con atributos dinámicos
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def saludar(self):
        print(f"Hola, mi nombre es {self.nombre} y tengo {self.edad} años")

# Un error común es olvidar los dos puntos (:) al final de la definición de la clase (¡Cuidado!)
# class Coche
#     pass  # SyntaxError: invalid syntax
''',
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 2,
      'tittle_level': 'Programación Orientada a Objetos',
      'topic': 'Clases y Objetos',
      'subtopic': 'Creación de objetos',
      'definition': '''
Ahora que sabemos qué es una clase, hablemos de cómo crear objetos a partir de ella. Un objeto es una instancia específica de una clase. Volviendo a la analogía de las galletas, la clase es el molde, y cada galleta individual que haces con ese molde es un objeto.

Seguramente te estarás preguntando, ¿cómo se crean estos objetos? En Python, se crea un objeto llamando al nombre de la clase como si fuera una función. Por ejemplo, si tenemos una clase llamada `Coche`, podemos crear un objeto de esa clase escribiendo `mi_coche = Coche()`. Esto crea una nueva instancia de la clase `Coche` y la asigna a la variable `mi_coche`.

Profundicemos un poco. Cada objeto tiene sus propios valores para los atributos definidos en la clase. Si la clase tiene un constructor (`__init__`), puedes pasarle argumentos al crear el objeto para inicializar los atributos con valores específicos. Los objetos pueden acceder a los métodos de su clase para realizar acciones. ¡Los objetos son la esencia de la POO y nos permiten trabajar con datos y comportamientos de manera organizada! 🚀
''',
      'code_example': '''
# Definición de la clase Coche (del ejemplo anterior)
class Coche:
    def __init__(self, marca, modelo, color):
        self.marca = marca
        self.modelo = modelo
        self.color = color

    def arrancar(self):
        print(f"El coche {self.marca} {self.modelo} está arrancando")

# Creación de objetos de la clase Coche
mi_coche1 = Coche("Toyota", "Corolla", "Azul")
mi_coche2 = Coche("Honda", "Civic", "Rojo")

# Acceso a los atributos de los objetos
print(mi_coche1.marca)  # Imprime "Toyota"
print(mi_coche2.color)  # Imprime "Rojo"

# Llamada a los métodos de los objetos
mi_coche1.arrancar()  # Imprime "El coche Toyota Corolla está arrancando"

# Un error común es intentar acceder a un atributo que no existe (¡Cuidado!)
# print(mi_coche1.velocidad)  # AttributeError: 'Coche' object has no attribute 'velocidad'
''',
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 2,
      'tittle_level': 'Programación Orientada a Objetos',
      'topic': 'Clases y Objetos',
      'subtopic': 'Atributos y métodos',
      'definition': '''
Hablemos ahora de los atributos y métodos de una clase. Como mencionamos antes, los atributos son las características de un objeto, y los métodos son las acciones que puede realizar. Piensa en un objeto como un sustantivo, los atributos son los adjetivos que lo describen, y los métodos son los verbos que describen lo que hace.

Seguramente te estarás preguntando, ¿cómo se definen y se usan los atributos y métodos? Los atributos se definen como variables dentro de la clase. Pueden ser atributos de instancia (que pertenecen a cada objeto individual) o atributos de clase (que pertenecen a la clase en sí misma). Los métodos son funciones definidas dentro de la clase. El primer parámetro de un método siempre es `self`, que es una referencia al objeto que llama al método.

Profundicemos un poco. Los atributos de instancia se definen dentro del constructor (`__init__`) usando `self.nombre_del_atributo = valor`. Cada objeto tendrá su propio conjunto de valores para estos atributos. Los atributos de clase se definen fuera del constructor y son compartidos por todos los objetos de la clase. Los métodos se definen como funciones normales, pero siempre incluyen `self` como primer parámetro. Dentro de un método, puedes acceder a los atributos del objeto usando `self.nombre_del_atributo` y llamar a otros métodos del mismo objeto usando `self.nombre_del_metodo()`. ¡Los atributos y métodos son los componentes clave que definen el comportamiento y el estado de los objetos! 🚀
''',
      'code_example': '''
# Definición de la clase Coche (con atributos de clase y de instancia)
class Coche:
    # Atributo de clase
    numero_de_ruedas = 4

    def __init__(self, marca, modelo, color):
        # Atributos de instancia
        self.marca = marca
        self.modelo = modelo
        self.color = color
        self.velocidad = 0

    def arrancar(self):
        print(f"El coche {self.marca} {self.modelo} está arrancando")

    def acelerar(self, incremento):
        self.velocidad += incremento
        print(f"El coche {self.marca} {self.modelo} está acelerando a {self.velocidad} km/h")

    def frenar(self, decremento):
        self.velocidad -= decremento
        if self.velocidad < 0:
            self.velocidad = 0
        print(f"El coche {self.marca} {self.modelo} está frenando a {self.velocidad} km/h")

# Creación de un objeto
mi_coche = Coche("Toyota", "Corolla", "Azul")

# Acceso a atributos y llamada a métodos
print(mi_coche.numero_de_ruedas)  # Imprime 4 (atributo de clase)
print(mi_coche.marca)            # Imprime "Toyota" (atributo de instancia)
mi_coche.arrancar()
mi_coche.acelerar(50)
mi_coche.frenar(20)

# Un error común es olvidar el self al definir un método (¡Cuidado!)
# def arrancar():
#     print("El coche está arrancando")  # TypeError: Coche.arrancar() takes 0 positional arguments but 1 was given
''',
    },
  );

  await db.insert(
    'programming_content',
    {
      'language': 'Python',
      'module': 'Jr',
      'level': 2,
      'tittle_level': 'Programación Orientada a Objetos',
      'topic': 'Clases y Objetos',
      'subtopic': 'Constructores (init)',
      'definition': '''
Finalmente, hablemos del constructor (`__init__`) de una clase en Python. El constructor es un método especial que se llama automáticamente cuando se crea un objeto de la clase. Piensa en él como el "maestro de ceremonias" que se encarga de inicializar el objeto con los valores iniciales adecuados.

Seguramente te estarás preguntando, ¿para qué sirve exactamente el constructor? El constructor se utiliza principalmente para asignar valores iniciales a los atributos del objeto. Recibe como argumentos los valores que se pasan al crear el objeto y los asigna a los atributos usando `self.nombre_del_atributo = valor`. El primer parámetro del constructor siempre es `self`, que es una referencia al objeto que se está creando.

Profundicemos un poco. El constructor es opcional; si no defines un constructor en tu clase, Python proporcionará un constructor predeterminado que no hace nada. Sin embargo, en la mayoría de los casos, querrás definir un constructor para inicializar los objetos con los valores correctos. El constructor puede tener cualquier número de parámetros (además de `self`), lo que te permite crear objetos con diferentes estados iniciales. ¡El constructor es una parte fundamental de la creación de objetos y asegura que los objetos estén listos para usar desde el principio! 🚀
''',
      'code_example': '''
# Definición de la clase Persona (con constructor)
class Persona:
    def __init__(self, nombre, edad, ciudad):
        self.nombre = nombre
        self.edad = edad
        self.ciudad = ciudad

    def saludar(self):
        print(f"Hola, mi nombre es {self.nombre}, tengo {self.edad} años y vivo en {self.ciudad}")

# Creación de objetos de la clase Persona
persona1 = Persona("Alice", 30, "Nueva York")
persona2 = Persona("Bob", 25, "Londres")

# Llamada al método saludar de los objetos
persona1.saludar()
persona2.saludar()

# Ejemplo de una clase sin constructor (Python proporciona uno predeterminado)
class Animal:
    def hacer_sonido(self):
        print("Sonido genérico de animal")

animal = Animal()
animal.hacer_sonido()

# Un error común es escribir mal el nombre del constructor (¡Cuidado!)
# def init(self, nombre):  # Debe ser __init__
#     self.nombre = nombre
''',
    },
  );

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Pilares de la POO',
    'subtopic': 'Encapsulamiento (convención _ y __)',
    'definition': '''
El encapsulamiento es uno de los pilares fundamentales de la programación orientada a objetos. En Python, aunque no existe un mecanismo estricto para restringir el acceso a los atributos y métodos, se utilizan convenciones para indicar el nivel de acceso.

¿Te estás preguntando por qué esto importa? 

Bueno, el encapsulamiento te permite proteger los datos internos de una clase, evitando que sean modificados accidentalmente desde fuera de la misma. Esto ayuda a mantener la integridad de los datos y facilita el mantenimiento del código.

En Python, se utilizan las siguientes convenciones:

- Un solo guion bajo (`_atributo`) indica que el atributo o método es de uso interno y no debe ser accedido directamente desde fuera de la clase.
- Dos guiones bajos (`__atributo`) activan el name mangling, lo que cambia el nombre del atributo internamente para evitar colisiones en clases heredadas.

Estas convenciones no impiden el acceso, pero sirven como una señal para los desarrolladores sobre cómo deben interactuar con los componentes de una clase.
''',
    'code_example': '''
class CuentaBancaria:
    def __init__(self, titular, saldo):
        self.titular = titular
        self._saldo = saldo  # Convención de atributo protegido
        self.__numero_cuenta = "123456789"  # Name mangling para atributo privado

    def mostrar_saldo(self):
        print(f"Saldo disponible: {self._saldo}")

cuenta = CuentaBancaria("Ana", 1000)
cuenta.mostrar_saldo()  # Salida: Saldo disponible: 1000

# Acceso directo al atributo protegido (no recomendado)
print(cuenta._saldo)  # Salida: 1000

# Intento de acceso al atributo privado
# print(cuenta.__numero_cuenta)  # Esto generará un error

# Acceso al atributo privado mediante name mangling
print(cuenta._CuentaBancaria__numero_cuenta)  # Salida: 123456789
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Pilares de la POO',
    'subtopic': 'Herencia (super())',
    'definition': '''
La herencia permite crear nuevas clases basadas en clases existentes, reutilizando su código y extendiendo su funcionalidad. En Python, la función `super()` se utiliza para llamar a métodos de la clase padre desde una clase hija.

¿Te estás preguntando por qué esto importa? 

Bueno, la herencia te permite escribir código más limpio y evitar la duplicación, facilitando la escalabilidad y el mantenimiento de tus programas.

Al utilizar `super()`, puedes acceder a métodos y atributos de la clase padre sin necesidad de referenciarla directamente por su nombre. Esto es especialmente útil en entornos con múltiples niveles de herencia, ya que hace que el código sea más flexible y menos propenso a errores.

Por ejemplo, si tienes una clase `Animal` con un método `hablar()`, y una clase `Perro` que hereda de `Animal`, puedes utilizar `super().hablar()` dentro de `Perro` para llamar al método de la clase padre y luego agregar comportamiento adicional.
''',
    'code_example': '''
class Animal:
    def __init__(self, nombre):
        self.nombre = nombre

    def hablar(self):
        print(f"{self.nombre} hace un sonido.")

class Perro(Animal):
    def __init__(self, nombre, raza):
        super().__init__(nombre)
        self.raza = raza

    def hablar(self):
        super().hablar()
        print(f"{self.nombre} ladra.")

perro = Perro("Fido", "Labrador")
perro.hablar()
# Salida:
# Fido hace un sonido.
# Fido ladra.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Pilares de la POO',
    'subtopic': 'Polimorfismo',
    'definition': '''
El polimorfismo permite que diferentes clases respondan a la misma interfaz o método de manera distinta. En otras palabras, puedes llamar al mismo método en diferentes objetos y obtener comportamientos específicos según la clase del objeto.

¿Te estás preguntando por qué esto importa? 

Bueno, el polimorfismo te permite escribir código más flexible y reutilizable, ya que puedes diseñar funciones que operen con objetos de diferentes clases, siempre que implementen ciertos métodos.

En Python, el polimorfismo se logra mediante la sobreescritura de métodos en clases derivadas. Por ejemplo, si tienes una clase `Animal` con un método `hablar()`, y clases `Perro` y `Gato` que heredan de `Animal`, cada una puede implementar su propia versión de `hablar()`. Al llamar a `hablar()` en una instancia de `Perro` o `Gato`, se ejecutará el método correspondiente a la clase del objeto.
''',
    'code_example': '''
class Animal:
    def hablar(self):
        print("El animal hace un sonido.")

class Perro(Animal):
    def hablar(self):
        print("El perro ladra.")

class Gato(Animal):
    def hablar(self):
        print("El gato maúlla.")

def hacer_hablar(animal):
    animal.hablar()

animales = [Perro(), Gato(), Animal()]
for animal in animales:
    hacer_hablar(animal)
# Salida:
# El perro ladra.
# El gato maúlla.
# El animal hace un sonido.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Pilares de la POO',
    'subtopic': 'Métodos especiales (str, repr, etc.)',
    'definition': '''
Los métodos especiales en Python, también conocidos como "dunder methods" (por los dobles guiones bajos), permiten definir comportamientos personalizados para objetos de tus clases. Entre los más comunes están `__str__()` y `__repr__()`.

¿Te estás preguntando por qué esto importa? 

Bueno, estos métodos te permiten controlar cómo se representan tus objetos como cadenas de texto, lo cual es útil para la depuración y la presentación de información al usuario.

- `__str__()`: Define la representación informal de un objeto, utilizada por la función `print()` y `str()`. Debería devolver una cadena legible para el usuario final.
- `__repr__()`: Define la representación oficial de un objeto, utilizada por la función `repr()`. Debería devolver una cadena que, idealmente, pueda ser utilizada para recrear el objeto.

Implementar estos métodos en tus clases mejora la legibilidad y facilita el trabajo con tus objetos, especialmente durante la depuración.
''',
    'code_example': '''
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __str__(self):
        return f"{self.nombre}, {self.edad} años"

    def __repr__(self):
        return f"Persona('{self.nombre}', {self.edad})"

persona = Persona("Ana", 30)
print(str(persona))   # Salida: Ana, 30 años
print(repr(persona))  # Salida: Persona('Ana', 30)
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Conceptos Avanzados',
    'subtopic': 'Decoradores (@)',
    'definition': '''
Los decoradores en Python son una herramienta poderosa que permite modificar o extender el comportamiento de funciones o métodos sin alterar su código original. Se representan con el símbolo `@` seguido del nombre del decorador y se colocan justo encima de la definición de la función o método que se desea decorar.

¿Te estás preguntando por qué esto importa? 

Bueno, los decoradores son ampliamente utilizados en frameworks como Flask y Django para tareas como la gestión de rutas o la autenticación de usuarios. También son útiles para añadir funcionalidades como el registro de eventos, la medición de tiempos de ejecución o la validación de datos, todo sin modificar el código base de las funciones.

Un decorador es, en esencia, una función que recibe otra función como argumento y devuelve una nueva función que amplía o modifica el comportamiento de la original. Esta capacidad de abstracción y reutilización hace que los decoradores sean una herramienta esencial para escribir código limpio y mantenible.
''',
    'code_example': '''
def decorador_saludo(funcion_original):
    def nueva_funcion():
        print("Hola, antes de la función original.")
        funcion_original()
        print("Adiós, después de la función original.")
    return nueva_funcion

@decorador_saludo
def funcion_principal():
    print("Esta es la función principal.")

funcion_principal()
# Salida:
# Hola, antes de la función original.
# Esta es la función principal.
# Adiós, después de la función original.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Conceptos Avanzados',
    'subtopic': 'Properties',
    'definition': '''
Las properties en Python permiten controlar el acceso y modificación de atributos de una clase mediante métodos especiales, sin cambiar la interfaz pública de la clase. Utilizando el decorador `@property`, puedes definir métodos que se comportan como atributos, lo que facilita la encapsulación y la validación de datos.

¿Te estás preguntando por qué esto importa? 

Bueno, las properties te permiten agregar lógica adicional al acceso o modificación de atributos sin que el usuario de la clase tenga que cambiar la forma en que interactúa con ella. Esto es especialmente útil cuando necesitas validar datos, calcular valores dinámicamente o mantener la compatibilidad con versiones anteriores de tu código.

Al definir una property, puedes crear métodos getter, setter y deleter para un atributo, lo que te brinda un control total sobre su comportamiento. Esto mejora la mantenibilidad y la claridad de tu código.
''',
    'code_example': '''
class Circulo:
    def __init__(self, radio):
        self._radio = radio

    @property
    def radio(self):
        return self._radio

    @radio.setter
    def radio(self, valor):
        if valor <= 0:
            raise ValueError("El radio debe ser positivo.")
        self._radio = valor

    @property
    def area(self):
        import math
        return math.pi * (self._radio ** 2)

c = Circulo(5)
print(c.area)  # Salida: 78.53981633974483
c.radio = 10
print(c.area)  # Salida: 314.1592653589793
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Conceptos Avanzados',
    'subtopic': 'Clases abstractas (abc module)',
    'definition': '''
Las clases abstractas en Python, proporcionadas por el módulo `abc`, permiten definir interfaces comunes para un conjunto de clases relacionadas. Una clase abstracta puede contener métodos abstractos que deben ser implementados por cualquier clase que la herede, asegurando así una estructura coherente en la jerarquía de clases.

¿Te estás preguntando por qué esto importa? 

Bueno, las clases abstractas son útiles cuando deseas establecer un contrato que todas las subclases deben cumplir. Esto es especialmente valioso en sistemas grandes y complejos, donde mantener una arquitectura coherente es crucial.

Para definir una clase abstracta, se hereda de `ABC` y se utilizan los decoradores `@abstractmethod` para marcar los métodos que deben ser implementados por las subclases. Esto ayuda a prevenir errores y facilita la comprensión del diseño del sistema.
''',
    'code_example': '''
from abc import ABC, abstractmethod

class Animal(ABC):
    @abstractmethod
    def hacer_sonido(self):
        pass

class Perro(Animal):
    def hacer_sonido(self):
        return "Guau"

class Gato(Animal):
    def hacer_sonido(self):
        return "Miau"

perro = Perro()
print(perro.hacer_sonido())  # Salida: Guau

gato = Gato()
print(gato.hacer_sonido())  # Salida: Miau
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos',
    'topic': 'Conceptos Avanzados',
    'subtopic': 'Dataclasses (Python 3.7+)',
    'definition': '''
Las dataclasses, introducidas en Python 3.7, son una forma concisa y eficiente de crear clases que principalmente almacenan datos. Al utilizar el decorador `@dataclass`, Python genera automáticamente métodos especiales como `__init__`, `__repr__` y `__eq__`, lo que reduce la cantidad de código repetitivo y mejora la legibilidad.

¿Te estás preguntando por qué esto importa? 

Bueno, las dataclasses simplifican la creación de clases de datos, lo que es especialmente útil en aplicaciones que manejan grandes cantidades de información estructurada, como en el procesamiento de datos o en APIs.

Además, las dataclasses permiten definir atributos con tipos específicos y valores predeterminados, y ofrecen opciones avanzadas como la inmutabilidad y la ordenación automática, lo que las convierte en una herramienta poderosa para el desarrollo moderno en Python.
''',
    'code_example': '''
from dataclasses import dataclass

@dataclass
class Persona:
    nombre: str
    edad: int
    ciudad: str = "Lima"

p = Persona("Ana", 30)
print(p)  # Salida: Persona(nombre='Ana', edad=30, ciudad='Lima')
'''
  });
}

Future<void> insertPythonJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Estructuras de Datos',
    'subtopic': 'Listas y operaciones',
    'definition': '''
Las listas en Python son colecciones ordenadas y mutables que permiten almacenar múltiples elementos, incluso de diferentes tipos. Son una de las estructuras de datos más versátiles y ampliamente utilizadas en Python.

¿Te estás preguntando por qué esto importa? 

Bueno, las listas te permiten almacenar y manipular conjuntos de datos de manera eficiente. Puedes agregar, eliminar o modificar elementos fácilmente, lo que las hace ideales para tareas como el procesamiento de datos, la implementación de algoritmos y la gestión de colecciones dinámicas.

Algunas operaciones comunes con listas incluyen:

- `append()`: Agrega un elemento al final de la lista.
- `extend()`: Agrega todos los elementos de una lista al final de otra.
- `insert()`: Inserta un elemento en una posición específica.
- `remove()`: Elimina la primera aparición de un elemento.
- `pop()`: Elimina y devuelve el último elemento (o uno en una posición específica).
- `sort()`: Ordena la lista en su lugar.
- `reverse()`: Invierte el orden de los elementos en la lista.
- `len()`: Devuelve la cantidad de elementos en la lista.
- `sum()`: Devuelve la suma de los elementos numéricos de la lista.
- `max()` y `min()`: Devuelven el valor máximo y mínimo de la lista, respectivamente.
''',
    'code_example': '''
# Crear una lista
numeros = [3, 1, 4, 1, 5, 9]

# Agregar un elemento al final
numeros.append(2)

# Insertar un elemento en la posición 2
numeros.insert(2, 6)

# Eliminar el primer elemento con valor 1
numeros.remove(1)

# Ordenar la lista
numeros.sort()

# Invertir el orden de la lista
numeros.reverse()

# Mostrar la lista resultante
print(numeros)  # Salida: [9, 6, 5, 4, 3, 2, 1]
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Estructuras de Datos',
    'subtopic': 'Tuplas (inmutables)',
    'definition': '''
Las tuplas en Python son colecciones ordenadas e inmutables de elementos. Se utilizan cuando se desea almacenar una secuencia de elementos que no deben cambiar a lo largo del tiempo.

¿Te estás preguntando por qué esto importa? 

Bueno, al ser inmutables, las tuplas pueden ser utilizadas como claves en diccionarios y elementos de conjuntos, lo que no es posible con listas. Además, su inmutabilidad proporciona una mayor seguridad y puede mejorar el rendimiento en ciertas situaciones.

Las tuplas se definen utilizando paréntesis `()` o simplemente separando los elementos por comas. Aunque no se pueden modificar después de su creación, es posible acceder a sus elementos mediante índices, al igual que con las listas.
''',
    'code_example': '''
# Crear una tupla
coordenadas = (10, 20)

# Acceder a los elementos
x = coordenadas[0]
y = coordenadas[1]

print(f"Coordenadas: x={x}, y={y}")  # Salida: Coordenadas: x=10, y=20

# Intentar modificar un elemento (esto generará un error)
# coordenadas[0] = 15  # TypeError: 'tuple' object does not support item assignment
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Estructuras de Datos',
    'subtopic': 'Conjuntos (sets)',
    'definition': '''
Los conjuntos en Python, conocidos como `sets`, son colecciones desordenadas de elementos únicos. Se utilizan cuando se necesita almacenar elementos sin duplicados y realizar operaciones matemáticas como uniones, intersecciones y diferencias.

¿Te estás preguntando por qué esto importa? 

Bueno, los conjuntos son ideales para eliminar duplicados de una colección, verificar la pertenencia de elementos y realizar operaciones de teoría de conjuntos de manera eficiente.

Los conjuntos se definen utilizando llaves `{}` o la función `set()`. Al ser desordenados, no mantienen el orden de inserción de los elementos.
''',
    'code_example': '''
# Crear un conjunto
frutas = {"manzana", "banana", "cereza"}

# Agregar un elemento
frutas.add("naranja")

# Eliminar un elemento
frutas.remove("banana")

# Verificar si un elemento está en el conjunto
print("manzana" in frutas)  # Salida: True

# Mostrar el conjunto resultante
print(frutas)  # Salida: {'manzana', 'naranja', 'cereza'}
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Estructuras de Datos',
    'subtopic': 'Diccionarios y operaciones',
    'definition': '''
Los diccionarios en Python son colecciones no ordenadas de pares clave-valor. Se utilizan para almacenar datos que se pueden asociar mediante una clave única, lo que permite un acceso eficiente a los valores correspondientes.

¿Te estás preguntando por qué esto importa? 

Bueno, los diccionarios son ideales para representar datos estructurados, como registros de bases de datos, configuraciones y cualquier otro tipo de información que requiera una asociación clara entre claves y valores.

Los diccionarios se definen utilizando llaves `{}` con pares clave-valor separados por dos puntos `:`. Algunas operaciones comunes incluyen:

- Acceder a un valor mediante su clave.
- Agregar o actualizar pares clave-valor.
- Eliminar pares clave-valor.
- Iterar sobre claves, valores o ambos.
''',
    'code_example': '''
# Crear un diccionario
persona = {
    "nombre": "Ana",
    "edad": 30,
    "ciudad": "Lima"
}

# Acceder a un valor
print(persona["nombre"])  # Salida: Ana

# Agregar una nueva clave-valor
persona["profesion"] = "Ingeniera"

# Actualizar un valor existente
persona["edad"] = 31

# Eliminar una clave-valor
del persona["ciudad"]

# Iterar sobre claves y valores
for clave, valor in persona.items():
    print(f"{clave}: {valor}")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Strings y Manipulación',
    'subtopic': 'Métodos de strings',
    'definition': '''
Los métodos de strings en Python son funciones integradas que permiten manipular y analizar cadenas de texto de manera eficiente. Estos métodos no modifican la cadena original, sino que devuelven nuevas cadenas con las transformaciones aplicadas.

¿Te estás preguntando por qué esto importa? 

Bueno, dominar estos métodos es esencial para tareas comunes como la limpieza de datos, la validación de entradas y la generación de informes. Por ejemplo, puedes convertir texto a mayúsculas con `.upper()`, eliminar espacios innecesarios con `.strip()` o reemplazar caracteres específicos con `.replace()`.

Algunos métodos comunes incluyen:

- `upper()`: Convierte todos los caracteres a mayúsculas.
- `lower()`: Convierte todos los caracteres a minúsculas.
- `strip()`: Elimina espacios en blanco al inicio y al final de la cadena.
- `replace()`: Reemplaza una subcadena por otra.
- `split()`: Divide la cadena en una lista utilizando un separador.
- `join()`: Une una lista de cadenas en una sola cadena, utilizando un separador.
- `find()`: Devuelve el índice de la primera aparición de una subcadena.
- `startswith()` y `endswith()`: Verifican si la cadena comienza o termina con una subcadena específica.
''',
    'code_example': '''
texto = "  Hola Mundo  "

# Convertir a mayúsculas
print(texto.upper())  # Salida: "  HOLA MUNDO  "

# Eliminar espacios al inicio y al final
print(texto.strip())  # Salida: "Hola Mundo"

# Reemplazar "Mundo" por "Python"
print(texto.replace("Mundo", "Python"))  # Salida: "  Hola Python  "

# Dividir la cadena en palabras
palabras = texto.strip().split()
print(palabras)  # Salida: ['Hola', 'Mundo']

# Unir las palabras con un guión
nueva_cadena = "-".join(palabras)
print(nueva_cadena)  # Salida: "Hola-Mundo"
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Strings y Manipulación',
    'subtopic': 'Formateo (f-strings, .format())',
    'definition': '''
El formateo de cadenas en Python permite insertar valores dinámicos dentro de cadenas de texto. Las dos técnicas más comunes son las f-strings y el método `.format()`.

¿Te estás preguntando por qué esto importa? 

Bueno, estas técnicas son fundamentales para generar mensajes personalizados, informes y salidas legibles. Las f-strings, introducidas en Python 3.6, ofrecen una sintaxis concisa y legible para incluir expresiones dentro de cadenas. Por otro lado, `.format()` proporciona una forma más flexible y compatible con versiones anteriores de Python.

Ejemplos de uso:

- **f-strings**: `f"Hola, {nombre}!"`
- **.format()**: `"Hola, {}!".format(nombre)`
''',
    'code_example': '''
nombre = "Ana"
edad = 30

# Usando f-strings
print(f"Hola, {nombre}. Tienes {edad} años.")  # Salida: Hola, Ana. Tienes 30 años.

# Usando .format()
print("Hola, {}. Tienes {} años.".format(nombre, edad))  # Salida: Hola, Ana. Tienes 30 años.

# Formateo con especificadores
pi = 3.14159
print(f"El valor de pi es aproximadamente {pi:.2f}")  # Salida: El valor de pi es aproximadamente 3.14
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Strings y Manipulación',
    'subtopic': 'Expresiones regulares básicas (re module)',
    'definition': '''
Las expresiones regulares (regex) en Python, proporcionadas por el módulo `re`, son herramientas poderosas para buscar, coincidir y manipular patrones dentro de cadenas de texto.

¿Te estás preguntando por qué esto importa? 

Bueno, las expresiones regulares son esenciales para tareas como la validación de formatos (por ejemplo, correos electrónicos, números de teléfono), la extracción de información específica y la limpieza de datos. Permiten definir patrones complejos de búsqueda utilizando una sintaxis concisa.

Funciones comunes del módulo `re`:

- `re.search()`: Busca una coincidencia en cualquier parte de la cadena.
- `re.match()`: Verifica si la cadena comienza con el patrón.
- `re.findall()`: Devuelve todas las coincidencias del patrón en la cadena.
- `re.sub()`: Reemplaza las coincidencias del patrón con una cadena específica.
''',
    'code_example': '''
import re

texto = "Mi correo es ejemplo@dominio.com y mi número es 123-456-7890."

# Buscar una dirección de correo electrónico
correo = re.search(r'[\w\.-]+@[\w\.-]+', texto)
if correo:
    print(f"Correo encontrado: {correo.group()}")  # Salida: Correo encontrado: ejemplo@dominio.com

# Buscar todos los números de teléfono con el formato xxx-xxx-xxxx
telefonos = re.findall(r'\d{3}-\d{3}-\d{4}', texto)
print(f"Números encontrados: {telefonos}")  # Salida: Números encontrados: ['123-456-7890']
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Manejo de Archivos',
    'subtopic': 'open(), read(), write()',
    'definition': '''
En Python, la función `open()` se utiliza para abrir archivos y permite realizar operaciones de lectura y escritura. Los modos comunes de apertura incluyen:

- `'r'`: Lectura (modo predeterminado).
- `'w'`: Escritura (crea un archivo nuevo o sobrescribe uno existente).
- `'a'`: Añadir (agrega contenido al final del archivo).
- `'b'`: Modo binario (por ejemplo, `'rb'` o `'wb'`).

¿Te estás preguntando por qué esto importa? 

Bueno, comprender cómo abrir y manipular archivos es fundamental para tareas como el procesamiento de datos, la lectura de configuraciones y la generación de informes. Por ejemplo, puedes leer un archivo de texto línea por línea para analizar su contenido o escribir resultados de un programa en un archivo para su posterior revisión.

Es importante cerrar los archivos después de su uso para liberar recursos del sistema. Esto se puede hacer utilizando el método `close()` o, preferiblemente, mediante un administrador de contexto (`with`), que cierra automáticamente el archivo al finalizar el bloque de código.
''',
    'code_example': '''
# Abrir un archivo para lectura
archivo = open('ejemplo.txt', 'r')
contenido = archivo.read()
print(contenido)
archivo.close()

# Abrir un archivo para escritura
archivo = open('salida.txt', 'w')
archivo.write('Hola, mundo!')
archivo.close()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Manejo de Archivos',
    'subtopic': 'Context managers (with)',
    'definition': '''
El uso de un administrador de contexto (`with`) en Python proporciona una forma eficiente y segura de manejar recursos como archivos. Al utilizar `with`, el archivo se abre y se cierra automáticamente, incluso si ocurre una excepción durante la ejecución del bloque de código.

¿Te estás preguntando por qué esto importa? 

Bueno, el uso de `with` garantiza que los archivos se cierren correctamente, lo que previene posibles pérdidas de datos o bloqueos de archivos. Por ejemplo, al leer un archivo de configuración, `with` asegura que el archivo se cierre adecuadamente después de la lectura, incluso si se produce un error durante el procesamiento del contenido.

Esta práctica es recomendada para evitar errores comunes relacionados con la gestión manual de recursos.
''',
    'code_example': '''
# Leer un archivo utilizando with
with open('ejemplo.txt', 'r') as archivo:
    contenido = archivo.read()
    print(contenido)

# Escribir en un archivo utilizando with
with open('salida.txt', 'w') as archivo:
    archivo.write('Hola, mundo!')
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
    'topic': 'Manejo de Archivos',
    'subtopic': 'CSV, JSON básico',
    'definition': '''
Python proporciona módulos integrados para trabajar con archivos CSV y JSON, que son formatos comunes para el almacenamiento y el intercambio de datos.

- **CSV (Comma-Separated Values)**: Utilizado para representar datos tabulares. El módulo `csv` permite leer y escribir archivos CSV de manera eficiente.

- **JSON (JavaScript Object Notation)**: Formato ligero de intercambio de datos. El módulo `json` permite la serialización y deserialización de datos JSON, facilitando la conversión entre objetos de Python y cadenas JSON.

¿Te estás preguntando por qué esto importa? 

Bueno, la capacidad de manejar archivos CSV y JSON es esencial para interactuar con diversas fuentes de datos, como bases de datos, APIs y hojas de cálculo. Por ejemplo, puedes leer un archivo CSV que contiene registros de usuarios para procesarlos en tu aplicación, o guardar la configuración de tu programa en un archivo JSON para facilitar su carga y modificación.
''',
    'code_example': '''
import csv
import json

# Leer un archivo CSV
with open('datos.csv', 'r') as archivo_csv:
    lector = csv.reader(archivo_csv)
    for fila in lector:
        print(fila)

# Escribir en un archivo CSV
with open('salida.csv', 'w', newline='') as archivo_csv:
    escritor = csv.writer(archivo_csv)
    escritor.writerow(['Nombre', 'Edad'])
    escritor.writerow(['Ana', 30])

# Leer un archivo JSON
with open('datos.json', 'r') as archivo_json:
    datos = json.load(archivo_json)
    print(datos)

# Escribir en un archivo JSON
datos = {'nombre': 'Ana', 'edad': 30}
with open('salida.json', 'w') as archivo_json:
    json.dump(datos, archivo_json)
'''
  });
}

Future<void> insertPythonJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic': 'Jerarquía de excepciones',
    'definition': '''
En Python, las excepciones están organizadas en una jerarquía de clases. La clase base de todas las excepciones es la clase `BaseException`, y la mayoría de las excepciones que normalmente encontramos heredan de la clase `Exception`, que a su vez hereda de `BaseException`.

¿Te estás preguntando por qué esto importa?

Comprender la jerarquía de excepciones es crucial para manejar los errores de manera efectiva. Te permite capturar tipos específicos de excepciones o capturar grupos más amplios de excepciones según su clase padre. Esto proporciona flexibilidad y control sobre cómo responde tu programa a diferentes situaciones excepcionales.

Algunos puntos clave sobre la jerarquía:

- `BaseException`: La clase base para todas las excepciones.
- `Exception`: La clase base para la mayoría de las excepciones incorporadas.
- Las excepciones más específicas (como `TypeError`, `ValueError`, `IOError`, etc.) heredan de `Exception`.
''',
    'code_example': '''
try:
    # Código que puede lanzar una excepción
    resultado = 10 / 0  # Esto lanzará una ZeroDivisionError
except ZeroDivisionError as e:
    print(f"Error: No se puede dividir por cero. Detalles: {e}")
except Exception as e:
    print(f"Ocurrió una excepción general: {e}")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic': 'Common exceptions (ValueError, TypeError, etc.)',
    'definition': '''
Python tiene varias excepciones incorporadas que se lanzan cuando ocurren ciertos tipos de errores. Estas excepciones comunes cubren una amplia gama de situaciones problemáticas que pueden surgir durante la ejecución del programa.

¿Te estás preguntando por qué esto importa?

Conocer estas excepciones te permite anticipar y manejar errores específicos de manera más precisa, mejorando la robustez y la confiabilidad de tu código.

Algunas excepciones comunes incluyen:

- `TypeError`: Se lanza cuando una operación o función se aplica a un objeto de un tipo inapropiado.
- `ValueError`: Se lanza cuando una función recibe un argumento del tipo correcto pero con un valor inapropiado.
- `IndexError`: Se lanza cuando se intenta acceder a un índice que está fuera del rango de una secuencia (como una lista o tupla).
- `KeyError`: Se lanza cuando se intenta acceder a una clave que no existe en un diccionario.
- `FileNotFoundError`: Se lanza cuando se intenta abrir un archivo que no existe.
''',
    'code_example': '''
try:
    numero = int("abc")  # Esto lanzará un ValueError
except ValueError:
    print("Error: Entrada inválida. Se esperaba un número.")

try:
    lista = [1, 2, 3]
    print(lista[5])      # Esto lanzará un IndexError
except IndexError:
    print("Error: Índice fuera de rango.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic': 'Excepciones personalizadas',
    'definition': '''
Además de las excepciones incorporadas, Python te permite definir tus propias excepciones personalizadas. Esto es útil cuando quieres señalar condiciones de error específicas que son únicas para tu aplicación.

¿Te estás preguntando por qué esto importa?

Las excepciones personalizadas hacen que tu código sea más legible y mantenible, ya que proporcionan nombres claros y descriptivos para los errores que pueden ocurrir. También te permiten organizar tus excepciones en una jerarquía que se ajuste a las necesidades de tu aplicación.

Para crear una excepción personalizada, simplemente define una nueva clase que herede de la clase `Exception` (o de alguna otra clase de excepción apropiada).
''',
    'code_example': '''
class ErrorPersonalizado(Exception):
    def __init__(self, mensaje):
        self.mensaje = mensaje

try:
    raise ErrorPersonalizado("Este es un error personalizado.")
except ErrorPersonalizado as e:
    print(f"¡Ocurrió un error! {e.mensaje}")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Try-except-else-finally',
    'definition': '''
La estructura `try-except-else-finally` en Python es fundamental para el manejo de excepciones. Permite ejecutar código que podría generar errores (`try`), capturar y manejar esos errores (`except`), ejecutar código si no ocurre ninguna excepción (`else`), y ejecutar código que siempre debe realizarse, independientemente de si hubo o no una excepción (`finally`).

¿Te estás preguntando por qué esto importa?

Esta estructura proporciona un control robusto sobre el flujo de ejecución de tu programa en presencia de posibles errores. Asegura que los recursos se liberen correctamente (como archivos cerrados) y que se ejecuten acciones necesarias sin importar si el código principal tuvo éxito o no.

- `try`: El bloque de código donde puede ocurrir una excepción.
- `except`: Uno o más bloques que especifican cómo manejar diferentes tipos de excepciones.
- `else`: Un bloque opcional que se ejecuta si el bloque `try` no lanza ninguna excepción.
- `finally`: Un bloque opcional que siempre se ejecuta, después del bloque `try` (y cualquier bloque `except` o `else`).
''',
    'code_example': '''
try:
    archivo = open("mi_archivo.txt", "r")
    contenido = archivo.read()
    # Procesar el contenido
except FileNotFoundError:
    print("Error: El archivo no fue encontrado.")
except Exception as e:
    print(f"Ocurrió otro error: {e}")
else:
    print("El archivo fue leído correctamente.")
finally:
    if 'archivo' in locals() and not archivo.closed:
        archivo.close()
        print("El archivo fue cerrado.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Raise exceptions',
    'definition': '''
La sentencia `raise` en Python se utiliza para generar explícitamente una excepción. Puedes usarla para lanzar una excepción incorporada o una excepción personalizada que hayas definido.

¿Te estás preguntando por qué esto importa?

Generar excepciones es útil en varias situaciones:

- Para indicar que ha ocurrido una condición de error específica en tu código.
- Para propagar una excepción que capturaste pero que no puedes manejar completamente en el bloque `except` actual.
- Para probar tu código de manejo de excepciones.

Al usar `raise`, puedes controlar el flujo de error de tu programa y asegurarte de que las condiciones excepcionales se señalen adecuadamente.
''',
    'code_example': '''
def dividir(a, b):
    if b == 0:
        raise ZeroDivisionError("¡No se puede dividir por cero!")
    return a / b

try:
    resultado = dividir(10, 0)
    print(resultado)
except ZeroDivisionError as e:
    print(f"Error: {e}")

class ErrorDeValidacion(Exception):
    pass

def validar_entrada(dato):
    if not isinstance(dato, int):
        raise ErrorDeValidacion("La entrada debe ser un número entero.")

try:
    validar_entrada("hola")
except ErrorDeValidacion as e:
    print(f"Error de validación: {e}")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Tracebacks',
    'definition': '''
Un "traceback" (o rastreo de pila) es un informe que muestra la secuencia de llamadas a funciones que llevaron a una excepción. Cuando ocurre una excepción que no se maneja, Python imprime un traceback que indica dónde ocurrió el error y la ruta de las llamadas de función que se realizaron hasta ese punto.

¿Te estás preguntando por qué esto importa?

Los tracebacks son herramientas de depuración esenciales. Proporcionan información crucial para entender la causa de un error y dónde ocurrió exactamente en tu código. Al analizar un traceback, puedes identificar la función donde se originó la excepción y la secuencia de llamadas que la precedieron, lo que facilita la localización y corrección de errores.

Un traceback típicamente incluye:

- El tipo de excepción que ocurrió.
- El mensaje de la excepción.
- La ubicación del archivo y el número de línea donde ocurrió la excepción.
- La pila de llamadas, mostrando la secuencia de funciones que se estaban ejecutando en el momento de la excepción.
''',
    'code_example': '''
def funcion_c():
    return 10 / 0

def funcion_b():
    return funcion_c()

def funcion_a():
    return funcion_b()

try:
    resultado = funcion_a()
    print(resultado)
except ZeroDivisionError:
    import traceback
    traceback.print_exc()
    # La salida mostrará la secuencia de llamadas:
    # Traceback (most recent call last):
    #   File "<stdin>", line 11, in <module>
    #   File "<stdin>", line 9, in funcion_a
    #   File "<stdin>", line 7, in funcion_b
    #   File "<stdin>", line 3, in funcion_c
    # ZeroDivisionError: division by zero
'''
  });
}

Future<void> insertPythonJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Instalación de Python',
    'definition': '''
Para comenzar a programar en Python, lo primero que necesitas es tenerlo instalado en tu sistema. Afortunadamente, la instalación es un proceso sencillo y bien documentado.

¿Te estás preguntando cómo se hace?

Primero, visita el sitio web oficial de Python (python.org) y descarga la versión más reciente estable para tu sistema operativo (Windows, macOS o Linux). El sitio web proporciona instaladores y guías detalladas para cada plataforma.

Una vez descargado, ejecuta el instalador y sigue las instrucciones. Es importante asegurarte de que la opción "Add Python to PATH" esté marcada (especialmente en Windows), ya que esto facilita el acceso a Python desde la línea de comandos.

Después de la instalación, puedes verificar que todo esté correcto abriendo la terminal o el símbolo del sistema y ejecutando el comando `python --version` o `python3 --version`. Esto debería mostrar la versión de Python que has instalado.
''',
    'code_example': '''
# Verificar la instalación de Python (en la terminal)
# Windows:
# python --version
# macOS/Linux:
# python3 --version

# Ejemplo de salida:
# Python 3.9.6
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'PIP y entornos virtuales (venv)',
    'definition': '''
Python incluye una herramienta llamada `pip` (Python Package Installer) que se utiliza para instalar y gestionar paquetes de terceros. Además, los entornos virtuales son una forma de crear espacios aislados para proyectos de Python, lo que evita conflictos entre dependencias de diferentes proyectos.

¿Te estás preguntando por qué son importantes?

`pip` simplifica la instalación de bibliotecas y frameworks (como Django o Flask) que extienden la funcionalidad de Python. Los entornos virtuales, creados con la biblioteca `venv`, aseguran que cada proyecto tenga sus propias dependencias, sin interferir con las de otros proyectos o con el sistema operativo.

Para crear un entorno virtual, se utiliza el módulo `venv`. Una vez activado, `pip` instalará los paquetes dentro de ese entorno.
''',
    'code_example': '''
# Crear un entorno virtual (en la terminal)
# python3 -m venv .venv  # Crea un entorno en el directorio .venv

# Activar el entorno virtual (en la terminal)
# Windows:
# .venv\\Scripts\\activate
# macOS/Linux:
# source .venv/bin/activate

# Instalar un paquete (dentro del entorno virtual activo)
# pip install requests

# Desactivar el entorno virtual (en la terminal)
# deactivate
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'IDEs (PyCharm, VSCode)',
    'definition': '''
Un IDE (Integrated Development Environment) es una aplicación de software que proporciona herramientas para el desarrollo de software. Los IDEs pueden facilitar significativamente la escritura, depuración y gestión de código.

¿Te estás preguntando cuáles son los más populares para Python?

Dos de los IDEs más populares para Python son PyCharm y VSCode (Visual Studio Code).

- **PyCharm:** Es un IDE dedicado a Python, desarrollado por JetBrains. Ofrece características avanzadas como autocompletado de código, depuración integrada, control de versiones y soporte para frameworks como Django.

- **VSCode:** Es un editor de código desarrollado por Microsoft que, mediante extensiones, se puede convertir en un poderoso IDE para Python. Es altamente personalizable y cuenta con una gran comunidad y un amplio ecosistema de extensiones.

Ambos IDEs son excelentes opciones, y la elección entre uno u otro a menudo depende de las preferencias personales.
''',
    'code_example': '''
# Este no es código ejecutable, sino una referencia a herramientas de desarrollo.
# Los IDEs se utilizan para escribir y ejecutar código, no se ejecutan dentro del código.
# Ejemplo de código que podrías escribir en un IDE:

# print("Hola desde el IDE")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Ejecución desde terminal',
    'definition': '''
Además de usar un IDE, también puedes ejecutar scripts de Python directamente desde la terminal o el símbolo del sistema. Esto es útil para automatizar tareas, ejecutar scripts simples o integrar Python en flujos de trabajo de línea de comandos.

¿Te estás preguntando cómo se hace?

Para ejecutar un script de Python, simplemente abres la terminal, navegas hasta el directorio donde se encuentra el script y ejecutas el comando `python` (o `python3` en algunos sistemas) seguido del nombre del archivo del script.

Por ejemplo, si tienes un archivo llamado `mi_script.py`, lo ejecutarías con el comando `python mi_script.py`.

También puedes pasar argumentos al script a través de la línea de comandos, que luego puedes acceder dentro del script utilizando el módulo `sys`.
''',
    'code_example': '''
# Contenido del archivo mi_script.py:
# import sys
# print("Argumentos de la línea de comandos:", sys.argv)

# Ejecución en la terminal:
# python mi_script.py arg1 arg2 arg3

# Ejemplo de salida:
# Argumentos de la línea de comandos: ['mi_script.py', 'arg1', 'arg2', 'arg3']
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': 'Git básico',
    'definition': '''
Git es un sistema de control de versiones distribuido que permite realizar un seguimiento de los cambios en el código fuente durante el desarrollo de software. Es una herramienta esencial para la colaboración y la gestión de proyectos.

¿Te estás preguntando por qué es tan importante?

Git te permite:

-   Llevar un registro de cada modificación realizada en el código.
-   Volver a versiones anteriores del código si es necesario.
-   Trabajar en diferentes características o correcciones de errores simultáneamente (mediante ramas).
-   Colaborar con otros desarrolladores de manera eficiente.

Algunos comandos básicos de Git incluyen `init` (para inicializar un nuevo repositorio), `add` (para agregar archivos al área de preparación), `commit` (para guardar los cambios), `push` (para enviar los cambios a un repositorio remoto) y `pull` (para obtener los cambios desde un repositorio remoto).
''',
    'code_example': '''
# Inicializar un nuevo repositorio Git
# git init

# Agregar archivos al área de preparación
# git add .

# Guardar los cambios con un mensaje descriptivo
# git commit -m "Añadida nueva funcionalidad"

# Enviar los cambios a un repositorio remoto
# git push origin main
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': 'GitHub',
    'definition': '''
GitHub es una plataforma de alojamiento de código basada en la web que utiliza Git. Además de proporcionar almacenamiento para tus repositorios Git, GitHub ofrece herramientas para la colaboración, como solicitudes de extracción (pull requests), seguimiento de problemas (issues) y revisión de código.

¿Te estás preguntando cómo se relaciona con Git?

GitHub actúa como un repositorio remoto centralizado donde los desarrolladores pueden almacenar y compartir su código. Facilita la colaboración en proyectos de código abierto y privados, y proporciona una interfaz web amigable para gestionar repositorios Git.

Para usar GitHub, necesitas crear una cuenta y luego puedes crear repositorios, subir tu código existente o clonar repositorios de otros desarrolladores.
''',
    'code_example': '''
# Este no es código ejecutable, sino una referencia a una plataforma web.
# Los comandos de Git se utilizan para interactuar con GitHub desde la terminal.
# Ejemplo de flujo de trabajo típico:

# 1. Crear un repositorio en GitHub.
# 2. Clonar el repositorio a tu máquina local:
#    git clone <URL_del_repositorio>
# 3. Realizar cambios en el código.
# 4. Guardar los cambios localmente:
#    git commit -m "Descripción de los cambios"
# 5. Enviar los cambios a GitHub:
#    git push origin main
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': '.gitignore para Python',
    'definition': '''
El archivo `.gitignore` se utiliza en los repositorios de Git para especificar archivos y directorios que Git debe ignorar. Esto es especialmente útil en proyectos de Python para evitar incluir archivos innecesarios o sensibles en el repositorio, como archivos de caché, archivos de registro o información de configuración local.

¿Te estás preguntando por qué necesitas esto?

Incluir archivos innecesarios puede inflar el tamaño del repositorio, contaminar el historial de cambios y, en algunos casos, exponer información confidencial. El archivo `.gitignore` te permite mantener tu repositorio limpio y organizado.

Algunos ejemplos comunes de entradas en un archivo `.gitignore` de Python incluyen:

-   `__pycache__/`: Directorio de caché de bytecode de Python.
-   `*.pyc`: Archivos de bytecode de Python compilados.
-   `.env`: Archivos que contienen variables de entorno locales.
-   `/venv/`: Directorio del entorno virtual.
''',
    'code_example': '''
# Ejemplo de un archivo .gitignore

# Ignorar directorios de caché de Python
__pycache__/

# Ignorar archivos de bytecode de Python
*.pyc

# Ignorar archivos de entorno virtual
venv/
.venv/

# Ignorar archivos de configuración local
.env
config.ini
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'unittest module',
    'definition': '''
El módulo `unittest` es el framework de pruebas unitarias incorporado de Python. Proporciona herramientas para escribir y ejecutar pruebas, y para organizar las pruebas en colecciones.

¿Te estás preguntando cómo funciona?

`unittest` se basa en los principios de la programación orientada a objetos. Las pruebas se definen como métodos dentro de clases que heredan de `unittest.TestCase`. Los métodos de prueba deben comenzar con el prefijo `test_`.

`unittest` proporciona métodos de aserción (como `assertEqual`, `assertTrue`, `assertFalse`, etc.) para verificar que los resultados reales coincidan con los resultados esperados. También incluye herramientas para configurar y desmontar (setup and teardown) el entorno de prueba.
''',
    'code_example': '''
import unittest

class TestStringMethods(unittest.TestCase):

    def test_upper(self):
        self.assertEqual("hello".upper(), "HELLO")

    def test_isupper(self):
        self.assertTrue("HELLO".isupper())
        self.assertFalse("Hello".isupper())

    def test_split(self):
        self.assertEqual("hello world".split(), ["hello", "world"])
        with self.assertRaises(TypeError):
            "hello".split(2)

if __name__ == '__main__':
    unittest.main()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'pytest básico',
    'definition': '''
`pytest` es un framework de pruebas de terceros para Python. Es más conciso y fácil de usar que `unittest`, y ofrece características potentes como la detección automática de pruebas, fixtures y parametrización.

¿Te estás preguntando qué lo hace diferente?

`pytest` simplifica la escritura de pruebas al permitirte usar funciones en lugar de clases. Detecta automáticamente las funciones de prueba que comienzan con `test_` o las clases que comienzan con `Test` y contienen métodos que comienzan con `test_`.

`pytest` también proporciona un sistema de fixtures para gestionar el estado de las pruebas y un sistema de parametrización para ejecutar la misma prueba con diferentes entradas.
''',
    'code_example': '''
# contenido de test_ejemplo.py
def test_suma():
    assert 1 + 1 == 2

def test_resta():
    assert 5 - 3 == 2

def test_multiplicacion():
    assert 2 * 3 == 6

def test_division():
    assert 10 / 2 == 5
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Assertions',
    'definition': '''
Las "assertions" son expresiones que verifican si una condición es verdadera o falsa en un punto dado del programa. Se utilizan en las pruebas unitarias para verificar que el código se comporta como se espera.

¿Te estás preguntando cómo funcionan?

Los frameworks de pruebas proporcionan métodos de aserción para comparar los resultados reales con los resultados esperados. Si una aserción falla, la prueba se considera fallida y se informa el error.

Algunas aserciones comunes incluyen:

-   `assertEqual(a, b)`: Verifica si `a` es igual a `b`.
-   `assertTrue(x)`: Verifica si `x` es verdadero.
-   `assertFalse(x)`: Verifica si `x` es falso.
-   `assertIn(a, b)`: Verifica si `a` está en `b`.
-   `assertRaise(exc, fun)`: Verifica si la llamada a la función `fun` lanza la excepción `exc`.
''',
    'code_example': '''
import unittest

class TestAssertions(unittest.TestCase):

    def test_igualdad(self):
        self.assertEqual(2 + 2, 4)

    def test_verdadero(self):
        self.assertTrue(5 > 3)

    def test_falso(self):
        self.assertFalse(5 < 3)

    def test_en_lista(self):
        self.assertIn(2, [1, 2, 3])

    def test_excepcion(self):
        with self.assertRaises(TypeError):
            1 + "a"
'''
  });
}
