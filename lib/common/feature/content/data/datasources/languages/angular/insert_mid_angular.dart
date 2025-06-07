import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertAngularMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Estructura de Proyectos',
    'subtopic': 'Organización de módulos y componentes',
    'definition': r'''
A medida que tu aplicación Angular crece, es fundamental tener una buena organización para que el código no se convierta en un spaghetti inmanejable. La clave aquí es la organización de módulos y componentes, una práctica que te ahorrará muchos dolores de cabeza.

Esto tiene una explicación, y es porque Pensemos por un momento en una casa grande. No querrías que todas las habitaciones (tus componentes y servicios) estuvieran mezcladas al azar, sin pasillos ni divisiones claras. De igual forma, en un proyecto Angular, los módulos son como los planos de tu casa, agrupando funcionalidades relacionadas, y los componentes son las "habitaciones" dentro de esas funcionalidades. Una buena organización significa agrupar componentes, servicios, directivas y pipes relacionados en sus propios módulos (`NgModule`). Por ejemplo, si tienes una sección de "Autenticación", podrías tener un `AuthModule` que contenga el `LoginComponent`, `RegisterComponent`, y sus servicios de autenticación asociados.

Esta estructura modular tiene varios beneficios:
* **Claridad**: Es mucho más fácil entender la funcionalidad de una parte de la aplicación cuando está encapsulada en un módulo.
* **Mantenibilidad**: Si hay un problema en la sección de "Usuarios", sabes exactamente dónde buscar.
* **Escalabilidad**: Añadir nuevas características o funcionalidades es más sencillo cuando el proyecto tiene una estructura clara y extensible.
* **Colaboración**: Cuando trabajas en equipo, es menos probable que haya conflictos o que un desarrollador pise el código de otro si cada uno trabaja en módulos bien definidos.
* **Reutilización**: Los módulos bien diseñados pueden ser reutilizados en otras partes de la aplicación o incluso en otros proyectos.

En resumen, organizar tus módulos y componentes es como poner orden en tu armario: al principio cuesta un poco, pero luego encontrar lo que necesitas es mucho más rápido y sencillo.
''',
    'code_example': r'''
// Estructura de carpetas común para un proyecto Angular
// src/
// ├── app/
// │   ├── app-routing.module.ts
// │   ├── app.component.html
// │   ├── app.component.ts
// │   ├── app.module.ts
// │   │
// │   ├── core/                  // Módulo Core: Servicios singleton, interceptores, guards
// │   │   ├── auth/
// │   │   │   ├── auth.service.ts
// │   │   │   └── auth.guard.ts
// │   │   ├── services/
// │   │   │   └── api.service.ts
// │   │   └── core.module.ts     // Exporta servicios singleton
// │   │
// │   ├── shared/                // Módulo Shared: Componentes, directivas, pipes reutilizables
// │   │   ├── components/
// │   │   │   └── button/
// │   │   │       └── button.component.ts
// │   │   ├── directives/
// │   │   │   └── highlight.directive.ts
// │   │   ├── pipes/
// │   │   │   └── filter.pipe.ts
// │   │   └── shared.module.ts   // Exporta componentes, etc. para que otros módulos los importen
// │   │
// │   ├── features/              // Módulos de "features" o Lazy Loading
// │   │   ├── auth/              // Módulo de Autenticación
// │   │   │   ├── components/
// │   │   │   │   ├── login/login.component.ts
// │   │   │   │   └── register/register.component.ts
// │   │   │   ├── auth-routing.module.ts
// │   │   │   ├── auth.module.ts
// │   │   │   └── services/
// │   │   │       └── auth-api.service.ts
// │   │   │
// │   │   ├── products/          // Módulo de Productos
// │   │   │   ├── components/
// │   │   │   │   ├── product-list/product-list.component.ts
// │   │   │   │   └── product-detail/product-detail.component.ts
// │   │   │   ├── products-routing.module.ts
// │   │   │   ├── products.module.ts
// │   │   │   └── services/
// │   │   │       └── product.service.ts
// │   │   │
// │   │   └── ...otras features...
// │   │
// │   └── app.component.scss
// ├── assets/
// ├── environments/
// └── main.ts

// Ejemplo de `auth.module.ts` (src/app/features/auth/auth.module.ts)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario para ngIf, ngFor, etc.
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; // Si los formularios son parte de este módulo

import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { AuthRoutingModule } from './auth-routing.module';
import { AuthApiService } from './services/auth-api.service';
import { SharedModule } from '../../shared/shared.module'; // Importar SharedModule si usa componentes compartidos

@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    AuthRoutingModule,
    SharedModule // Importa el módulo compartido para usar sus componentes/directivas
  ],
  providers: [
    AuthApiService // Los servicios suelen ir en `providers` del módulo que los provee
  ]
})
export class AuthModule { }

// Ejemplo de `shared.module.ts` (src/app/shared/shared.module.ts)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ButtonComponent } from './components/button/button.component';
import { HighlightDirective } from './directives/highlight.directive';
import { FilterPipe } from './pipes/filter.pipe';

@NgModule({
  declarations: [
    ButtonComponent,
    HighlightDirective,
    FilterPipe
  ],
  imports: [
    CommonModule
  ],
  exports: [ // ¡Muy importante! Los elementos que quieres que otros módulos usen
    ButtonComponent,
    HighlightDirective,
    FilterPipe,
    CommonModule, // Exporta CommonModule para no tener que importarlo en cada módulo que use SharedModule
    FormsModule, // Si tienes componentes compartidos que usan ngModel, exporta FormsModule también
  ]
})
export class SharedModule { }


/*
Un error común es poner todos los componentes y servicios directamente en `app.module.ts`
cuando el proyecto crece. Esto lo convierte en un "módulo monolítico" y dificulta la gestión.
Modulariza tu aplicación lo antes posible, incluso si al principio parecen "demasiados" módulos.

Otro error es olvidar importar `CommonModule` en tus módulos personalizados si vas a usar
directivas como `*ngIf`, `*ngFor`, `ngClass`, etc., o pipes comunes en las plantillas de esos módulos.
`CommonModule` provee todas esas funcionalidades básicas del navegador que Angular no incluye
por defecto en `BrowserModule` (que solo se importa una vez en el módulo raíz).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Estructura de Proyectos',
    'subtopic': 'Lazy Loading y módulos compartidos',
    'definition': r'''
Cuando tu aplicación Angular empieza a tener muchas funcionalidades, cargar todo el código desde el principio puede hacer que la página tarde una eternidad en mostrarse. Aquí es donde el "Lazy Loading" y los "módulos compartidos" se convierten en tus superhéroes para optimizar el rendimiento.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un restaurante. No quieres que la cocina prepare todos los platos del menú al mismo tiempo, incluso los que nadie ha pedido. Sería un desperdicio de recursos y haría que el servicio fuera lento. En su lugar, preparas los platos "bajo demanda", solo cuando un cliente los pide. El Lazy Loading en Angular funciona de manera similar: carga módulos de código solo cuando el usuario realmente los necesita, es decir, cuando navega a una ruta asociada a ese módulo. Esto significa que la carga inicial de tu aplicación es mucho más rápida, ya que el navegador solo descarga el código esencial para la primera vista. Las funcionalidades que no se utilizan de inmediato (como la sección de administración o el perfil de usuario) se cargan después, de forma asíncrona.

Por otro lado, los "módulos compartidos" (SharedModule) son esenciales en esta estrategia. Son módulos donde agrupas componentes, directivas, pipes y servicios que son utilizados por *múltiples* módulos de Lazy Loading. Por ejemplo, un `SharedModule` podría contener un `ButtonComponent`, un `SpinnerComponent` o un `FormatDatePipe`. En lugar de declarar y exportar estos elementos en cada módulo que los necesite (lo que crearía duplicados), los declaras y exportas una sola vez en el `SharedModule`, y luego cada módulo de Lazy Loading simplemente importa este `SharedModule`. Esto evita la duplicación de código y asegura que solo tengas una versión de cada componente/directiva/pipe compartido, lo que ahorra tamaño de bundle. La combinación de Lazy Loading para el código de funcionalidad y módulos compartidos para el código reutilizable es una receta ganadora para aplicaciones Angular grandes y eficientes.
''',
    'code_example': r'''
// Ejemplo de Lazy Loading con módulos de características

// 1. App Routing Module (src/app/app-routing.module.ts)
// Aquí se define cómo se cargan los módulos de forma perezosa.
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent }, // Un componente cargado inicialmente
  {
    path: 'products',
    loadChildren: () => import('./features/products/products.module').then(m => m.ProductsModule)
  },
  {
    path: 'admin',
    loadChildren: () => import('./features/admin/admin.module').then(m => m.AdminModule)
  },
  { path: '**', component: NotFoundComponent } // Ruta comodín
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }


// 2. Módulo de característica con Lazy Loading (src/app/features/products/products.module.ts)
// Este módulo se carga solo cuando el usuario navega a /products
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario para ngIf, ngFor, etc.
import { ProductsRoutingModule } from './products-routing.module';
import { ProductListComponent } from './components/product-list/product-list.component';
import { ProductDetailComponent } from './components/product-detail/product-detail.component';
import { SharedModule } from '../../shared/shared.module'; // Importa el módulo compartido

@NgModule({
  declarations: [
    ProductListComponent,
    ProductDetailComponent
  ],
  imports: [
    CommonModule, // Siempre CommonModule en módulos de Lazy Loading
    ProductsRoutingModule,
    SharedModule // Importa SharedModule para usar componentes/directivas/pipes compartidos
  ]
})
export class ProductsModule { }


// 3. Routing del módulo de característica (src/app/features/products/products-routing.module.ts)
// Define las rutas internas de este módulo.
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductListComponent } from './components/product-list/product-list.component';
import { ProductDetailComponent } from './components/product-detail/product-detail.component';

const routes: Routes = [
  { path: '', component: ProductListComponent },
  { path: ':id', component: ProductDetailComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)], // ¡Importante! `forChild` para rutas de módulos lazy-loaded
  exports: [RouterModule]
})
export class ProductsRoutingModule { }


// 4. Módulo compartido (src/app/shared/shared.module.ts)
// Este módulo contiene elementos reutilizables que otros módulos pueden importar.
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SpinnerComponent } from './components/spinner/spinner.component';
import { CustomButtonComponent } from './components/custom-button/custom-button.component';
import { CapitalizePipe } from './pipes/capitalize.pipe';

@NgModule({
  declarations: [
    SpinnerComponent,
    CustomButtonComponent,
    CapitalizePipe
  ],
  imports: [
    CommonModule
  ],
  exports: [ // Exporta lo que quieres que otros módulos puedan usar
    SpinnerComponent,
    CustomButtonComponent,
    CapitalizePipe,
    CommonModule // Exporta CommonModule para no tener que importarlo en cada módulo que importe SharedModule
  ]
})
export class SharedModule { }


/*
Un error común con Lazy Loading es olvidar usar `RouterModule.forChild(routes)`
en los módulos de routing de los módulos lazy-loaded (ej. `ProductsRoutingModule`).
Si usas `forRoot` allí, Angular podría tener problemas con el manejo de rutas y servicios.
`forRoot` solo debe usarse una vez en el `AppRoutingModule` raíz.

Otro error al usar módulos compartidos es no exportar los componentes, directivas o pipes
que quieres que estén disponibles para otros módulos. Si solo los declaras,
solo serán visibles dentro de ese módulo. Necesitas añadirlos al array `exports`
para que puedan ser importados por otros módulos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Estructura de Proyectos',
    'subtopic': 'Separación de responsabilidades',
    'definition': r'''
Una buena aplicación Angular no es solo código que funciona, es código que es fácil de entender, mantener y extender. La "separación de responsabilidades" es un principio de diseño fundamental que te ayuda a lograr esto.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en un equipo de fútbol. Cada jugador tiene una responsabilidad específica: el portero detiene balones, el defensor protege la portería, el mediocampista controla el juego y el delantero marca goles. Si todos intentaran hacer todo, sería un caos. En el desarrollo de software, la separación de responsabilidades significa que cada componente, servicio, directiva o módulo en tu aplicación Angular debe tener una única razón para cambiar. En otras palabras, cada parte de tu código debe hacer una cosa y hacerla bien.

Algunas formas de aplicar esto en Angular son:
* **Componentes**: Deben enfocarse en la presentación y la interacción con el usuario. Su lógica debe ser mínima, a menudo delegando tareas complejas a los servicios.
* **Servicios**: Son ideales para la lógica de negocio, la comunicación con la API, el manejo de datos, la autenticación, etc. Son clases "sin estado" que pueden ser inyectadas donde se necesiten.
* **Módulos**: Agrupan funcionalidades relacionadas. Un módulo de "Autenticación" solo se encarga de todo lo relacionado con el login/registro.
* **Pipes**: Se encargan exclusivamente de transformar datos para la vista.
* **Directivas**: Se enfocan en manipular el DOM o añadir comportamiento a los elementos HTML.

Al aplicar la separación de responsabilidades, obtienes un código más limpio, más fácil de probar (porque cada unidad es más pequeña y enfocada), y mucho más flexible para futuras modificaciones. Es una práctica que, aunque parezca que añade más archivos al principio, te ahorra muchísimo tiempo y esfuerzo a largo plazo.
''',
    'code_example': r'''
// Ejemplo de separación de responsabilidades

// 1. Un servicio que maneja la lógica de negocio y la comunicación con la API
// src/app/user/user.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from './user.model'; // Asume que tienes un modelo de usuario

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = 'https://api.myapp.com/users';

  constructor(private http: HttpClient) { }

  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.apiUrl);
  }

  getUserById(id: number): Observable<User> {
    return this.http.get<User>(`${this.apiUrl}/${id}`);
  }

  createUser(user: User): Observable<User> {
    return this.http.post<User>(this.apiUrl, user);
  }

  // Este servicio tiene una única responsabilidad: manejar la lógica de datos de los usuarios.
}


// 2. Un componente que se enfoca en la presentación y la interacción del usuario
// src/app/user/user-list/user-list.component.ts
import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service'; // Inyecta el servicio
import { User } from '../user.model';

@Component({
  selector: 'app-user-list',
  template: `
    <h2>Lista de Usuarios</h2>
    <div *ngIf="loading">Cargando usuarios...</div>
    <div *ngIf="error" style="color: red;">{{ error }}</div>
    <ul>
      <li *ngFor="let user of users">
        {{ user.name }} ({{ user.email }})
        <button (click)="viewDetails(user.id)">Ver detalles</button>
      </li>
    </ul>
    <button (click)="addNewUser()">Añadir Nuevo Usuario</button>
  `
})
export class UserListComponent implements OnInit {
  users: User[] = [];
  loading: boolean = false;
  error: string | null = null;

  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.loading = true;
    this.userService.getUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Error al cargar usuarios.';
        this.loading = false;
        console.error(err);
      }
    });
  }

  viewDetails(id: number): void {
    // Aquí el componente solo se encarga de la interacción del usuario
    // y delega la obtención de datos al servicio o al enrutador (si fuera a otra página).
    console.log(`Navegar a detalles del usuario ${id}`);
    // En una aplicación real, usarías el Router aquí:
    // this.router.navigate(['/users', id]);
  }

  addNewUser(): void {
    console.log('Abrir formulario para añadir nuevo usuario');
    // Lógica para abrir un modal o navegar a una ruta de creación de usuario
  }
}

// 3. Un Pipe que transforma datos para la vista
// src/app/shared/pipes/shorten.pipe.ts
import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'shorten'
})
export class ShortenPipe implements PipeTransform {
  transform(value: string, limit: number): string {
    if (value.length > limit) {
      return value.substring(0, limit) + '...';
    }
    return value;
  }
  // Este pipe tiene una única responsabilidad: acortar strings.
}

/*
Un error común que va en contra de la separación de responsabilidades es poner
la lógica de negocio (ej. llamadas HTTP, validaciones complejas) directamente
dentro de los componentes. Esto hace que los componentes sean difíciles de probar,
reutilizar y mantener. La regla general es:
- Componentes: Presentación y manejo de eventos de UI.
- Servicios: Lógica de negocio, manejo de datos y comunicación con el backend.

Otro error es crear servicios "god object" que hacen de todo (manejan usuarios, productos, autenticación, etc.).
Es mejor tener servicios pequeños y enfocados, cada uno con una responsabilidad clara.
Por ejemplo, un `UserService` para usuarios, un `ProductService` para productos, etc.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Patrones de Diseño',
    'subtopic': 'Singleton y Factory en Angular',
    'definition': r'''
Los patrones de diseño son soluciones probadas a problemas comunes en el desarrollo de software. Dos de los más útiles y frecuentes en Angular son el patrón "Singleton" y el patrón "Factory".

Aquí te va la aclaración: Pensemos por un momento en una cafetería. Si solo quieres una máquina de café para todo el local, usarías el patrón Singleton: solo una instancia, accesible por todos. Si necesitas diferentes tipos de café (espresso, latte, capuchino) pero no quieres preocuparte de cómo se preparan, usarías el patrón Factory: pides un café y la "fábrica" te lo entrega sin que sepas los detalles de su creación.

* **Singleton**: En Angular, la implementación más común y casi automática de Singleton se da con los servicios marcados con `@Injectable({ providedIn: 'root' })`. Esto le dice a Angular que debe crear una única instancia de ese servicio y proporcionarla a cualquier componente o servicio que la solicite en toda la aplicación. Es perfecto para servicios que manejan un estado global (como un servicio de autenticación o un servicio de notificaciones) o que se comunican con un backend. Te aseguras de que todos los componentes que necesiten interactuar con ese servicio lo hagan a través de la misma instancia, manteniendo la consistencia de los datos.

* **Factory**: Este patrón se utiliza cuando quieres crear diferentes tipos de objetos relacionados sin exponer la lógica de creación al cliente. En Angular, el patrón Factory se ve a menudo en proveedores de dependencias personalizados. Puedes definir una "función factory" que se encargue de construir una instancia de un servicio, a veces basándose en alguna lógica o configuración. Esto es muy útil cuando la creación de un objeto es compleja, depende de ciertos parámetros, o necesitas devolver diferentes implementaciones de una interfaz. Por ejemplo, podrías tener una factory que decide qué implementación de un servicio de almacenamiento (local, de sesión o en la nube) se debe usar basándose en la configuración del entorno.

Ambos patrones te ayudan a escribir un código más organizado, más fácil de mantener y más flexible, ya que encapsulan la lógica de creación y el manejo de instancias de objetos.
''',
    'code_example': r'''
// --- EJEMPLO DE SINGLETON EN ANGULAR ---
// src/app/notification.service.ts
// Este servicio será un Singleton gracias a `providedIn: 'root'`

import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root' // ¡Esto lo convierte en un Singleton global!
})
export class NotificationService {
  private _message = new Subject<string>();
  public readonly message$: Observable<string> = this._message.asObservable();

  constructor() {
    console.log('NotificationService: Instancia creada (solo una vez)');
  }

  show(message: string, duration: number = 3000): void {
    this._message.next(message);
    console.log(`Notificación: ${message}`);
    setTimeout(() => {
      // Opcional: limpiar mensaje después de un tiempo
    }, duration);
  }
}

// src/app/header/header.component.ts
// Este componente usa el NotificationService
import { Component } from '@angular/core';
import { NotificationService } from '../notification.service';

@Component({
  selector: 'app-header',
  template: `
    <header>
      <h1>Mi Aplicación</h1>
      <button (click)="sendHeaderNotification()">Notificar desde Header</button>
    </header>
  `
})
export class HeaderComponent {
  constructor(private notificationService: NotificationService) {}

  sendHeaderNotification(): void {
    this.notificationService.show('¡Hola desde el Header!');
  }
}

// src/app/dashboard/dashboard.component.ts
// Este componente también usa el NotificationService
import { Component } from '@angular/core';
import { NotificationService } from '../notification.service';

@Component({
  selector: 'app-dashboard',
  template: `
    <main>
      <h2>Dashboard</h2>
      <button (click)="sendDashboardNotification()">Notificar desde Dashboard</button>
      <div *ngIf="notificationService.message$ | async as message">
        <p class="notification-display">{{ message }}</p>
      </div>
    </main>
  `,
  styles: [`
    .notification-display {
      background-color: lightblue;
      padding: 10px;
      margin-top: 10px;
      border-radius: 5px;
    }
  `]
})
export class DashboardComponent {
  constructor(public notificationService: NotificationService) { // Público para usar en la plantilla
    // Ambas instancias de NotificationService en Header y Dashboard son la misma.
  }

  sendDashboardNotification(): void {
    this.notificationService.show('¡Mensaje del Dashboard!');
  }
}


// --- EJEMPLO DE FACTORY EN ANGULAR ---
// src/app/analytics/analytics.service.ts
// Una interfaz para nuestros servicios de análisis
interface AnalyticsService {
  trackEvent(eventName: string, properties?: any): void;
}

// src/app/analytics/google-analytics.service.ts
// Una implementación de AnalyticsService para Google Analytics
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GoogleAnalyticsService implements AnalyticsService {
  trackEvent(eventName: string, properties?: any): void {
    console.log(`[Google Analytics] Evento: ${eventName}`, properties);
    // Aquí iría la llamada real a la API de Google Analytics (ej. gtag('event', eventName, properties))
  }
}

// src/app/analytics/mixpanel-analytics.service.ts
// Otra implementación para Mixpanel
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MixpanelAnalyticsService implements AnalyticsService {
  trackEvent(eventName: string, properties?: any): void {
    console.log(`[Mixpanel] Evento: ${eventName}`, properties);
    // Aquí iría la llamada real a la API de Mixpanel (ej. mixpanel.track(eventName, properties))
  }
}

// src/app/analytics/analytics.factory.ts
// La función factory que decide qué implementación de AnalyticsService proveer
import { EnvironmentInjector, inject } from '@angular/core';
import { GoogleAnalyticsService } from './google-analytics.service';
import { MixpanelAnalyticsService } from './mixpanel-analytics.service';
import { AnalyticsService } from './analytics.service';
import { environment } from '../../environments/environment'; // Asume que tienes un archivo de entorno

export function analyticsServiceFactory(): AnalyticsService {
  const injector = inject(EnvironmentInjector); // Necesario para obtener dependencias dentro de la factory
  if (environment.production) {
    // En producción, usamos Google Analytics
    console.log('Usando Google Analytics en producción.');
    return injector.get(GoogleAnalyticsService);
  } else {
    // En desarrollo, usamos Mixpanel (o una implementación más simple para depuración)
    console.log('Usando Mixpanel Analytics en desarrollo.');
    return injector.get(MixpanelAnalyticsService);
  }
}

// src/app/app.module.ts (o un Feature Module)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { NotificationService } from './notification.service';
import { AnalyticsService } from './analytics/analytics.service';
import { analyticsServiceFactory } from './analytics/analytics.factory';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    DashboardComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [
    // NotificationService ya es un Singleton debido a `providedIn: 'root'`
    // Ahora, proveemos AnalyticsService usando nuestra función factory
    { provide: AnalyticsService, useFactory: analyticsServiceFactory }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }


/*
Un error común al intentar implementar un Singleton "a mano" sin `providedIn: 'root'`
(ej. creando una clase con un método `getInstance()`) es que Angular puede crear
múltiples instancias si no se configura correctamente en el sistema de inyección
de dependencias (DI). `providedIn: 'root'` es la forma más idiomática y segura en Angular.

En el patrón Factory, un error sería no registrar la factory en el `providers` del módulo
con `useFactory` y el `provide` adecuado. Si olvidas esto, Angular no sabrá cómo crear
la instancia del servicio cuando sea solicitada.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Patrones de Diseño',
    'subtopic': 'Observador y Mediador con RxJS',
    'definition': r'''
Cuando construyes aplicaciones complejas, necesitas formas eficientes para que diferentes partes del código se comuniquen sin estar rígidamente acopladas. Aquí es donde los patrones "Observador" y "Mediador", potenciados por RxJS, brillan con luz propia en Angular.

Esto tiene una explicación, y es porque Pensemos por un momento en una estación de radio. Con el patrón "Observador", la estación (el sujeto) emite una señal, y cualquier radio (el observador) que esté sintonizada la recibe. La estación no sabe cuántas radios están escuchando, y las radios no saben unas de otras. Con el patrón "Mediador", pensemos en un controlador de tráfico aéreo: en lugar de que cada avión hable directamente con todos los demás aviones, todos se comunican con el controlador (el mediador), que gestiona el flujo de información para evitar colisiones.

* **Patrón Observador con RxJS**: En Angular, este patrón se implementa de forma nativa a través de RxJS (`Observables` y `Subscribers`). Un "sujeto" (`Observable`) emite datos o notificaciones, y múltiples "observadores" (`Subscribers`) pueden "escuchar" esos datos. Es perfecto para manejar eventos asíncronos (clics, respuestas HTTP, cambios en el estado de la aplicación) o para la comunicación de componente a componente (especialmente si no son padre-hijo directos). Por ejemplo, un `NotificationService` (como el del ejemplo anterior) que emite mensajes, y varios componentes que "observan" esos mensajes para mostrarlos. La belleza es que el emisor no necesita saber nada de los receptores, lo que reduce el acoplamiento entre las partes de tu aplicación.

* **Patrón Mediador con RxJS**: Este patrón se usa cuando quieres reducir las dependencias directas entre componentes al hacer que se comuniquen a través de un objeto "mediador" central. En Angular, puedes implementar un mediador usando un servicio de RxJS. En lugar de que el `Componente A` llame directamente a un método en el `Componente B`, ambos se comunican con un servicio mediador. El `Componente A` le dice al mediador que algo ha sucedido, y el `Componente B` "escucha" al mediador para reaccionar a ese suceso. Esto es genial para escenarios donde tienes muchos componentes interactuando entre sí y no quieres que cada uno sepa de la existencia de los demás. Un ejemplo sería un `EventBusService` que centraliza la emisión y suscripción de eventos genéricos en tu aplicación. Reduce las "líneas cruzadas" de comunicación y hace que el flujo de control sea más claro.

Ambos patrones, cuando se usan con la reactividad de RxJS, te permiten construir aplicaciones Angular más flexibles, escalables y con un acoplamiento más bajo, lo que facilita el mantenimiento y la evolución del código.
''',
    'code_example': r'''
// --- EJEMPLO DE PATRÓN OBSERVADOR CON RXJS (Communication Service) ---
// src/app/event-bus.service.ts
import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';
import { filter, map } from 'rxjs/operators';

// Definimos una interfaz para los eventos para mayor seguridad de tipo
interface AppEvent {
  type: string;
  payload?: any;
}

@Injectable({
  providedIn: 'root'
})
export class EventBusService {
  private _events = new Subject<AppEvent>();

  // Método para emitir un evento
  emit(event: AppEvent): void {
    this._events.next(event);
  }

  // Método para escuchar eventos de un tipo específico
  on(eventType: string): Observable<any> {
    return this._events.pipe(
      filter(event => event.type === eventType),
      map(event => event.payload)
    );
  }
}

// src/app/component-a/component-a.component.ts (Emisor)
import { Component } from '@angular/core';
import { EventBusService } from '../event-bus.service';

@Component({
  selector: 'app-component-a',
  template: `
    <div class="card">
      <h3>Componente A (Emisor)</h3>
      <button (click)="sendMessage()">Enviar Mensaje Global</button>
      <button (click)="sendWarning()">Enviar Alerta</button>
    </div>
  `,
  styles: ['.card { border: 1px solid blue; padding: 10px; margin: 10px; }']
})
export class ComponentAComponent {
  constructor(private eventBus: EventBusService) {}

  sendMessage(): void {
    this.eventBus.emit({ type: 'GLOBAL_MESSAGE', payload: '¡Mensaje desde Componente A!' });
  }

  sendWarning(): void {
    this.eventBus.emit({ type: 'WARNING_ALERT', payload: 'Advertencia: Algo importante sucedió.' });
  }
}

// src/app/component-b/component-b.component.ts (Observador)
import { Component, OnInit, OnDestroy } from '@angular/core';
import { EventBusService } from '../event-bus.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-component-b',
  template: `
    <div class="card">
      <h3>Componente B (Observador)</h3>
      <p *ngIf="lastMessage">Último Mensaje Global: {{ lastMessage }}</p>
    </div>
  `,
  styles: ['.card { border: 1px solid green; padding: 10px; margin: 10px; }']
})
export class ComponentBComponent implements OnInit, OnDestroy {
  lastMessage: string | null = null;
  private subscription: Subscription = new Subscription();

  constructor(private eventBus: EventBusService) {}

  ngOnInit(): void {
    // Suscribirse a eventos de tipo 'GLOBAL_MESSAGE'
    this.subscription.add(
      this.eventBus.on('GLOBAL_MESSAGE').subscribe(message => {
        this.lastMessage = message;
        console.log('Componente B recibió: ', message);
      })
    );
  }

  ngOnDestroy(): void {
    // ¡Muy importante! Desuscribirse para evitar fugas de memoria
    this.subscription.unsubscribe();
  }
}

// src/app/global-alert/global-alert.component.ts (Otro Observador)
import { Component, OnInit, OnDestroy } from '@angular/core';
import { EventBusService } from '../event-bus.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-global-alert',
  template: `
    <div *ngIf="alertMessage" class="alert-box">
      <p>⚠️ {{ alertMessage }}</p>
      <button (click)="clearAlert()">X</button>
    </div>
  `,
  styles: [`
    .alert-box {
      background-color: yellow;
      padding: 10px;
      margin: 10px;
      border: 1px solid orange;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
  `]
})
export class GlobalAlertComponent implements OnInit, OnDestroy {
  alertMessage: string | null = null;
  private subscription: Subscription = new Subscription();

  constructor(private eventBus: EventBusService) {}

  ngOnInit(): void {
    // Suscribirse a eventos de tipo 'WARNING_ALERT'
    this.subscription.add(
      this.eventBus.on('WARNING_ALERT').subscribe(message => {
        this.alertMessage = message;
        console.log('Alerta global recibió: ', message);
      })
    );
  }

  clearAlert(): void {
    this.alertMessage = null;
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}


// --- EJEMPLO DE PATRÓN MEDIADOR CON RXJS (más explícito) ---
// Aunque el EventBusService ya tiene un sabor a Mediador, podemos hacer uno más específico
// si la lógica de interacción entre componentes es más compleja.

// src/app/chat-mediator.service.ts
import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';

// Un "mediador" para la comunicación entre usuarios en un chat
@Injectable({
  providedIn: 'root'
})
export class ChatMediatorService {
  private _messageSource = new Subject<{ sender: string, message: string }>();
  message$ = this._messageSource.asObservable();

  sendMessage(sender: string, message: string): void {
    // El mediador recibe el mensaje y lo retransmite a todos los suscriptores
    this._messageSource.next({ sender, message });
    console.log(`Mediador: Mensaje de ${sender} recibido y emitido.`);
  }
}

// src/app/chat-user/chat-user.component.ts
import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { ChatMediatorService } from '../chat-mediator.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-chat-user',
  template: `
    <div class="chat-user-card">
      <h4>{{ username }}</h4>
      <input [(ngModel)]="currentMessage" placeholder="Escribe un mensaje...">
      <button (click)="send()">Enviar</button>
      <div class="messages">
        <p *ngFor="let msg of messages">{{ msg.sender }}: {{ msg.message }}</p>
      </div>
    </div>
  `,
  styles: [`
    .chat-user-card { border: 1px solid purple; padding: 10px; margin: 10px; }
    .messages { max-height: 100px; overflow-y: auto; border: 1px solid #eee; margin-top: 5px; padding: 5px; }
  `]
})
export class ChatUserComponent implements OnInit, OnDestroy {
  @Input() username: string = 'Usuario';
  currentMessage: string = '';
  messages: { sender: string, message: string }[] = [];
  private subscription: Subscription = new Subscription();

  constructor(private chatMediator: ChatMediatorService) {}

  ngOnInit(): void {
    // Cada usuario se suscribe al mediador para recibir todos los mensajes
    this.subscription.add(
      this.chatMediator.message$.subscribe(msg => {
        this.messages.push(msg);
      })
    );
  }

  send(): void {
    if (this.currentMessage.trim()) {
      // El usuario envía el mensaje al mediador, no directamente a otros usuarios
      this.chatMediator.sendMessage(this.username, this.currentMessage);
      this.currentMessage = '';
    }
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}

// src/app/app.component.ts (para mostrar los ejemplos)
// import { Component } from '@angular/core';
// @Component({
//   selector: 'app-root',
//   template: `
//     <h1>Ejemplo de Patrones con RxJS</h1>
//     <app-component-a></app-component-a>
//     <app-component-b></app-component-b>
//     <app-global-alert></app-global-alert>
//     <hr>
//     <h2>Ejemplo de Chat Mediador</h2>
//     <app-chat-user [username]="'Alice'"></app-chat-user>
//     <app-chat-user [username]="'Bob'"></app-chat-user>
//   `
// })
// export class AppComponent {}

/*
Un error común al usar Observables para la comunicación entre componentes
es olvidar desuscribirse (`unsubscribe()`) en el `ngOnDestroy` del componente
que observa. Si no lo haces, puedes tener fugas de memoria, ya que la suscripción
se mantiene activa incluso después de que el componente es destruido,
lo que puede llevar a problemas de rendimiento y comportamientos inesperados.

Otro error, especialmente con el patrón Mediador, es abusar de él.
Si la comunicación es simple y directa (ej. padre-hijo con `@Input`/`@Output`),
no necesitas un mediador. El mediador es más útil cuando tienes interacciones
complejas entre muchas partes que de otra forma resultarían en un acoplamiento excesivo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Patrones de Diseño',
    'subtopic': 'Inversión de control y principio de responsabilidad única',
    'definition': r'''
Dos pilares fundamentales en el diseño de software que Angular adopta y fomenta son la "Inversión de Control" (IoC) y el "Principio de Responsabilidad Única" (SRP). Comprenderlos te ayudará a escribir un código más limpio, más modular y más fácil de mantener.

Aquí te va la aclaración: Pensemos por un momento en un sistema de riego automático para un jardín. Con la Inversión de Control, en lugar de que cada planta decida cuándo regarse a sí misma, el sistema de riego centralizado (el "contenedor" de IoC) es quien decide cuándo y cómo regar cada planta. Las plantas simplemente declaran que necesitan agua, y el sistema se encarga de proveérsela. El Principio de Responsabilidad Única es como tener un jardinero para regar, otro para podar y otro para abonar: cada uno tiene una única tarea bien definida.

* **Inversión de Control (IoC)**: En el desarrollo tradicional, tu código suele "controlar" la creación y gestión de sus dependencias (ej. `new MyService()`). Con IoC, es el "contenedor" (en Angular, el sistema de Inyección de Dependencias o DI) quien se encarga de crear y proporcionar las dependencias a tu código. Tú simplemente "declaras" que necesitas una dependencia (ej. inyectando un `UserService` en tu constructor), y Angular se encarga de instanciarlo y proporcionártelo. Esto tiene grandes ventajas:
    * **Menos acoplamiento**: Tu código no necesita saber cómo se crean sus dependencias. Solo le importa que estén ahí.
    * **Mayor facilidad para probar**: Puedes "mockear" o reemplazar fácilmente las dependencias reales por versiones de prueba durante los tests.
    * **Mayor flexibilidad**: Puedes cambiar la implementación de una dependencia sin afectar el código que la utiliza.

* **Principio de Responsabilidad Única (SRP)**: Este es uno de los principios SOLID (conjunto de principios de diseño de software). Dice que "una clase o módulo debe tener una, y solo una, razón para cambiar". Esto significa que cada parte de tu código debe tener una única responsabilidad bien definida y específica. Por ejemplo, un servicio (`UserService`) debe encargarse solo de la lógica relacionada con usuarios y sus datos (obtener, crear, actualizar, eliminar). No debe manejar la autenticación (para eso, un `AuthService`), ni las notificaciones (para eso, un `NotificationService`), ni la manipulación directa del DOM (eso es para los componentes o directivas). Si tu clase tiene múltiples razones para cambiar, es una señal de que está haciendo demasiadas cosas y debería dividirse.

Al combinar IoC y SRP, construyes aplicaciones Angular que son intrínsecamente más modulares, más robustas y mucho más agradables de trabajar, tanto solo como en equipo.
''',
    'code_example': r'''
// --- EJEMPLO DE INVERSIÓN DE CONTROL (Inyección de Dependencias en Angular) ---
// Angular utiliza la Inyección de Dependencias como su principal mecanismo de IoC.

// 1. Un servicio (la dependencia)
// src/app/data.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root' // Lo hace disponible para ser inyectado en toda la app
})
export class DataService {
  constructor(private http: HttpClient) { // Angular inyecta HttpClient aquí
    console.log('DataService: Instancia creada por Angular DI.');
  }

  getPublicData(): Observable<any> {
    return this.http.get('https://jsonplaceholder.typicode.com/posts/1');
  }

  // Este servicio es responsable solo de obtener datos.
}

// 2. Un componente (el cliente) que depende del servicio
// src/app/data-display/data-display.component.ts
import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service'; // Importa la clase
import { Observable } from 'rxjs';

@Component({
  selector: 'app-data-display',
  template: `
    <h2>Datos desde el Servicio</h2>
    <div *ngIf="data$ | async as data">
      <h3>{{ data.title }}</h3>
      <p>{{ data.body }}</p>
    </div>
    <div *ngIf="!data$">Cargando datos...</div>
  `
})
export class DataDisplayComponent implements OnInit {
  data$: Observable<any> | undefined;

  constructor(private dataService: DataService) { // Angular inyecta DataService aquí
    console.log('DataDisplayComponent: DataService fue inyectado.');
    // No necesitamos `new DataService()`, Angular lo hace por nosotros.
  }

  ngOnInit(): void {
    this.data$ = this.dataService.getPublicData();
  }

  // Este componente es responsable solo de mostrar datos.
}


// --- EJEMPLO DEL PRINCIPIO DE RESPONSABILIDAD ÚNICA (SRP) ---

// 1. Servicio de autenticación (SRP: manejar la autenticación)
// src/app/auth/auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, of } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private _isAuthenticated = new BehaviorSubject<boolean>(false);
  isAuthenticated$ = this._isAuthenticated.asObservable();

  constructor(private http: HttpClient) {
    // Al iniciar la app, verificar si hay un token
    const token = localStorage.getItem('authToken');
    this._isAuthenticated.next(!!token);
  }

  login(credentials: any): Observable<any> {
    return this.http.post('api/login', credentials).pipe(
      tap((response: any) => {
        localStorage.setItem('authToken', response.token);
        this._isAuthenticated.next(true);
      }),
      catchError(error => {
        console.error('Error de login:', error);
        return throwError(() => new Error('Credenciales inválidas.'));
      })
    );
  }

  logout(): void {
    localStorage.removeItem('authToken');
    this._isAuthenticated.next(false);
    console.log('Usuario deslogueado.');
  }

  // Este servicio es solo para autenticación. No hace peticiones de datos de usuario,
  // ni muestra notificaciones, ni manipula el DOM.
}

// 2. Servicio de notificaciones (SRP: mostrar notificaciones)
// src/app/notification.service.ts (Ya lo usamos en el ejemplo de Singleton)
// Este servicio se encarga SÓLO de mostrar notificaciones al usuario.

// 3. Componente de Login (SRP: manejar el formulario y la interacción de login)
// src/app/auth/login/login.component.ts
import { Component } from '@angular/core';
import { AuthService } from '../../auth/auth.service';
import { NotificationService } from '../../notification.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms'; // Necesario para ngModel

@Component({
  selector: 'app-login',
  template: `
    <div class="login-card">
      <h2>Iniciar Sesión</h2>
      <input type="text" [(ngModel)]="username" placeholder="Usuario">
      <input type="password" [(ngModel)]="password" placeholder="Contraseña">
      <button (click)="onLogin()">Login</button>
      <p *ngIf="loginError" style="color: red;">{{ loginError }}</p>
    </div>
  `,
  standalone: true, // Ejemplo con standalone component para simplificar módulo
  imports: [FormsModule]
})
export class LoginComponent {
  username = '';
  password = '';
  loginError: string | null = null;

  constructor(
    private authService: AuthService,
    private notificationService: NotificationService,
    private router: Router
  ) {}

  onLogin(): void {
    this.loginError = null;
    this.authService.login({ username: this.username, password: this.password }).subscribe({
      next: () => {
        this.notificationService.show('¡Login exitoso!'); // Utiliza el servicio de notificación
        this.router.navigate(['/dashboard']); // Utiliza el router para navegar
      },
      error: (err: any) => {
        this.loginError = err.message;
        this.notificationService.show('Error de inicio de sesión.');
      }
    });
  }
}

/*
Un error común que viola el SRP es el "God Object" o "God Component",
una clase o componente que intenta manejar demasiadas responsabilidades.
Por ejemplo, un componente que contiene la lógica de negocio, hace llamadas HTTP,
maneja la autenticación y muestra notificaciones. Esto hace que el código
sea muy difícil de leer, mantener, probar y reutilizar.

Para evitarlo, divide tus responsabilidades:
- La lógica de negocio y llamadas a API van en servicios.
- Las notificaciones van en un servicio de notificaciones.
- El componente solo orquesta estas llamadas y maneja la UI.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Modularización',
    'subtopic': 'Creación de módulos funcionales',
    'definition': r'''
A medida que tu aplicación Angular crece, no querrás tener un único archivo gigante con todo tu código. Ahí es donde la "creación de módulos funcionales" entra en juego, permitiéndote organizar tu aplicación en piezas más pequeñas y manejables.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un centro comercial. En lugar de un solo espacio gigante con todas las tiendas mezcladas, está dividido en secciones: ropa, electrónica, comida, etc. Cada sección es un "módulo funcional" que agrupa tiendas relacionadas. De manera similar, en Angular, un módulo funcional es un `NgModule` que encapsula un conjunto de funcionalidades relacionadas, como `AuthModule` (para autenticación), `ProductsModule` (para la gestión de productos), o `DashboardModule`.

Estos módulos funcionales tienen varias ventajas:
* **Organización**: Mantienen tu código limpio y estructurado, haciendo que sea fácil encontrar lo que buscas.
* **Claridad**: Es más sencillo entender la responsabilidad de cada parte de tu aplicación.
* **Mantenibilidad**: Si necesitas actualizar o corregir un error en una funcionalidad específica, sabes exactamente dónde buscar.
* **Escalabilidad**: Añadir nuevas funcionalidades es más fácil cuando puedes crear nuevos módulos sin afectar el resto de la aplicación.
* **Rendimiento (con Lazy Loading)**: Si un módulo funcional se configura para cargarse perezosamente (Lazy Loading), Angular solo lo descarga cuando el usuario accede a una ruta asociada a él, lo que mejora el tiempo de carga inicial de tu aplicación.
* **Reutilización**: Puedes reutilizar módulos completos o partes de ellos en otros proyectos si están bien encapsulados.

Crear módulos funcionales es una práctica clave para desarrollar aplicaciones Angular robustas y eficientes. No solo te ayuda a ti como desarrollador, sino que también facilita la colaboración en equipos y la evolución a largo plazo del software.
''',
    'code_example': r'''
// --- CREACIÓN DE UN MÓDULO FUNCIONAL (ej. Módulo de Usuarios) ---

// 1. Generar el módulo con Angular CLI:
// `ng generate module user --routing`
// Esto crea la carpeta `user` con `user.module.ts` y `user-routing.module.ts`.

// 2. Archivo del módulo funcional (src/app/user/user.module.ts)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario para directivas comunes (ngIf, ngFor)
import { FormsModule } from '@angular/forms'; // Si los componentes del módulo usan formularios

import { UserListComponent } from './user-list/user-list.component';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserRoutingModule } from './user-routing.module'; // Importa el archivo de rutas del módulo
import { UserService } from './user.service'; // Servicio específico del módulo
import { SharedModule } from '../shared/shared.module'; // Módulo compartido para componentes reutilizables

@NgModule({
  declarations: [
    UserListComponent,
    UserDetailComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    UserRoutingModule, // Importa las rutas de este módulo
    SharedModule // Importa el módulo Shared para usar componentes comunes
  ],
  providers: [
    UserService // Proveer el servicio específico de este módulo
  ]
})
export class UserModule { }

// 3. Archivo de rutas del módulo funcional (src/app/user/user-routing.module.ts)
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UserListComponent } from './user-list/user-list.component';
import { UserDetailComponent } from './user-detail/user-detail.component';

const routes: Routes = [
  { path: '', component: UserListComponent }, // Ruta base para /user
  { path: ':id', component: UserDetailComponent } // Ruta para /user/:id
];

@NgModule({
  imports: [RouterModule.forChild(routes)], // ¡Usa forChild() para módulos funcionales!
  exports: [RouterModule]
})
export class UserRoutingModule { }

// 4. Integrar el módulo funcional en el App Routing (src/app/app-routing.module.ts)
// Se suele hacer con Lazy Loading para que el módulo se cargue solo cuando se necesite.
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
// Importa tus componentes (ej. HomeComponent, NotFoundComponent) si los usas aquí.

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  {
    path: 'users', // Cuando la URL sea /users
    loadChildren: () => import('./user/user.module').then(m => m.UserModule) // Carga perezosa del UserModule
  },
  { path: '**', component: NotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], // ¡Usa forRoot() solo en el módulo raíz!
  exports: [RouterModule]
})
export class AppRoutingModule { }

/*
Un error común al crear módulos funcionales es olvidar importar `CommonModule`
en ellos. Si un componente dentro de tu módulo funcional usa directivas como
`*ngIf`, `*ngFor`, `ngClass`, etc., y `CommonModule` no está importado,
obtendrás errores de plantilla. `CommonModule` provee esas funcionalidades básicas.

Otro error es usar `RouterModule.forRoot()` en un módulo funcional de rutas.
`forRoot()` debe usarse solo una vez en el `AppRoutingModule` raíz. Para los
módulos funcionales que se cargan perezosamente, debes usar `RouterModule.forChild()`.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Modularización',
    'subtopic': 'Reutilización de componentes y servicios',
    'definition': r'''
En el desarrollo de software, la repetición es el enemigo. La "reutilización de componentes y servicios" en Angular es una técnica poderosa que te permite construir aplicaciones más eficientes y fáciles de mantener, evitando escribir el mismo código una y otra vez.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en los LEGOs. En lugar de construir cada pieza desde cero para cada creación, tienes bloques estandarizados que puedes usar en múltiples modelos. En Angular, los componentes y servicios son tus "bloques LEGO". Si tienes un botón que se ve y se comporta de la misma manera en varias partes de tu aplicación, o un servicio que obtiene datos de usuario que necesitan múltiples componentes, ¿por qué escribirlo varias veces?

La reutilización se logra principalmente a través de:
* **Componentes Reutilizables**: Un componente es reutilizable si puede usarse en diferentes partes de la aplicación o incluso en otros proyectos, generalmente a través de `@Input()` para recibir datos y `@Output()` para emitir eventos. Estos componentes no deberían tener lógica de negocio específica de una parte de la aplicación, sino ser "presentacionales" o "UI components".
* **Servicios Compartidos**: Un servicio que maneja una funcionalidad específica (ej. comunicación con la API, gestión de estado, notificaciones) puede ser inyectado y utilizado por cualquier componente o servicio en cualquier parte de la aplicación, gracias al sistema de inyección de dependencias de Angular.
* **Módulos Compartidos (SharedModule)**: Este es el lugar ideal para agrupar y exportar componentes, directivas, pipes y servicios que son de uso común en múltiples módulos funcionales de tu aplicación. Al importar un `SharedModule`, te aseguras de que todos los componentes y servicios definidos en él estén disponibles para el módulo importador sin duplicación de código.
* **Librerías Reutilizables**: Para un nivel superior de reutilización, especialmente en grandes organizaciones, puedes empaquetar conjuntos de componentes, servicios y módulos como librerías de Angular (generadas con `ng generate library`), que pueden ser publicadas en npm y usadas en múltiples proyectos.

Reutilizar código no solo acelera el desarrollo, sino que también reduce la cantidad de código a mantener, disminuye la probabilidad de errores (ya que un bug corregido en un componente reutilizable se arregla en todos los lugares donde se usa) y mejora la consistencia de la interfaz de usuario y el comportamiento de la aplicación. Es un pilar de la programación DRY (Don't Repeat Yourself).
''',
    'code_example': r'''
// --- EJEMPLO DE REUTILIZACIÓN DE COMPONENTES Y SERVICIOS ---

// 1. Componente Reutilizable (src/app/shared/components/alert-message/alert-message.component.ts)
// Este componente solo muestra un mensaje y emite un evento al cerrarse.
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario para ngIf

@Component({
  selector: 'app-alert-message',
  template: `
    <div *ngIf="message" class="alert {{ type }}">
      <p>{{ message }}</p>
      <button (click)="closeAlert()">X</button>
    </div>
  `,
  styles: [`
    .alert { padding: 10px; margin: 10px 0; border-radius: 5px; display: flex; justify-content: space-between; align-items: center; }
    .alert.success { background-color: #d4edda; color: #155724; border-color: #c3e6cb; }
    .alert.error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
    .alert.info { background-color: #d1ecf1; color: #0c5460; border-color: #bee5eb; }
    button { background: none; border: none; font-weight: bold; cursor: pointer; }
  `],
  standalone: true // También puede ser un componente standalone para mayor reutilización
})
export class AlertMessageComponent {
  @Input() message: string | null = null;
  @Input() type: 'success' | 'error' | 'info' = 'info'; // Tipo de alerta
  @Output() closed = new EventEmitter<void>();

  closeAlert(): void {
    this.message = null; // Ocultar el mensaje al cerrar
    this.closed.emit();
  }
}

// 2. Servicio Reutilizable (src/app/core/services/api.service.ts)
// Este servicio maneja la comunicación HTTP genérica.
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root' // Disponible en toda la aplicación
})
export class ApiService {
  private baseUrl = 'https://api.yourdomain.com'; // URL base de tu API

  constructor(private http: HttpClient) { }

  get<T>(path: string): Observable<T> {
    return this.http.get<T>(`${this.baseUrl}/${path}`);
  }

  post<T>(path: string, body: any): Observable<T> {
    return this.http.post<T>(`${this.baseUrl}/${path}`, body);
  }

  put<T>(path: string, body: any): Observable<T> {
    return this.http.put<T>(`${this.baseUrl}/${path}`, body);
  }

  delete<T>(path: string): Observable<T> {
    return this.http.delete<T>(`${this.baseUrl}/${path}`);
  }
  // Este servicio es reutilizable porque es agnóstico a la entidad de negocio.
}

// 3. Módulo Compartido (src/app/shared/shared.module.ts)
// Agrupa y exporta elementos reutilizables.
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
// import { AlertMessageComponent } from './components/alert-message/alert-message.component'; // No necesario si es standalone y se importa directo
import { FormatDatePipe } from './pipes/format-date.pipe'; // Un pipe de ejemplo

@NgModule({
  declarations: [
    // AlertMessageComponent, // Si AlertMessageComponent no fuera standalone, iría aquí
    FormatDatePipe
  ],
  imports: [
    CommonModule,
    AlertMessageComponent // Importa el componente standalone aquí si quieres reexportarlo
  ],
  exports: [ // Exporta para que otros módulos puedan usarlos
    CommonModule, // Exporta CommonModule para evitar importarlo en cada módulo consumidor
    AlertMessageComponent, // Exporta el componente reutilizable
    FormatDatePipe
  ]
})
export class SharedModule { }

// 4. Uso en un módulo funcional (src/app/products/products.module.ts)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductsListComponent } from './products-list/products-list.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { SharedModule } from '../shared/shared.module'; // Importa el módulo compartido

@NgModule({
  declarations: [
    ProductsListComponent,
    ProductDetailComponent
  ],
  imports: [
    CommonModule,
    SharedModule // Ahora los componentes y pipes de SharedModule están disponibles
  ]
})
export class ProductsModule { }

// Uso de AlertMessageComponent en ProductsListComponent (src/app/products/products-list/products-list.component.ts)
import { Component, OnInit } from '@angular/core';
import { ApiService } from '../../core/services/api.service';
// import { AlertMessageComponent } from '../../shared/components/alert-message/alert-message.component'; // No necesario si SharedModule lo exporta

@Component({
  selector: 'app-products-list',
  template: `
    <h2>Lista de Productos</h2>
    <app-alert-message [message]="errorMessage" type="error" (closed)="errorMessage = null"></app-alert-message>
    <app-alert-message [message]="successMessage" type="success" (closed)="successMessage = null"></app-alert-message>
    <div *ngIf="products.length === 0 && !errorMessage">Cargando productos...</div>
    <ul>
      <li *ngFor="let product of products">
        {{ product.name | shorten:20 }} - {{ product.price | currency:'USD' }}
        (Creado: {{ product.createdAt | formatDate }})
      </li>
    </ul>
  `
})
export class ProductsListComponent implements OnInit {
  products: any[] = [];
  errorMessage: string | null = null;
  successMessage: string | null = null;

  constructor(private apiService: ApiService) { }

  ngOnInit(): void {
    this.apiService.get('products').subscribe({
      next: (data: any[]) => {
        this.products = data;
        this.successMessage = 'Productos cargados exitosamente.';
      },
      error: (err) => {
        this.errorMessage = 'Error al cargar productos.';
        console.error(err);
      }
    });
  }
}

/*
Un error común al intentar reutilizar componentes es añadir lógica de negocio específica
de un contexto particular dentro del componente reutilizable. Por ejemplo, si tu `AlertMessageComponent`
intentara cargar los mensajes de una API o tuviera reglas de validación complejas,
perdería su capacidad de ser genérico y reutilizable. Mantenlo "tonto" o "presentacional".

Otro error es importar los módulos y componentes directamente en cada archivo donde se necesitan.
Aunque técnicamente funciona, el propósito del `SharedModule` es centralizar estas exportaciones.
Si un componente está en `SharedModule` y lo importas directamente en otro módulo sin pasar por `SharedModule`,
estarías subvirtiendo la modularidad. Importa `SharedModule` una vez, y todo lo que exporte estará disponible.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Modularización',
    'subtopic': 'Gestión de dependencias entre módulos',
    'definition': r'''
En una aplicación Angular, cada módulo necesita acceder a ciertas funcionalidades que no define por sí mismo. La "gestión de dependencias entre módulos" es crucial para asegurar que todos los componentes y servicios tengan lo que necesitan para funcionar correctamente, sin crear un laberinto de importaciones.

Esto tiene una explicación, y es porque Pensemos por un momento en una cadena de montaje de coches. Para construir el motor (un módulo), necesitas piezas que vienen de otra sección (otro módulo), como los pistones o el cigüeñal. El módulo del motor "depende" de que esas piezas estén disponibles. De la misma manera, en Angular, cuando un módulo (`ProductsModule`, por ejemplo) necesita usar directivas como `*ngIf`, componentes de la interfaz de usuario que están en un módulo compartido (`SharedModule`), o servicios que están en el módulo raíz (`AppModule`), debe declarar explícitamente esas dependencias.

La gestión de dependencias entre módulos se realiza principalmente a través de los arrays `imports`, `exports` y `providers` dentro de la configuración `@NgModule`:

* **`imports`**: Aquí es donde un módulo declara de qué otros módulos depende para obtener las funcionalidades que necesita. Por ejemplo, si un componente en tu `ProductsModule` usa `*ngIf`, `ProductsModule` debe importar `CommonModule`. Si usa un componente de un `SharedModule`, debe importar `SharedModule`.
* **`exports`**: Esta sección es lo opuesto a `imports`. Un módulo funcional exporta los componentes, directivas y pipes que quiere que otros módulos puedan usar. Si un módulo exporta un componente, otros módulos pueden importarlo y utilizar ese componente en sus plantillas.
* **`providers`**: Aunque no es estrictamente una "dependencia entre módulos" en el sentido de la UI, esta sección define los servicios que este módulo proveerá. Un servicio provisto en un módulo (que no sea `providedIn: 'root'`) estará disponible para todos los componentes y servicios declarados dentro de ese mismo módulo. Si un servicio se provee en un módulo de Lazy Loading, será singleton para ese módulo y sus hijos, pero si se provee en el módulo raíz, será singleton para toda la aplicación.

Una buena gestión de dependencias evita errores de tiempo de ejecución, reduce el tamaño de los bundles finales (especialmente con Lazy Loading) y asegura que tu aplicación Angular esté bien estructurada y sea fácil de escalar. Es fundamental para construir aplicaciones mantenibles.
''',
    'code_example': r'''
// --- EJEMPLO DE GESTIÓN DE DEPENDENCIAS ENTRE MÓDULOS ---

// Proyecto con la siguiente estructura (simplificada):
// src/app/
// ├── app.module.ts (Módulo raíz)
// ├── app-routing.module.ts
// │
// ├── core/
// │   ├── core.module.ts (Módulo con servicios singleton para toda la app)
// │   └── auth.service.ts
// │
// ├── shared/
// │   ├── shared.module.ts (Módulo con componentes, directivas, pipes reutilizables)
// │   ├── components/
// │   │   └── loading-spinner/loading-spinner.component.ts
// │   └── pipes/
// │       └── truncate.pipe.ts
// │
// └── feature-dashboard/
//     ├── dashboard.module.ts (Módulo funcional lazy-loaded)
//     ├── dashboard-routing.module.ts
//     ├── components/
//     │   └── dashboard-overview/dashboard-overview.component.ts
//     └── services/
//         └── dashboard-data.service.ts


// 1. CoreModule (src/app/core/core.module.ts)
// Solo importado por AppModule una vez. Provee servicios singleton.
import { NgModule, Optional, SkipSelf } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from './auth.service';

@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ],
  providers: [
    AuthService // Provee AuthService como singleton para toda la app
  ]
})
export class CoreModule {
  constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    // Esto previene que CoreModule se importe más de una vez
    if (parentModule) {
      throw new Error(
        'CoreModule ya ha sido cargado. Impórtalo solo en AppModule.'
      );
    }
  }
}

// 2. SharedModule (src/app/shared/shared.module.ts)
// Provee componentes, directivas y pipes reutilizables para otros módulos.
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoadingSpinnerComponent } from './components/loading-spinner/loading-spinner.component';
import { TruncatePipe } from './pipes/truncate.pipe';

@NgModule({
  declarations: [
    LoadingSpinnerComponent,
    TruncatePipe
  ],
  imports: [
    CommonModule // Necesario si LoadingSpinnerComponent usa ngIf/ngFor
  ],
  exports: [ // ¡Muy importante! Lo que este módulo ofrece a otros
    CommonModule, // Exporta CommonModule para que los consumidores no tengan que importarlo
    LoadingSpinnerComponent,
    TruncatePipe
  ]
})
export class SharedModule { }

// 3. DashboardModule (src/app/feature-dashboard/dashboard.module.ts)
// Un módulo funcional lazy-loaded que depende de SharedModule y AuthService (a través de CoreModule).
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardOverviewComponent } from './components/dashboard-overview/dashboard-overview.component';
import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardDataService } from './services/dashboard-data.service';
import { SharedModule } from '../shared/shared.module'; // Importa SharedModule

@NgModule({
  declarations: [
    DashboardOverviewComponent
  ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    SharedModule // Hacemos que los elementos de SharedModule estén disponibles aquí
  ],
  providers: [
    DashboardDataService // Servicio específico para este módulo
  ]
})
export class DashboardModule { }


// 4. AppModule (src/app/app.module.ts)
// Módulo raíz que importa CoreModule (solo una vez) y define el lazy-loading de otros módulos.
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CoreModule } from './core/core.module'; // Importa CoreModule (solo aquí)
// import { SharedModule } from './shared/shared.module'; // NO importar SharedModule aquí si solo se usa en feature modules

@NgModule({
  declarations: [
    AppComponent,
    // HomeComponent, NotFoundComponent si estuvieran aquí
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    CoreModule // Importa CoreModule para que sus servicios sean singleton
    // SharedModule // Importar SharedModule en AppModule si los componentes en AppModule.declarations lo necesitan
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 5. Ejemplo de componente usando dependencias (src/app/feature-dashboard/components/dashboard-overview/dashboard-overview.component.ts)
import { Component, OnInit } from '@angular/core';
import { DashboardDataService } from '../../services/dashboard-data.service';
import { AuthService } from '../../../core/auth.service'; // Servicio del CoreModule
import { Observable } from 'rxjs';

@Component({
  selector: 'app-dashboard-overview',
  template: `
    <h3>Resumen del Dashboard</h3>
    <div *ngIf="loading">
      <app-loading-spinner></app-loading-spinner> Cargando datos...
    </div>
    <div *ngIf="data$ | async as data">
      <p>Bienvenido, {{ (authService.isAuthenticated$ | async) ? 'Usuario Autenticado' : 'Invitado' }}</p>
      <p>Mensaje truncado: {{ data.message | truncate:10 }}</p> </div>
  `
})
export class DashboardOverviewComponent implements OnInit {
  loading = true;
  data$: Observable<any> | undefined;

  constructor(
    private dashboardDataService: DashboardDataService,
    public authService: AuthService // Inyecta el servicio de autenticación
  ) { }

  ngOnInit(): void {
    this.data$ = this.dashboardDataService.getDashboardData();
    this.data$.subscribe(() => this.loading = false);
  }
}

/*
Un error común es importar un módulo en el array `declarations` en lugar de `imports`.
`declarations` es solo para componentes, directivas y pipes que *pertenecen* a ese módulo.
Si un módulo A quiere usar algo de un módulo B, A debe `import` B en su array `imports`.

Otro error es importar `SharedModule` en `AppModule` si los componentes y servicios de `AppModule`
no lo necesitan directamente, y todos tus módulos funcionales son lazy-loaded y lo importan por separado.
Si `SharedModule` se importa en `AppModule` y también en módulos lazy-loaded, sus servicios
podrían dejar de ser singleton (si no tienen `providedIn: 'root'`) y sus componentes podrían
duplicarse en diferentes bundles, lo que afectaría el rendimiento. La regla general es:
- **CoreModule**: Importado una vez en `AppModule` para servicios singleton.
- **SharedModule**: Importado en módulos funcionales que necesitan sus componentes/pipes/directivas.
  NO debe tener `providers` a menos que sean servicios con ámbito local del módulo compartido.
  NO debe ser importado por módulos lazy-loaded si tiene `providers` (crearía nuevas instancias del servicio).
*/
'''
  });
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Escalabilidad',
    'subtopic': 'Estrategias para aplicaciones grandes',
    'definition': r'''
Crear una pequeña aplicación Angular es una cosa, pero construir una que crezca hasta ser una aplicación grande y compleja es otra muy distinta. Las "estrategias para aplicaciones grandes" son cruciales para asegurarte de que tu proyecto pueda manejar un aumento significativo en tamaño y funcionalidad sin convertirse en un desastre.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en construir una ciudad. Si solo piensas en una pequeña aldea, harías casas al azar y calles sin planificar. Pero si la ciudad va a crecer hasta ser una metrópolis, necesitas un plan maestro: distritos bien definidos, infraestructura de transporte eficiente, sistemas de servicios públicos robustos, etc. De la misma manera, una aplicación Angular grande necesita una arquitectura bien pensada desde el principio.

Algunas de las estrategias clave son:
* **Modularización Robusta**: Ya hemos hablado de esto, pero es el pilar. Divide tu aplicación en módulos funcionales bien definidos (características, compartidos, core) para encapsular responsabilidades y facilitar el desarrollo independiente.
* **Lazy Loading**: Carga solo el código que el usuario necesita en ese momento. Esto es fundamental para reducir el tamaño del bundle inicial y mejorar el tiempo de carga, lo cual es vital en aplicaciones con muchas funcionalidades.
* **Gestión de Estado Centralizada**: A medida que la aplicación crece, el estado de los datos se vuelve complejo. Usar patrones como NgRx (Redux para Angular) o NgXs te proporciona una forma predecible y escalable de manejar el estado global de tu aplicación.
* **Arquitectura Basada en Componentes 'Smart' y 'Dumb' (Contenedor/Presentacional)**: Los componentes "tontos" (dumb/presentacionales) se enfocan solo en la interfaz de usuario, recibiendo datos a través de `@Input` y emitiendo eventos a través de `@Output`. Los componentes "inteligentes" (smart/contenedor) manejan la lógica de negocio, la comunicación con servicios y el estado, y luego pasan los datos a los componentes tontos. Esto mejora la reutilización y la testabilidad.
* **Uso Consistente de la Inyección de Dependencias**: Angular te ayuda con esto, pero es importante usarla correctamente para inyectar servicios donde se necesiten, promoviendo el bajo acoplamiento y la facilidad de prueba.
* **Convenciones de Nomenclatura y Estructura de Carpetas**: Establecer y seguir convenciones claras para nombrar archivos, clases y organizar carpetas hace que el proyecto sea mucho más navegable para cualquier desarrollador.
* **Pruebas Exhaustivas y Automatizadas**: A medida que la aplicación crece, las pruebas manuales se vuelven imposibles. Implementar pruebas unitarias, de integración y de extremo a extremo automatizadas es vital para garantizar que los nuevos cambios no introduzcan regresiones.

Al adoptar estas estrategias, no solo construyes una aplicación que funciona hoy, sino que también la preparas para crecer y evolucionar en el futuro, manteniendo la calidad y la velocidad de desarrollo.
''',
    'code_example': r'''
// --- EJEMPLO DE ESTRATEGIAS PARA APLICACIONES GRANDES ---

// 1. Estructura de carpetas robusta (reiterando el tema de módulos)
// src/app/
// ├── core/           // Servicios singleton (AuthService, LoggingService)
// ├── shared/         // Componentes, directivas, pipes reutilizables (LoadingSpinner, AlertMessage)
// ├── features/       // Módulos lazy-loaded (Products, Users, Admin, Orders)
// │   ├── products/
// │   │   ├── components/
// │   │   ├── services/
// │   │   ├── models/
// │   │   └── products.module.ts
// │   ├── users/
// │   └── ...
// └── app.module.ts
// └── app-routing.module.ts

// 2. Lazy Loading en app-routing.module.ts
// (Ver ejemplo en el subtopic "Lazy Loading y módulos compartidos" para más detalles)
// const routes: Routes = [
//   {
//     path: 'products',
//     loadChildren: () => import('./features/products/products.module').then(m => m.ProductsModule)
//   },
//   {
//     path: 'admin',
//     loadChildren: () => import('./features/admin/admin.module').then(m => m.AdminModule)
//   },
// ];

// 3. Componentes "Smart" (Contenedor) y "Dumb" (Presentacional)

// src/app/shared/components/product-card/product-card.component.ts (Dumb/Presentacional)
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common'; // Para ngIf, ngFor si fuera necesario

@Component({
  selector: 'app-product-card',
  template: `
    <div class="product-card">
      <img [src]="product.imageUrl" alt="{{ product.name }}">
      <h3>{{ product.name }}</h3>
      <p>{{ product.price | currency:'USD' }}</p>
      <button (click)="addToCart.emit(product)">Añadir al Carrito</button>
    </div>
  `,
  styles: [`
    .product-card { border: 1px solid #ccc; padding: 15px; margin: 10px; text-align: center; }
    img { max-width: 100px; height: auto; }
  `],
  standalone: true // Hace que sea más fácil de reutilizar
})
export class ProductCardComponent {
  @Input() product: any; // Recibe datos
  @Output() addToCart = new EventEmitter<any>(); // Emite eventos

  // No tiene lógica de negocio ni llamadas a servicios. Solo muestra datos y emite interacciones.
}

// src/app/features/products/components/product-list-container/product-list-container.component.ts (Smart/Contenedor)
import { Component, OnInit } from '@angular/core';
import { ProductService } from '../../services/product.service'; // Servicio con lógica de negocio
import { ProductCardComponent } from '../../../shared/components/product-card/product-card.component'; // Importa el componente Dumb
import { CommonModule } from '@angular/common'; // Para ngIf, ngFor

@Component({
  selector: 'app-product-list-container',
  template: `
    <h2>Nuestros Productos</h2>
    <div *ngIf="loading">Cargando productos...</div>
    <div *ngIf="error" style="color: red;">{{ error }}</div>
    <div class="product-grid">
      <app-product-card
        *ngFor="let product of products"
        [product]="product"
        (addToCart)="onAddToCart($event)">
      </app-product-card>
    </div>
  `,
  styles: [`
    .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 20px; }
  `],
  standalone: true, // Puede ser standalone si se usa con rutas o en otros modulos
  imports: [CommonModule, ProductCardComponent]
})
export class ProductListContainerComponent implements OnInit {
  products: any[] = [];
  loading: boolean = false;
  error: string | null = null;

  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.loading = true;
    this.productService.getProducts().subscribe({
      next: (data) => {
        this.products = data;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Error al cargar productos.';
        this.loading = false;
        console.error(err);
      }
    });
  }

  onAddToCart(product: any): void {
    console.log('Añadir al carrito:', product.name);
    // Aquí iría la lógica de añadir al carrito, probablemente delegando a otro servicio.
  }
}

// src/app/features/products/services/product.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { delay } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private products = [
    { id: 1, name: 'Laptop Pro', price: 1200, imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Laptop' },
    { id: 2, name: 'Teclado Mecánico', price: 80, imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Teclado' },
    { id: 3, name: 'Mouse Gamer', price: 50, imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Mouse' },
  ];

  constructor(private http: HttpClient) { }

  getProducts(): Observable<any[]> {
    // Simula una llamada API
    return of(this.products).pipe(delay(500));
  }
}

/*
Un error común es mezclar las responsabilidades de los componentes "smart" y "dumb".
Si un componente "dumb" empieza a hacer llamadas HTTP o a manejar lógica de negocio,
pierde su reusabilidad y su claridad, convirtiéndose en un "componente dios" que es
difícil de mantener y probar.

Otro error es no aplicar Lazy Loading en aplicaciones grandes.
Si tu `AppModule` importa directamente todos los módulos de tus características (`AuthModule`, `ProductsModule`, etc.),
todos esos módulos se cargarán al inicio de la aplicación, incluso si el usuario solo
necesita acceder a una pequeña parte de ella. Esto resultará en un bundle inicial
muy grande y tiempos de carga lentos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Escalabilidad',
    'subtopic': 'Optimización de rendimiento',
    'definition': r'''
Una aplicación Angular no solo debe funcionar, sino que debe hacerlo de manera rápida y fluida, especialmente cuando crece en tamaño y complejidad. La "optimización de rendimiento" se trata de hacer que tu aplicación sea lo más eficiente posible para el usuario.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en un atleta. No solo entrena para correr; entrena para correr *más rápido* y *sin cansarse* demasiado. Esto implica optimizar su técnica, su dieta, su equipo. De manera similar, en Angular, la optimización de rendimiento es un proceso continuo para que tu aplicación cargue más rápido, responda más rápido a las interacciones y consuma menos recursos.

Algunas áreas clave para optimizar son:
* **Lazy Loading de Módulos y Componentes**: Como ya vimos, cargar solo lo que se necesita al inicio reduce drásticamente el tamaño del bundle inicial y, por ende, el tiempo de carga. Si un módulo es grande y solo se accede a él por una ruta específica, hazlo lazy-loaded.
* **Estrategia de Detección de Cambios (OnPush)**: Angular por defecto verifica todo el árbol de componentes cada vez que hay un cambio. Usar `ChangeDetectionStrategy.OnPush` en los componentes le dice a Angular que solo verifique el componente si sus `@Input()` cambian (referencialmente), si un evento se emite desde él, o si se marca manualmente para verificación. Esto reduce enormemente el número de componentes que Angular necesita revisar, mejorando la velocidad de actualización de la UI.
* **Evitar Cálculos Costosos en Plantillas**: Las expresiones en las plantillas (como `{{ value | myExpensivePipe }}` o llamadas a funciones) se ejecutan con cada ciclo de detección de cambios. Si tienes funciones que hacen cálculos complejos, múevelas a los componentes o a pipes puros si la lógica es simple y solo depende de los inputs.
* **Uso de Pipes Puros**: Los pipes puros solo se re-ejecutan si sus inputs cambian. Evita los pipes impuros si no son absolutamente necesarios, ya que se ejecutarán en cada ciclo de detección de cambios, incluso si los datos de entrada no han cambiado.
* **Virtual Scrolling para Listas Grandes**: Si tienes listas con cientos o miles de elementos, renderizar todos a la vez es ineficiente. Angular CDK ofrece `VirtualScroll` que solo renderiza los elementos visibles en la pantalla, mejorando el rendimiento de scroll.
* **Optimización de Imágenes y Activos**: Usa imágenes con el tamaño y formato adecuados, comprímelas, y considera usar CDN (Content Delivery Network).
* **Gestión de Suscripciones RxJS**: Siempre desuscríbete de los observables en `ngOnDestroy()` para evitar fugas de memoria. Usa `async pipe` en las plantillas o el operador `takeUntil()` para manejar esto automáticamente.
* **Análisis de Bundles**: Herramientas como `webpack-bundle-analyzer` te permiten visualizar el tamaño de tus bundles y identificar qué partes de tu código (y librerías de terceros) están ocupando más espacio, para que puedas optimizar.

La optimización de rendimiento es un esfuerzo continuo que requiere un buen entendimiento de cómo funciona Angular y el ecosistema web, pero que se traduce directamente en una mejor experiencia para el usuario final.
''',
    'code_example': r'''
// --- EJEMPLO DE OPTIMIZACIÓN DE RENDIMIENTO EN ANGULAR ---

// 1. `ChangeDetectionStrategy.OnPush` en un componente
// src/app/product-item/product-item.component.ts
import { Component, Input, ChangeDetectionStrategy } from '@angular/core';
import { CommonModule } from '@angular/common'; // Para ngIf, ngFor si fuera necesario

@Component({
  selector: 'app-product-item',
  template: `
    <div class="product-item">
      <h4>{{ product.name }}</h4>
      <p>Precio: {{ product.price | currency:'USD' }}</p>
      <p>Cantidad: {{ product.quantity }}</p>
    </div>
  `,
  styles: [`
    .product-item { border: 1px solid #eee; padding: 10px; margin: 5px; }
  `],
  changeDetection: ChangeDetectionStrategy.OnPush, // ¡Solo se verifica si sus Inputs cambian!
  standalone: true
})
export class ProductItemComponent {
  @Input() product: any; // El objeto producto
  // Si el objeto `product` muta (ej. `product.quantity++`) pero no se reasigna,
  // el componente no se actualizará con OnPush. Necesitarías un nuevo objeto.
}

// 2. Uso de `ChangeDetectionStrategy.OnPush` en un contenedor con productos
// src/app/product-list/product-list.component.ts
import { Component, OnInit, ChangeDetectionStrategy, ChangeDetectorRef } from '@angular/core';
import { ProductItemComponent } from '../product-item/product-item.component';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-product-list',
  template: `
    <h2>Lista de Productos (OnPush)</h2>
    <button (click)="addProduct()">Añadir Producto (Mutando array)</button>
    <button (click)="updateFirstProductQuantity()">Actualizar Cantidad (Mutando objeto)</button>
    <button (click)="replaceFirstProduct()">Actualizar Cantidad (Reemplazando objeto)</button>
    <button (click)="markForCheck()">Forzar Detección de Cambios</button>

    <div class="product-items">
      <app-product-item *ngFor="let prod of products; trackBy: trackById" [product]="prod"></app-product-item>
    </div>
  `,
  changeDetection: ChangeDetectionStrategy.OnPush, // El padre también usa OnPush
  standalone: true,
  imports: [CommonModule, ProductItemComponent]
})
export class ProductListComponent implements OnInit {
  products: any[] = [];
  private nextId = 1;

  constructor(private cdr: ChangeDetectorRef) { } // Para forzar detección de cambios manualmente

  ngOnInit(): void {
    this.products = [
      { id: this.nextId++, name: 'Producto A', price: 10, quantity: 1 },
      { id: this.nextId++, name: 'Producto B', price: 20, quantity: 2 },
    ];
  }

  addProduct(): void {
    // Esto MUTARÁ el array. Con OnPush, este componente NO se actualizará a menos que:
    // 1. Un evento se emita desde un hijo con OnPush.
    // 2. Un input de este componente cambie.
    // 3. Se llame a `this.cdr.detectChanges()` o `this.cdr.markForCheck()`.
    this.products.push({ id: this.nextId++, name: `Producto ${String.fromCharCode(64 + this.nextId)}`, price: this.nextId * 5, quantity: 1 });
    console.log('Array mutado. ProductList NO se actualiza visualmente automáticamente (con OnPush).');
    // Para que se actualice con la mutación, deberías:
    this.cdr.detectChanges(); // Forzar detección de cambios en este componente y sus hijos
    // O mejor, crear una nueva referencia de array:
    // this.products = [...this.products, { id: this.nextId++, name: `Producto ${String.fromCharCode(64 + this.nextId)}`, price: this.nextId * 5, quantity: 1 }];
  }

  updateFirstProductQuantity(): void {
    if (this.products.length > 0) {
      // Esto MUTARÁ el objeto dentro del array.
      // Si ProductItemComponent usa OnPush, NO se actualizará automáticamente.
      this.products[0].quantity++;
      console.log('Cantidad del primer producto mutada. ProductItem NO se actualiza automáticamente (con OnPush).');
      // Para que ProductItem se actualice, el objeto `product` debe ser una nueva referencia.
      // O forzar la detección en el padre: this.cdr.detectChanges();
    }
  }

  replaceFirstProduct(): void {
    if (this.products.length > 0) {
      // Esto crea una NUEVA referencia para el primer producto, y una nueva referencia para el array.
      // Tanto ProductList (por el array nuevo) como ProductItem (por el objeto `product` nuevo) se actualizarán con OnPush.
      const updatedProduct = { ...this.products[0], quantity: this.products[0].quantity + 1 };
      this.products = [updatedProduct, ...this.products.slice(1)];
      console.log('Primer producto reemplazado y array nuevo. Ambos componentes se actualizan (con OnPush).');
    }
  }

  markForCheck(): void {
    this.cdr.markForCheck(); // Marca el componente para que sea verificado la próxima vez que Angular ejecute un ciclo
    console.log('markForCheck() llamado. Forzará la detección de cambios en el siguiente ciclo.');
  }

  // `trackBy` es crucial para `*ngFor` en listas grandes, mejora el rendimiento de re-renderizado
  trackById(index: number, item: any): number {
    return item.id;
  }
}

// 3. Gestión de Suscripciones con `async` Pipe (¡la forma más fácil!)
// (Ver ejemplo en `dashboard-overview.component.ts` del subtema anterior)
// <div *ngIf="data$ | async as data"> ... </div>
// El `async` pipe automáticamente se suscribe y desuscribe, evitando fugas de memoria.

/*
Un error común es usar `ChangeDetectionStrategy.Default` en todos los componentes.
En aplicaciones grandes, esto puede llevar a un rendimiento deficiente, ya que Angular
tendrá que realizar muchísimas verificaciones innecesarias en cada ciclo.
Cambiar a `OnPush` para la mayoría de los componentes es una optimización clave.

Otro error es no usar `trackBy` con `*ngFor` para listas dinámicas o muy grandes.
Sin `trackBy`, Angular re-renderiza todos los elementos de la lista cuando cambia.
Con `trackBy`, Angular puede identificar qué elementos han cambiado, se han añadido
o eliminado, y solo actualizar los nodos del DOM correspondientes, lo que mejora
drásticamente el rendimiento, especialmente en operaciones como añadir o mover elementos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Buenas Prácticas',
    'topic': 'Escalabilidad',
    'subtopic': 'Mantenimiento y actualización de proyectos',
    'definition': r'''
Desarrollar una aplicación es solo la mitad de la batalla; la otra mitad, y a menudo la más larga, es el "mantenimiento y actualización" del proyecto. Esto implica desde corregir errores hasta mantener la aplicación compatible con las últimas versiones de Angular y sus dependencias.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en un coche. No lo compras y te olvidas de él; necesitas llevarlo al taller para revisiones periódicas, cambiar el aceite, actualizar el software y reparar cualquier avería. Si no lo haces, eventualmente dejará de funcionar o te dará problemas. De manera similar, un proyecto de software necesita atención continua.

El mantenimiento en Angular incluye:
* **Corrección de Errores (Bugs)**: La realidad es que siempre aparecerán. Un buen mantenimiento implica tener procesos claros para reportar, priorizar y corregir errores de manera eficiente.
* **Actualizaciones de Dependencias**: El ecosistema de JavaScript evoluciona rápidamente. Regularmente, necesitas actualizar Angular CLI, las librerías de Angular (core, common, router, etc.) y otras dependencias de terceros (RxJS, librerías de UI, etc.). Esto es crucial por varias razones:
    * **Seguridad**: Las versiones más recientes a menudo contienen parches de seguridad importantes.
    * **Rendimiento**: Las nuevas versiones pueden incluir optimizaciones que hacen tu aplicación más rápida.
    * **Nuevas Características**: Accederás a nuevas funcionalidades y mejoras en el lenguaje y los frameworks.
    * **Compatibilidad**: Evitar que tu proyecto se quede obsoleto y se vuelva incompatible con herramientas modernas.
* **Refactorización del Código**: A medida que entiendes mejor la aplicación o las mejores prácticas evolucionan, es necesario reorganizar y mejorar el código existente sin cambiar su comportamiento externo.
* **Optimización del Rendimiento**: El rendimiento no es algo que se hace una vez. Monitorear y optimizar continuamente es parte del mantenimiento.
* **Eliminación de Código Obsoleto (Dead Code)**: Deshacerse del código que ya no se usa ayuda a mantener el proyecto limpio y ligero.
* **Mejoras de la Experiencia del Desarrollador (DX)**: Optimizar el entorno de desarrollo, añadir mejores scripts npm o mejorar la documentación interna, contribuye al mantenimiento a largo plazo.

Angular CLI tiene herramientas potentes (`ng update`) que simplifican el proceso de actualización, pero aun así requiere planificación y pruebas. Un buen mantenimiento asegura que tu aplicación siga siendo robusta, segura y relevante a lo largo del tiempo, prolongando su vida útil y reduciendo el costo total de propiedad.
''',
    'code_example': r'''
// --- EJEMPLOS DE MANTENIMIENTO Y ACTUALIZACIÓN EN ANGULAR ---

// 1. Actualización de Angular CLI y las librerías de Angular
// Abre tu terminal en la raíz del proyecto.

// A. Actualizar Angular CLI globalmente (una vez en tu máquina):
// `npm install -g @angular/cli@latest`

// B. Actualizar las librerías de Angular en tu proyecto a la última versión compatible:
// `ng update @angular/cli @angular/core`
// Este comando es inteligente:
// - Analiza tu `package.json`.
// - Descarga las últimas versiones de Angular y Angular CLI que sean compatibles.
// - Ejecuta "esquemas" de actualización que modifican automáticamente tu código
//   para adaptarse a cambios rompientes (breaking changes) o nuevas convenciones.
// - Si hay varios saltos de versión (ej. de Angular 12 a 17), es mejor hacerlo
//   paso a paso (ej. 12 -> 13 -> 14...) usando `ng update --next` o especificando
//   la versión de destino.
//   Ej: `ng update @angular/cli@13 @angular/core@13`

// C. Actualizar otras dependencias de npm:
// `npm update` // Actualiza a las últimas versiones permitidas por `package.json`
// `npm outdated` // Muestra las dependencias que están desactualizadas
// `npm install <package-name>@latest` // Para actualizar una dependencia específica a la última versión

// 2. Comandos útiles para el mantenimiento:

// Limpiar la caché de npm (a veces resuelve problemas de dependencias):
// `npm cache clean --force`

// Reinstalar todas las dependencias desde cero (útil para solucionar problemas):
// `rm -rf node_modules package-lock.json` (en Linux/macOS)
// `rd /s /q node_modules && del package-lock.json` (en Windows PowerShell)
// `npm install`

// Ejecutar pruebas (para asegurar que las actualizaciones no rompieron nada):
// `ng test`
// `ng e2e` (si usas Cypress/Protractor)

// Linting y formateo (para mantener la calidad y consistencia del código):
// `ng lint` // Ejecuta ESLint o TSLint (si aún lo usas)
// `npm run format` // Si configuraste Prettier (ej. `prettier --write "src/**/*.ts"`)

// Analizar el tamaño del bundle (para optimización de rendimiento):
// `ng build --stats-json`
// `npx webpack-bundle-analyzer dist/your-app-name/stats.json`

// 3. Consideraciones de código para el mantenimiento:
// - Comentarios claros y concisos.
// - Código bien formateado y consistente (usa Prettier y ESLint).
// - Nombres de variables, funciones y clases significativos.
// - Documentación de componentes complejos o decisiones de arquitectura.
// - Uso de constantes y enums en lugar de "magic strings" o "magic numbers".

// Ejemplo de un `package.json` con scripts de mantenimiento
/*
{
  "name": "my-angular-app",
  "version": "1.0.0",
  "scripts": {
    "ng": "ng",
    "start": "ng serve",
    "build": "ng build",
    "test": "ng test",
    "lint": "ng lint",
    "e2e": "ng e2e",
    "format": "prettier --write \"src/**/*.{ts,html,scss}\"",
    "check-updates": "ncu -u", // npm-check-updates para ver y actualizar dependencias
    "analyze-bundle": "ng build --stats-json && webpack-bundle-analyzer dist/my-angular-app/stats.json"
  },
  "devDependencies": {
    // ...
    "prettier": "^3.0.0",
    "webpack-bundle-analyzer": "^4.9.0",
    "npm-check-updates": "^16.10.19"
  }
}
*/

/*
Un error común es posponer las actualizaciones de Angular y sus dependencias
durante demasiado tiempo. Esto puede llevar a una "deuda técnica" significativa,
donde la brecha entre tu versión y la última es tan grande que la actualización
se vuelve extremadamente difícil y costosa. Es mejor realizar actualizaciones
menores y regulares.

Otro error es no tener un proceso de pruebas robusto antes y después de una actualización.
Aunque `ng update` hace un gran trabajo, los cambios en las librerías de terceros
o en la lógica de tu propia aplicación pueden romper la funcionalidad.
Siempre ejecuta tus pruebas unitarias y de integración después de cualquier actualización.
*/
'''
  });
}

Future<void> insertAngularMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NgRx',
    'subtopic': 'Conceptos de Store, Actions y Reducers',
    'definition': r'''
Cuando tu aplicación Angular empieza a crecer y el manejo de datos se vuelve complejo, necesitas una forma robusta y predecible de gestionar el estado. Aquí es donde entra NgRx, una librería inspirada en el patrón Redux, que te ayuda a mantener el estado de tu aplicación de forma centralizada y consistente.

Esto tiene una explicación, y es porque Pensemos por un momento en una oficina con un archivador central. Cualquier cambio en un documento (el "estado") se hace a través de un procedimiento estricto y registrado. El "archivador central" es tu Store, las "solicitudes de cambio" son tus Actions, y los "procedimientos para realizar esos cambios" son tus Reducers.

* **Store**: Imagina el Store como la única fuente de verdad para el estado de tu aplicación. Es un objeto inmutable que contiene todos los datos que tu aplicación necesita en un momento dado. Cualquier parte de tu aplicación puede leer el estado del Store, pero nadie puede modificarlo directamente. Esta inmutabilidad es clave para la previsibilidad y la depuración. Cuando el estado cambia, se crea una nueva versión del estado en lugar de modificar la existente.
* **Actions**: Las Actions son eventos. Son objetos simples que describen lo que ha sucedido en tu aplicación. Por ejemplo, `"[Product Page] Load Products"`, `"[User] Login Success"` o `"[Cart] Add Item"`. Son la *única* forma de iniciar un cambio en el estado de la aplicación. Las Actions son despachadas (dispatched) al Store para indicar que algo ha ocurrido. Contienen un `type` (un string que describe el evento) y opcionalmente un `payload` (los datos relevantes para el evento).
* **Reducers**: Los Reducers son funciones puras que toman el estado actual de la aplicación y una Action, y devuelven un *nuevo* estado. Son la única parte de NgRx que puede modificar el estado. La pureza significa que, dado el mismo estado y la misma acción, un reducer siempre devolverá el mismo resultado, y no tendrá efectos secundarios (como llamadas a APIs o mutaciones directas del estado). Un reducer es como una máquina expendedora: le das un estado actual y una acción (tu dinero y tu selección), y te devuelve un nuevo estado (el producto que seleccionaste, más el cambio si aplica), sin afectar nada más en el mundo.

Juntos, el Store, las Actions y los Reducers forman el núcleo del patrón Redux, proporcionando un flujo de datos unidireccional y predecible que hace que la gestión del estado en aplicaciones Angular grandes sea mucho más manejable y depurable.
''',
    'code_example': r'''
// --- EJEMPLO DE NGRX: STORE, ACTIONS Y REDUCERS ---

// 1. Definir el estado (src/app/state/app.state.ts)
export interface AppState {
  counter: number;
  // Otros estados pueden ir aquí, ej:
  // user: UserState;
  // products: ProductState;
}

// 2. Definir las Actions (src/app/state/counter.actions.ts)
// Se usan `createAction` para crear acciones con tipo único
import { createAction, props } from '@ngrx/store';

export const increment = createAction('[Counter] Increment');
export const decrement = createAction('[Counter] Decrement');
export const reset = createAction('[Counter] Reset');
export const multiply = createAction('[Counter] Multiply', props<{ factor: number }>());

// 3. Definir el Reducer (src/app/state/counter.reducer.ts)
// Una función pura que maneja los cambios de estado en respuesta a las acciones
import { createReducer, on } from '@ngrx/store';
import { increment, decrement, reset, multiply } from './counter.actions';

export const initialState = 0; // Estado inicial para este slice del Store

// El reducer toma el estado actual y una acción, y devuelve un nuevo estado inmutable
export const counterReducer = createReducer(
  initialState,
  on(increment, (state) => state + 1), // Si la acción es 'increment', retorna nuevo estado (estado + 1)
  on(decrement, (state) => state - 1),
  on(reset, (state) => 0),
  on(multiply, (state, { factor }) => state * factor) // Accede al payload con desestructuración
);

// 4. Integrar en el AppModule (src/app/app.module.ts)
// Instalar: `npm install @ngrx/store`
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { StoreModule } from '@ngrx/store'; // Importar StoreModule
import { counterReducer } from './state/counter.reducer'; // Importar el reducer
import { AppComponent } from './app.component';
import { CounterComponent } from './counter/counter.component'; // Un componente para interactuar con el Store

@NgModule({
  declarations: [
    AppComponent,
    CounterComponent
  ],
  imports: [
    BrowserModule,
    // Configurar el Store. 'counter' es el nombre del slice de estado.
    StoreModule.forRoot({ counter: counterReducer })
    // Si tuvieras más slices, irían aquí:
    // StoreModule.forRoot({ counter: counterReducer, user: userReducer, products: productReducer })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 5. Usar en un Componente (src/app/counter/counter.component.ts)
import { Component } from '@angular/core';
import { Store, select } from '@ngrx/store'; // Importar Store y select
import { Observable } from 'rxjs';
import { increment, decrement, reset, multiply } from '../state/counter.actions';
import { AppState } from '../state/app.state';

@Component({
  selector: 'app-counter',
  template: `
    <div class="counter-container">
      <h2>Contador: {{ count$ | async }}</h2>
      <button (click)="onIncrement()">Incrementar</button>
      <button (click)="onDecrement()">Decrementar</button>
      <button (click)="onMultiply()">Multiplicar por 2</button>
      <button (click)="onReset()">Resetear</button>
    </div>
  `,
  styles: [`
    .counter-container { border: 1px solid #ccc; padding: 20px; margin: 20px; text-align: center; }
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
  `]
})
export class CounterComponent {
  count$: Observable<number>; // Observable para el estado del contador

  constructor(private store: Store<AppState>) {
    // Seleccionar el slice 'counter' del Store.
    // Usamos `select` para obtener un Observable que emite el valor actual del estado.
    this.count$ = store.pipe(select('counter'));
  }

  onIncrement(): void {
    // Despachar la acción 'increment'
    this.store.dispatch(increment());
  }

  onDecrement(): void {
    this.store.dispatch(decrement());
  }

  onMultiply(): void {
    // Despachar la acción 'multiply' con un payload
    this.store.dispatch(multiply({ factor: 2 }));
  }

  onReset(): void {
    this.store.dispatch(reset());
  }
}

/*
Un error común al trabajar con reducers es mutar el estado directamente.
Un reducer debe ser una función pura, lo que significa que no debe modificar
el objeto de estado existente, sino siempre devolver un *nuevo* objeto de estado.
Ejemplo INCORRECTO:
on(increment, (state) => { state++; return state; }); // ¡ERROR! Esto muta `state`

Ejemplo CORRECTO (como se hizo arriba):
on(increment, (state) => state + 1); // Retorna un nuevo valor

Otro error es olvidar importar `StoreModule.forRoot()` en tu módulo raíz
(o `StoreModule.forFeature()` en módulos lazy-loaded si tienes varios slices de estado).
Si no lo importas, Angular no sabrá cómo inyectar el `Store` y obtendrás errores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NgRx',
    'subtopic': 'Efectos y Selectores',
    'definition': r'''
Ya tienes el Store, las Actions y los Reducers para manejar el estado. Pero, ¿qué pasa con las operaciones asíncronas, como las llamadas a una API? Aquí es donde entran los "Efectos" de NgRx. Además, para acceder a partes específicas y derivadas de tu estado de forma eficiente, usas los "Selectores".

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en nuestro archivador central de antes. Las "acciones" (solicitudes de cambio) van al archivador. Pero, ¿y si una solicitud requiere que alguien vaya a buscar algo afuera (como un informe de otro departamento)? Esa tarea de ir afuera es un "Efecto". Y cuando quieres ver un informe específico, o un resumen de varios documentos, no buscas todo el archivador, usas un "Selector" para obtener la información precisa que necesitas.

* **Efectos (Effects)**: Los Efectos son piezas de código que escuchan las Actions despachadas y realizan tareas secundarias (side effects) fuera del Store, como llamadas HTTP a una API, interacciones con el localStorage, o la navegación. Una vez que el Efecto completa su tarea (ej. la API devuelve una respuesta), despacha una nueva Action (ej. `"[Products API] Load Products Success"`) con los datos resultantes o un error. Esta nueva Action luego es procesada por un Reducer para actualizar el estado. Los Efectos mantienen la pureza de los Reducers, ya que toda la lógica asíncrona se maneja por separado. Ayudan a aislar la complejidad de las operaciones asíncronas, haciendo tu código más limpio y fácil de probar.

* **Selectores (Selectors)**: Los Selectores son funciones puras que toman el estado del Store como argumento y devuelven una porción específica del estado, o un estado derivado (calculado a partir del estado existente). Son como "queries" optimizadas para tu Store. Por ejemplo, en lugar de obtener todo el objeto `products` y luego filtrar en tu componente, puedes tener un selector que te devuelva directamente `getAllAvailableProducts` o `getTotalCartValue`. La principal ventaja de los selectores es que son **memorizados** (memoized). Esto significa que no recalculan su valor a menos que las porciones del estado de las que dependen realmente cambien. Esto mejora el rendimiento, especialmente cuando tienes cálculos complejos o muchos componentes escuchando el mismo selector. Además, los selectores promueven la consistencia y la reutilización al centralizar la lógica para acceder al estado.

Juntos, los Efectos y los Selectores complementan el patrón Redux de NgRx, proporcionando una solución completa para manejar tanto las operaciones asíncronas como la lectura eficiente del estado en aplicaciones a gran escala.
''',
    'code_example': r'''
// --- EJEMPLO DE NGRX: EFECTOS Y SELECTORES ---

// 1. Definir un estado más complejo (src/app/products/state/products.state.ts)
export interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
  available: boolean;
}

export interface ProductsState {
  products: Product[];
  loading: boolean;
  error: string | null;
}

export const initialState: ProductsState = {
  products: [],
  loading: false,
  error: null,
};

// 2. Definir Actions para la carga de productos (src/app/products/state/products.actions.ts)
import { createAction, props } from '@ngrx/store';
import { Product } from './products.state';

export const loadProducts = createAction('[Products Page] Load Products');
export const loadProductsSuccess = createAction(
  '[Products API] Load Products Success',
  props<{ products: Product[] }>()
);
export const loadProductsFailure = createAction(
  '[Products API] Load Products Failure',
  props<{ error: string }>()
);

// 3. Definir el Reducer para productos (src/app/products/state/products.reducer.ts)
import { createReducer, on } from '@ngrx/store';
import { loadProducts, loadProductsSuccess, loadProductsFailure } from './products.actions';
import { initialState, ProductsState } from './products.state';

export const productsReducer = createReducer(
  initialState,
  on(loadProducts, (state) => ({ ...state, loading: true, error: null })),
  on(loadProductsSuccess, (state, { products }) => ({
    ...state,
    products,
    loading: false,
  })),
  on(loadProductsFailure, (state, { error }) => ({
    ...state,
    error,
    loading: false,
    products: [], // Limpiar productos si hay error
  }))
);

// 4. Definir un Servicio (simulado) para la API (src/app/products/product.api.service.ts)
import { Injectable } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { delay, tap } from 'rxjs/operators';
import { Product } from './state/products.state';

@Injectable({
  providedIn: 'root'
})
export class ProductApiService {
  private dummyProducts: Product[] = [
    { id: 1, name: 'Laptop', price: 1200, description: 'Portátil potente', available: true },
    { id: 2, name: 'Smartphone', price: 800, description: 'Teléfono inteligente', available: true },
    { id: 3, name: 'Auriculares', price: 150, description: 'Con cancelación de ruido', available: false },
    { id: 4, name: 'Monitor', price: 300, description: 'Pantalla de alta resolución', available: true },
  ];

  getProducts(): Observable<Product[]> {
    console.log('ProductApiService: Llamando a la API de productos...');
    // Simula una llamada HTTP con un retardo y un posible error
    return of(this.dummyProducts).pipe(
      delay(1000),
      tap(() => {
        // Simular un error aleatorio
        if (Math.random() > 0.8) {
          console.error('ProductApiService: Error simulado!');
          throw new Error('Error al cargar productos desde el servidor.');
        }
      })
    );
  }
}

// 5. Definir los Efectos (src/app/products/state/products.effects.ts)
// Instalar: `npm install @ngrx/effects`
import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { of } from 'rxjs';
import { catchError, map, switchMap } from 'rxjs/operators';
import { loadProducts, loadProductsSuccess, loadProductsFailure } from './products.actions';
import { ProductApiService } from '../product.api.service';

@Injectable()
export class ProductsEffects {
  constructor(private actions$: Actions, private productApiService: ProductApiService) {}

  // Este efecto escucha la acción 'loadProducts'
  loadProducts$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadProducts), // Filtra para que solo se active con 'loadProducts'
      switchMap(() => // switchMap cancela peticiones anteriores si se despacha de nuevo 'loadProducts'
        this.productApiService.getProducts().pipe(
          map(products => loadProductsSuccess({ products })), // Si tiene éxito, despacha 'loadProductsSuccess'
          catchError(error => of(loadProductsFailure({ error: error.message }))) // Si falla, despacha 'loadProductsFailure'
        )
      )
    )
  );
}

// 6. Definir los Selectores (src/app/products/state/products.selectors.ts)
// Instalar: `npm install @ngrx/store` (ya deberías tenerlo)
import { createFeatureSelector, createSelector } from '@ngrx/store';
import { ProductsState } from './products.state';
import { AppState } from '../../state/app.state'; // Asegúrate de que AppState tenga `products: ProductsState`

// Selector para obtener el slice completo del estado de productos
export const selectProductsState = createFeatureSelector<ProductsState>('products');

// Selector para obtener la lista de productos
export const selectAllProducts = createSelector(
  selectProductsState,
  (state: ProductsState) => state.products
);

// Selector para obtener productos disponibles (ejemplo de estado derivado)
export const selectAvailableProducts = createSelector(
  selectAllProducts,
  (products: Product[]) => products.filter(product => product.available)
);

// Selector para obtener el estado de carga
export const selectProductsLoading = createSelector(
  selectProductsState,
  (state: ProductsState) => state.loading
);

// Selector para obtener el error
export const selectProductsError = createSelector(
  selectProductsState,
  (state: ProductsState) => state.error
);


// 7. Integrar en el AppModule y un Feature Module (src/app/app.module.ts)
// (Suponiendo que 'products' es un feature module lazy-loaded)
// Instalar: `npm install @ngrx/store @ngrx/effects`
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { StoreDevtoolsModule } from '@ngrx/store-devtools'; // Para depuración (opcional, pero muy útil)
import { isDevMode } from '@angular/core';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    StoreModule.forRoot({ /* app-level reducers if any */ }),
    EffectsModule.forRoot([]), // Efectos globales si los hubiera, o vacio
    StoreDevtoolsModule.instrument({
      maxAge: 25, // Retains last 25 states
      logOnly: !isDevMode(), // Restrict extension to log-only mode
      autoPause: true, // Pauses recording actions and state changes when the extension window is not open
      trace: false, //  If set to true, will include stack trace for every dispatched action, so you can see where it was dispatched from
      traceLimit: 75, //  The number of action's stack traces to keep in store.
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/products/products.module.ts (Feature Module)
// Este módulo se cargaría perezosamente (lazy-loaded)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';

import { ProductsRoutingModule } from './products-routing.module';
import { ProductListComponent } from './components/product-list/product-list.component';
import { productsReducer } from './state/products.reducer';
import { ProductsEffects } from './state/products.effects';

@NgModule({
  declarations: [
    ProductListComponent
  ],
  imports: [
    CommonModule,
    ProductsRoutingModule,
    // Importa StoreModule.forFeature para un slice de estado de un módulo específico
    StoreModule.forFeature('products', productsReducer),
    // Importa EffectsModule.forFeature para los efectos de este módulo
    EffectsModule.forFeature([ProductsEffects])
  ]
})
export class ProductsModule { }

// 8. Usar Selectores en un Componente (src/app/products/components/product-list/product-list.component.ts)
import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { loadProducts } from '../../state/products.actions';
import { selectAllProducts, selectProductsLoading, selectProductsError, selectAvailableProducts } from '../../state/products.selectors';
import { AppState } from '../../../state/app.state'; // Asegúrate de que tu AppState es accesible

@Component({
  selector: 'app-product-list',
  template: `
    <h2>Lista de Productos</h2>
    <button (click)="onLoadProducts()">Recargar Productos</button>

    <div *ngIf="loading$ | async">Cargando productos...</div>
    <div *ngIf="error$ | async as errorMessage" style="color: red;">Error: {{ errorMessage }}</div>

    <h3>Todos los Productos</h3>
    <ul>
      <li *ngFor="let product of (allProducts$ | async)">
        {{ product.name }} - ${{ product.price }} ({{ product.available ? 'Disponible' : 'Agotado' }})
      </li>
    </ul>

    <h3>Productos Disponibles</h3>
    <ul>
      <li *ngFor="let product of (availableProducts$ | async)">
        {{ product.name }} - ${{ product.price }}
      </li>
    </ul>
  `,
  styles: [`
    ul { list-style: none; padding: 0; }
    li { margin-bottom: 5px; }
    button { margin-top: 10px; padding: 10px 15px; cursor: pointer; }
  `]
})
export class ProductListComponent implements OnInit {
  allProducts$: Observable<any[]>;
  availableProducts$: Observable<any[]>;
  loading$: Observable<boolean>;
  error$: Observable<string | null>;

  constructor(private store: Store<AppState>) {
    // Usar los selectores para obtener Observables del estado
    this.allProducts$ = this.store.select(selectAllProducts);
    this.availableProducts$ = this.store.select(selectAvailableProducts);
    this.loading$ = this.store.select(selectProductsLoading);
    this.error$ = this.store.select(selectProductsError);
  }

  ngOnInit(): void {
    this.onLoadProducts(); // Despachar la acción para cargar productos al iniciar
  }

  onLoadProducts(): void {
    this.store.dispatch(loadProducts());
  }
}

/*
Un error común con los Efectos es olvidar importar `EffectsModule.forRoot()`
en el módulo raíz y `EffectsModule.forFeature()` en los módulos de características.
Si no lo haces, tus Efectos no se registrarán y no escucharán las acciones.

Otro error es realizar lógica de side effect directamente en el Reducer.
Los Reducers deben ser funciones puras y no deben contener lógica asíncrona,
llamadas a API, o manipulaciones del DOM. Esos son trabajos para los Efectos.

Para los Selectores, un error es acceder directamente al estado del Store
(`this.store.pipe(select(state => state.products.products))`) en lugar de usar
selectores creados con `createSelector`. Los selectores `createSelector`
son memorizados y optimizan el rendimiento al evitar recálculos innecesarios,
mientras que acceder directamente al estado no tiene esta optimización.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NgRx',
    'subtopic': 'Integración con Angular',
    'definition': r'''
NgRx es una librería externa, pero está diseñada para integrarse de forma fluida con el framework de Angular. Entender cómo se conectan te permitirá aprovechar al máximo el poder de NgRx para la gestión de estado de tu aplicación.

Esto tiene una explicación, y es porque Pensemos por un momento en un sistema de sonido en un gran auditorio. El sistema NgRx es como la mesa de mezclas centralizada (el Store y los Reducers) que controla todas las señales de audio. Los micrófonos y los instrumentos (tus componentes) envían señales al mezclador (disparan Actions). Las grabadoras y los efectos especiales (tus Efectos) procesan las señales sin interferir con la mesa principal. Y los altavoces (tus componentes que muestran el estado) reciben la señal final. La integración con Angular es cómo todo esto se cablea correctamente para que funcione en armonía.

La integración de NgRx con Angular se manifiesta principalmente a través de:
* **Inyección de Dependencias (DI)**: Como cualquier otro servicio en Angular, el `Store` de NgRx (y otros servicios internos de NgRx como `Actions`) se inyecta en tus componentes, servicios y efectos utilizando el constructor. Esto significa que Angular maneja la creación y provisión de estas instancias por ti, siguiendo el principio de Inversión de Control.
* **Módulos de NgRx (`StoreModule`, `EffectsModule`, `StoreDevtoolsModule`)**: Para que Angular sepa cómo configurar y dónde encontrar las piezas de NgRx, debes importar y configurar los módulos de NgRx en tu `AppModule` (con `.forRoot()`) y en tus módulos de características (con `.forFeature()`). Estos módulos registran los servicios y los reducers/efectos necesarios en el sistema de inyección de dependencias de Angular.
* **Observables y el `async` pipe**: NgRx Store devuelve Observables cuando seleccionas una parte del estado. Angular es nativamente reactivo y trabaja muy bien con Observables. El `async` pipe en las plantillas de Angular es la forma más idiomática y segura de consumir Observables de NgRx, ya que se suscribe y desuscribe automáticamente, previniendo fugas de memoria y manteniendo tu lógica de vista limpia.
* **OnPush Change Detection Strategy**: NgRx promueve la inmutabilidad del estado. Cuando el estado en el Store cambia, se crea un *nuevo* objeto de estado. Esto es perfecto para trabajar con la estrategia de detección de cambios `OnPush` de Angular. Al usar `OnPush` en tus componentes, Angular solo verificará si los inputs de un componente (o el estado que recibe a través de un selector) han cambiado referencialmente, lo que reduce drásticamente el número de detecciones de cambios y mejora el rendimiento de tu aplicación.
* **Intercepción de HTTP con Efectos**: Los Efectos a menudo interactúan con un `HttpClient` (que es un servicio de Angular) para realizar llamadas a la API. Esto demuestra cómo la lógica asíncrona de NgRx se integra con la funcionalidad de red de Angular.

Esta profunda integración significa que NgRx no es simplemente una adición a tu aplicación, sino una extensión natural de la forma en que Angular ya trabaja con la reactividad y la inyección de dependencias, proporcionando un ecosistema cohesivo para la gestión de estado.
''',
    'code_example': r'''
// --- EJEMPLO DE INTEGRACIÓN DE NGRX CON ANGULAR ---

// 1. Configuración de Módulos (Revisión de lo anterior, central para la integración)
// src/app/app.module.ts
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Para Efectos que hacen llamadas HTTP
import { StoreModule } from '@ngrx/store'; // Módulo principal del Store
import { EffectsModule } from '@ngrx/effects'; // Módulo para Efectos
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { counterReducer } from './state/counter.reducer'; // Importa tu reducer (puede ser global)

// Importa módulos de NGRX DevTools para una mejor depuración (opcional pero recomendado)
import { StoreDevtoolsModule } from '@ngrx/store-devtools';
import { isDevMode } from '@angular/core';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule, // Necesario para que los efectos puedan usar HttpClient
    AppRoutingModule,
    // StoreModule.forRoot({}) - Si tienes un reducer de nivel de aplicación
    StoreModule.forRoot({ counter: counterReducer }), // Ejemplo con un reducer de nivel de aplicación
    EffectsModule.forRoot([]), // Efectos de nivel de aplicación o vacío
    StoreDevtoolsModule.instrument({
      maxAge: 25, // Retains last 25 states
      logOnly: !isDevMode(), // Restrict extension to log-only mode
      autoPause: true,
      trace: true, // Útil para ver de dónde se despachan las acciones
      traceLimit: 75,
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/products/products.module.ts (Módulo de Característica Lazy-Loaded)
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StoreModule } from '@ngrx/store'; // Para el slice de estado de la característica
import { EffectsModule } from '@ngrx/effects'; // Para los efectos de la característica
import { ProductsRoutingModule } from './products-routing.module';
import { ProductListComponent } from './components/product-list/product-list.component';
import { productsReducer } from './state/products.reducer'; // Reducer de la característica
import { ProductsEffects } from './state/products.effects'; // Efectos de la característica

@NgModule({
  declarations: [
    ProductListComponent
  ],
  imports: [
    CommonModule,
    ProductsRoutingModule,
    // Registrar el reducer para este slice de estado
    StoreModule.forFeature('products', productsReducer),
    // Registrar los efectos para este módulo
    EffectsModule.forFeature([ProductsEffects])
  ]
})
export class ProductsModule { }


// 2. Uso de `Store` con Inyección de Dependencias en un Componente
// (Ya visto en ejemplos anteriores, pero es el pilar)
// src/app/some-component/some-component.component.ts
import { Component, OnInit } from '@angular/core';
import { Store, select } from '@ngrx/store'; // Inyectar Store y select

@Component({
  selector: 'app-some-component',
  template: `
    <p>Estado del contador: {{ (counter$ | async) }}</p>
  `
})
export class SomeComponent implements OnInit {
  counter$: Observable<number>;

  constructor(private store: Store<any>) { // Angular DI inyecta el Store
    this.counter$ = this.store.pipe(select('counter'));
  }

  ngOnInit(): void {
    // Despachar acciones al Store inyectado
    // this.store.dispatch(someAction());
  }
}

// 3. Consumir Observables con `async` pipe en la plantilla
// (Evita fugas de memoria y simplifica el código del componente)
// src/app/product-list/product-list.component.html
/*
<div *ngIf="loading$ | async">Cargando...</div>
<div *ngFor="let product of (products$ | async)">
  {{ product.name }}
</div>
*/

// 4. Estrategia de Detección de Cambios `OnPush`
// (Combina perfectamente con la inmutabilidad de NgRx)
// src/app/display-product/display-product.component.ts
import { Component, Input, ChangeDetectionStrategy } from '@angular/core';

@Component({
  selector: 'app-display-product',
  template: `
    <div class="product-info">
      <h3>{{ product.name }}</h3>
      <p>Precio: {{ product.price | currency:'USD' }}</p>
    </div>
  `,
  changeDetection: ChangeDetectionStrategy.OnPush, // Optimización de rendimiento
  standalone: true // También puede ser un componente standalone
})
export class DisplayProductComponent {
  @Input() product: any;
  // Este componente solo se actualizará si la referencia del objeto `product` cambia.
  // Como NgRx devuelve nuevos objetos de estado, esto funciona de maravilla.
}

/*
Un error común es intentar suscribirse a Observables del Store manualmente en componentes
y olvidar desuscribirse en `ngOnDestroy()`. Aunque no es un error de "integración",
es una mala práctica que la integración con `async` pipe resuelve.
El `async` pipe es la forma preferida en Angular para consumir Observables en plantillas,
ya que maneja automáticamente las suscripciones y desuscripciones.

Otro error es no diferenciar entre `StoreModule.forRoot()` y `StoreModule.forFeature()`.
`forRoot()` debe usarse solo una vez en el módulo raíz (`AppModule`) para configurar el Store
global. `forFeature()` se usa en módulos de características (a menudo lazy-loaded)
para registrar reducers y efectos específicos de esa característica, creando un slice de estado
para ese módulo. Mezclarlos o usarlos incorrectamente puede llevar a errores en la gestión del estado.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NGXS',
    'subtopic': 'Configuración y uso básico',
    'definition': r'''
Si ya estás familiarizado con NgRx o buscas otra forma de gestionar el estado en tus aplicaciones Angular, NGXS es una excelente alternativa. Es un patrón de gestión de estado inspirado en Redux, pero diseñado para ser más conciso y usar clases y decoradores de TypeScript, lo que puede resultar más familiar para los desarrolladores de Angular.

Vamos a ver de que se trata todo esto... Pensemos por un momento en un gerente de proyectos. Tiene un panel donde ve el "estado" actual de todos los proyectos. Para cambiar algo, no lo hace directamente en el panel; emite "órdenes" claras (Actions). Y el equipo, siguiendo "instrucciones" específicas (State y Actions), actualiza el panel. NGXS simplifica un poco este proceso al agrupar las "instrucciones" y las "órdenes" relacionadas en un solo lugar.

NGXS se basa en los siguientes conceptos clave:
* **State**: En NGXS, el estado se define como una clase decorada con `@State()`. Esta clase no solo contiene la forma del estado, sino también los métodos que responden a las acciones para modificar ese estado. Esto agrupa la lógica de un "slice" del estado en un solo lugar, lo que puede mejorar la coherencia y la facilidad de lectura.
* **Actions**: Al igual que en NgRx, las Actions son objetos que describen un evento. En NGXS, las acciones son típicamente clases simples con un `static readonly type` que identifica la acción y un constructor para el `payload`. Cuando despachas una acción, NGXS la envía a los métodos de estado correspondientes.
* **`@Action()` Decorator**: Este es el corazón de cómo el estado es modificado en NGXS. Dentro de la clase de estado, defines métodos decorados con `@Action()`. Estos métodos especifican qué acción están escuchando y cómo deben actualizar el estado inmutable. Son el equivalente a los Reducers de NgRx, pero integrados directamente en la clase de estado.
* **`Store` Service**: Es el servicio que inyectas en tus componentes y servicios para despachar acciones (con `store.dispatch()`) y seleccionar partes del estado (con `store.select()`).
* **`@Selector()` Decorator**: NGXS también ofrece selectores para obtener partes del estado de forma eficiente. Al igual que en NgRx, los selectores de NGXS son memorizados para optimizar el rendimiento.

NGXS busca reducir el código boilerplate en comparación con otras librerías de gestión de estado, haciendo que sea más rápido escribir y mantener la lógica del estado, especialmente en aplicaciones de tamaño medio a grande.
''',
    'code_example': r'''
// --- EJEMPLO DE NGXS: CONFIGURACIÓN Y USO BÁSICO ---

// 1. Instalar NGXS:
// `npm install @ngxs/store`

// 2. Definir una Action (src/app/state/counter.actions.ts)
// En NGXS, las acciones son clases
export class Increment {
  static readonly type = '[Counter] Increment';
}

export class Decrement {
  static readonly type = '[Counter] Decrement';
}

export class Reset {
  static readonly type = '[Counter] Reset';
}

export class Multiply {
  static readonly type = '[Counter] Multiply';
  constructor(public factor: number) {} // Payload como propiedad del constructor
}

// 3. Definir el Estado (src/app/state/counter.state.ts)
// La clase de estado contiene el estado y los métodos que lo modifican
import { State, Action, StateContext } from '@ngxs/store'; // Importar decoradores y tipos
import { Increment, Decrement, Reset, Multiply } from './counter.actions';

export interface CounterStateModel {
  count: number;
}

@State<CounterStateModel>({
  name: 'counter', // Nombre del slice de estado en el Store
  defaults: {
    count: 0, // Estado inicial
  },
})
export class CounterState {
  // Métodos que responden a las acciones y modifican el estado
  @Action(Increment)
  increment(ctx: StateContext<CounterStateModel>) {
    const state = ctx.getState(); // Obtener el estado actual
    ctx.setState({ count: state.count + 1 }); // Actualizar el estado inmutablemente
  }

  @Action(Decrement)
  decrement(ctx: StateContext<CounterStateModel>) {
    const state = ctx.getState();
    ctx.setState({ count: state.count - 1 });
  }

  @Action(Reset)
  reset(ctx: StateContext<CounterStateModel>) {
    ctx.setState({ count: 0 });
  }

  @Action(Multiply)
  multiply(ctx: StateContext<CounterStateModel>, action: Multiply) {
    const state = ctx.getState();
    ctx.setState({ count: state.count * action.factor }); // Acceder al payload de la acción
  }
}

// 4. Integrar en el AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgxsModule } from '@ngxs/store'; // Importar NgxsModule
import { CounterState } from './state/counter.state'; // Importar la clase de estado
import { AppComponent } from './app.component';
import { CounterComponent } from './counter/counter.component';
import { environment } from '../environments/environment'; // Para configuración del Store en producción

@NgModule({
  declarations: [
    AppComponent,
    CounterComponent
  ],
  imports: [
    BrowserModule,
    NgxsModule.forRoot([CounterState], { // Registrar los estados globales
      developmentMode: !environment.production // Habilitar modo desarrollo para mejor depuración
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 5. Usar en un Componente (src/app/counter/counter.component.ts)
import { Component } from '@angular/core';
import { Store, Select } from '@ngxs/store'; // Importar Store y Select
import { Observable } from 'rxjs';
import { Increment, Decrement, Reset, Multiply } from '../state/counter.actions';
import { CounterState, CounterStateModel } from '../state/counter.state';

@Component({
  selector: 'app-counter',
  template: `
    <div class="counter-container">
      <h2>Contador: {{ count$ | async }}</h2>
      <button (click)="onIncrement()">Incrementar</button>
      <button (click)="onDecrement()">Decrementar</button>
      <button (click)="onMultiply()">Multiplicar por 2</button>
      <button (click)="onReset()">Resetear</button>
    </div>
  `,
  styles: [`
    .counter-container { border: 1px solid #ccc; padding: 20px; margin: 20px; text-align: center; }
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
  `]
})
export class CounterComponent {
  // @Select() decorador para seleccionar directamente una parte del estado
  @Select(CounterState.count) count$!: Observable<number>;

  constructor(private store: Store) { }

  onIncrement(): void {
    this.store.dispatch(new Increment()); // Despachar una instancia de la acción
  }

  onDecrement(): void {
    this.store.dispatch(new Decrement());
  }

  onMultiply(): void {
    this.store.dispatch(new Multiply(2)); // Pasar el payload al constructor
  }

  onReset(): void {
    this.store.dispatch(new Reset());
  }
}

/*
Un error común en NGXS es olvidar el `static readonly type` en las clases de acción.
NGXS lo usa para identificar qué acción se ha despachado. Si falta, la acción no será
reconocida por el `@Action()` correspondiente en tu clase de estado.

Otro error es intentar mutar el estado directamente dentro del método `@Action()`.
Al igual que con NgRx, NGXS requiere que el estado sea inmutable. Siempre debes usar
`ctx.setState()` o `patchState()` para devolver un *nuevo* objeto de estado.
Ejemplo INCORRECTO:
@Action(Increment)
increment(ctx: StateContext<CounterStateModel>) {
  ctx.getState().count++; // ¡ERROR! Mutación directa
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NGXS',
    'subtopic': 'Plugins y DevTools',
    'definition': r'''
Una de las grandes ventajas de usar una librería de gestión de estado como NGXS (o NgRx) es el ecosistema de herramientas que la rodea. En particular, los "Plugins" y las "DevTools" (Herramientas de Desarrollo) son fundamentales para extender la funcionalidad de NGXS y para depurar tu aplicación de manera eficiente.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un coche de carreras. No solo tiene un motor potente (el Store), sino también un montón de sensores y pantallas en el salpicadero (las DevTools) para que el piloto pueda ver en tiempo real cómo está funcionando. Además, puede tener sistemas auxiliares (los Plugins) para mejorar el rendimiento, como un sistema de telemetría que graba cada detalle del viaje. En NGXS, los Plugins y DevTools te dan superpoderes para entender y mejorar tu aplicación.

* **Plugins**: NGXS es modular por diseño, y los plugins extienden su funcionalidad principal sin añadir complejidad al núcleo. Algunos plugins comunes incluyen:
    * **`@ngxs/devtools-plugin`**: Esencial para la depuración, se integra con la extensión Redux DevTools de tu navegador, permitiéndote ver el historial de acciones, el estado en cada punto, e incluso "viajar en el tiempo" para ver cómo el estado cambió.
    * **`@ngxs/logger-plugin`**: Muy útil durante el desarrollo, registra todas las acciones despachadas y el estado resultante en la consola del navegador, proporcionando un seguimiento claro de lo que está sucediendo.
    * **`@ngxs/storage-plugin`**: Permite persistir una parte o la totalidad del estado de NGXS en el localStorage (o sessionStorage) del navegador, para que el estado se mantenga incluso después de recargar la página.
    * **`@ngxs/form-plugin`**: Sincroniza automáticamente el estado de los formularios de Angular con el Store de NGXS, simplificando la gestión de formularios complejos.
    * **`@ngxs/router-plugin`**: Sincroniza el estado del enrutador de Angular con el Store de NGXS, permitiéndote acceder a la información de la ruta directamente desde el estado.

* **DevTools (Redux DevTools Extension)**: Aunque no es un plugin de NGXS per se, el plugin `@ngxs/devtools-plugin` se integra con esta extensión del navegador. Redux DevTools es una herramienta increíblemente poderosa para depurar aplicaciones que usan patrones de gestión de estado tipo Redux. Con ella, puedes:
    * Ver cada acción que se despacha.
    * Inspeccionar el estado del Store antes y después de cada acción.
    * "Viajar en el tiempo" (Time-travel debugging): regresar a un estado anterior para depurar problemas.
    * Re-despachar acciones.
    * Exportar e importar el historial de acciones.

El uso de plugins y DevTools transforma la experiencia de desarrollo con NGXS, haciendo que la depuración de flujos de estado complejos sea mucho más sencilla y visual, lo que a su vez acelera el desarrollo y mejora la calidad del código.
''',
    'code_example': r'''
// --- EJEMPLO DE NGXS: PLUGINS Y DEVTOOLS ---

// 1. Instalar Plugins:
// `npm install @ngxs/devtools-plugin @ngxs/logger-plugin @ngxs/storage-plugin`

// 2. Configurar Plugins en el AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgxsModule } from '@ngxs/store';
import { NgxsLoggerPluginModule } from '@ngxs/logger-plugin'; // Para ver logs en consola
import { NgxsReduxDevtoolsPluginModule } from '@ngxs/devtools-plugin'; // Para integración con Redux DevTools
import { NgxsStoragePluginModule } from '@ngxs/storage-plugin'; // Para persistir estado
import { AppComponent } from './app.component';
import { CounterState } from './state/counter.state';
import { environment } from '../environments/environment'; // Para habilitar solo en desarrollo

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    NgxsModule.forRoot([CounterState], {
      developmentMode: !environment.production // Habilitar modo desarrollo del Store
    }),
    // Configuración de Plugins:
    NgxsLoggerPluginModule.forRoot({
      disabled: environment.production // Deshabilitar logger en producción
    }),
    NgxsReduxDevtoolsPluginModule.forRoot({
      disabled: environment.production // Deshabilitar devtools en producción
    }),
    NgxsStoragePluginModule.forRoot({
      key: ['counter.count'], // Persistir solo la propiedad 'count' del slice 'counter'
      // O para persistir todo el slice 'counter': key: ['counter']
      // O para persistir varios slices: key: ['counter', 'auth.user']
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 3. Ejemplo de Interacción (src/app/counter/counter.component.ts)
// No hay cambios en el componente mismo, los plugins actúan "detrás de escenas"
// para mejorar la depuración y la persistencia.

// El componente sigue despachando acciones y seleccionando el estado como antes:
/*
import { Component } from '@angular/core';
import { Store, Select } from '@ngxs/store';
import { Observable } from 'rxjs';
import { Increment, Decrement, Reset, Multiply } from '../state/counter.actions';
import { CounterState } from '../state/counter.state';

@Component({
  selector: 'app-counter',
  template: `
    <div class="counter-container">
      <h2>Contador: {{ count$ | async }}</h2>
      <button (click)="onIncrement()">Incrementar</button>
      <button (click)="onDecrement()">Decrementar</button>
      <button (click)="onMultiply()">Multiplicar por 2</button>
      <button (click)="onReset()">Resetear</button>
    </div>
  `,
  styles: [`
    .counter-container { border: 1px solid #ccc; padding: 20px; margin: 20px; text-align: center; }
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
  `]
})
export class CounterComponent {
  @Select(CounterState.count) count$!: Observable<number>;

  constructor(private store: Store) { }

  onIncrement(): void {
    this.store.dispatch(new Increment());
  }

  onDecrement(): void {
    this.store.dispatch(new Decrement());
  }

  onMultiply(): void {
    this.store.dispatch(new Multiply(2));
  }

  onReset(): void {
    this.store.dispatch(new Reset());
  }
}
*/

/*
Un error común es no deshabilitar los plugins de depuración (logger, devtools)
en el entorno de producción (`environment.production`). Mantenerlos activos en
producción puede exponer información sensible del estado, añadir sobrecarga al
navegador y, en algunos casos, incluso abrir agujeros de seguridad si no se
configuran correctamente. Siempre usa `environment.production` para deshabilitarlos.

Otro error, específico del `storage-plugin`, es persistir demasiados datos
innecesariamente o datos sensibles que no deberían estar en el localStorage.
Sé selectivo con la propiedad `key` del `NgxsStoragePluginModule` para guardar
solo lo esencial y lo seguro.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'NGXS',
    'subtopic': 'Comparación con NgRx',
    'definition': r'''
Cuando se trata de gestión de estado en Angular, NgRx y NGXS son las dos opciones más populares y robustas. Ambos siguen el patrón Redux, pero tienen diferencias filosóficas y de implementación que pueden influir en tu elección.

Seguramente pensarás de qué va todo esto... La idea es que Pensemos por un momento en dos tipos de arquitectos para construir una casa muy grande. Uno (NgRx) te da todas las herramientas separadas: ladrillos, cemento, tuberías, y te dice "aquí tienes los planos, constrúyelo". El otro (NGXS) te da algunos componentes prefabricados, como paredes completas con ventanas y puertas, y te dice "aquí tienes estos módulos, solo ensámblalos siguiendo esta guía". Ambos construyen la casa, pero la experiencia y el proceso son diferentes.

Aquí te presento una comparación clave para ayudarte a entender sus diferencias:

* **Curva de Aprendizaje y Código Boilerplate**:
    * **NgRx**: Tiene una curva de aprendizaje un poco más pronunciada inicialmente debido a la separación explícita de `Actions` (creadas con `createAction`), `Reducers` (con `createReducer`), `Effects` (clases separadas con `createEffect`), y `Selectors` (con `createSelector`). Esto resulta en más archivos y más "código repetitivo" (boilerplate) al principio. Sin embargo, esta separación ofrece una gran granularidad y flexibilidad.
    * **NGXS**: Generalmente se considera que tiene una curva de aprendizaje más suave y menos código boilerplate. Consolida `Reducers` y `Effects` en una sola clase `@State()`. Usa decoradores (`@Action()`, `@Selector()`) y un enfoque más orientado a clases, lo que puede resultar más familiar para los desarrolladores acostumbrados a la programación orientada a objetos en Angular.

* **Filosofía y Enfoque**:
    * **NgRx**: Más cercano a la implementación pura de Redux. Fomenta la inmutabilidad explícita y la composición funcional. Es muy transparente y ofrece un control granular sobre cada pieza del flujo de estado.
    * **NGXS**: Se esfuerza por ser más "Angular-like" al utilizar clases, decoradores y un API más conciso. Abstrae un poco más la complejidad subyacente del patrón Redux, haciendo que el desarrollo sea más rápido para algunos equipos.

* **Efectos (Side Effects)**:
    * **NgRx**: Utiliza `@ngrx/effects`, donde los efectos son clases separadas que escuchan acciones y despachan nuevas acciones. El manejo de observables (RxJS) es explícito y muy potente.
    * **NGXS**: Los efectos se manejan directamente dentro de la clase `@State()` usando el decorador `@Action()`. Puedes retornar observables o promesas directamente desde el método de acción, lo que simplifica la lógica asíncrona.

* **Selectores**:
    * **NgRx**: Usa `createSelector` para crear selectores memorizados y componibles, con una clara separación entre el selector y el componente.
    * **NGXS**: Provee el decorador `@Select()` para acceder fácilmente a partes del estado desde los componentes, y también soporta selectores más complejos definidos como métodos estáticos en la clase de estado con `@Selector()`. Ambos son memorizados.

* **Comunidad y Madurez**:
    * **NgRx**: Es más maduro, tiene una comunidad más grande y una documentación más extensa debido a su antigüedad. Es la opción por defecto en muchos proyectos empresariales grandes.
    * **NGXS**: Más joven, pero ha ganado mucha tracción por su enfoque más "Angular-friendly". La comunidad es activa y sigue creciendo.

**¿Cuál elegir?**
* Si prefieres la consistencia y la separación de preocupaciones explícita del patrón Redux clásico, estás acostumbrado a RxJS, y buscas una solución madura con una gran comunidad y recursos, **NgRx** podría ser tu mejor opción.
* Si valoras la concisión, un menor código boilerplate, una sintaxis más "Angular-like" con clases y decoradores, y una curva de aprendizaje potencialmente más rápida, **NGXS** podría ser más adecuado para tu proyecto.

Ambas son excelentes herramientas para gestionar el estado y la elección a menudo se reduce a la preferencia del equipo y los requisitos específicos del proyecto.
''',
    'code_example': r'''
// --- EJEMPLO COMPARATIVO DE NGXS Y NGRX ---

// La comparación se hace más a nivel conceptual y de estructura de código
// que con un ejemplo de código que muestre las dos implementaciones a la vez,
// ya que sus APIs son diferentes. Los ejemplos anteriores ya muestran
// la implementación de cada una. Aquí resaltamos las diferencias estructurales.

// --- NGXS ---
// (Ver 'Configuración y uso básico' para el código completo)

// NGXS: Acción como clase
/*
export class AddItem {
  static readonly type = '[Cart] Add Item';
  constructor(public item: Product) {}
}
*/

// NGXS: Estado y Reducción (en la misma clase)
/*
import { State, Action, StateContext, Selector } from '@ngxs/store';

export interface CartStateModel {
  items: Product[];
}

@State<CartStateModel>({
  name: 'cart',
  defaults: {
    items: [],
  },
})
export class CartState {
  @Action(AddItem)
  addItem(ctx: StateContext<CartStateModel>, action: AddItem) {
    const state = ctx.getState();
    ctx.setState({
      items: [...state.items, action.item], // Inmutabilidad
    });
  }

  // Los selectores también pueden ser métodos estáticos aquí
  @Selector()
  static getCartItems(state: CartStateModel) {
    return state.items;
  }
}
*/

// NGXS: Efectos (también dentro de la clase de estado con @Action)
/*
// Si `AddItem` necesitara un efecto (ej. guardar en API después de añadir al carrito)
@Action(AddItem)
addItem(ctx: StateContext<CartStateModel>, action: AddItem) {
  const state = ctx.getState();
  ctx.setState({ items: [...state.items, action.item] }); // Primero actualiza el estado

  // Luego, la lógica asíncrona que dispara otra acción o hace algo
  return this.apiService.saveCart(ctx.getState().items).pipe(
    tap(() => ctx.dispatch(new CartSavedSuccess())),
    catchError(error => ctx.dispatch(new CartSavedFailure(error)))
  );
}
*/

// --- NGRX ---
// (Ver 'Conceptos de Store, Actions y Reducers' y 'Efectos y Selectores' para el código completo)

// NGRX: Acción como función (createAction)
/*
import { createAction, props } from '@ngrx/store';
export const addItem = createAction(
  '[Cart] Add Item',
  props<{ item: Product }>()
);
export const addItemSuccess = createAction('[Cart API] Add Item Success');
export const addItemFailure = createAction('[Cart API] Add Item Failure', props<{ error: any }>());
*/

// NGRX: Reducer (función pura separada)
/*
import { createReducer, on } from '@ngrx/store';
import { addItem } from './cart.actions';

export interface CartState {
  items: Product[];
}

export const initialState: CartState = {
  items: [],
};

export const cartReducer = createReducer(
  initialState,
  on(addItem, (state, { item }) => ({
    ...state,
    items: [...state.items, item], // Inmutabilidad
  }))
);
*/

// NGRX: Efecto (clase separada)
/*
import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { of } from 'rxjs';
import { catchError, map, switchMap } from 'rxjs/operators';
import { addItem, addItemSuccess, addItemFailure } from './cart.actions';
import { CartApiService } from '../cart.api.service';

@Injectable()
export class CartEffects {
  constructor(private actions$: Actions, private cartApiService: CartApiService) {}

  addItem$ = createEffect(() =>
    this.actions$.pipe(
      ofType(addItem),
      switchMap(action =>
        this.cartApiService.saveItem(action.item).pipe(
          map(() => addItemSuccess()), // Despacha éxito
          catchError(error => of(addItemFailure({ error }))) // Despacha fallo
        )
      )
    )
  );
}
*/

// NGRX: Selector (función pura separada)
/*
import { createFeatureSelector, createSelector } from '@ngrx/store';
import { CartState } from './cart.reducer';

export const selectCartState = createFeatureSelector<CartState>('cart');

export const selectCartItems = createSelector(
  selectCartState,
  (state: CartState) => state.items
);
*/

/*
Un error común al comparar es asumir que una es "mejor" que la otra en todo.
La realidad es que ambas son herramientas excelentes con fortalezas y debilidades.
La elección a menudo depende de la preferencia del equipo, el tamaño del proyecto
y si se valora más la concisión y la sintaxis "Angular-like" (NGXS)
o la separación estricta de preocupaciones y la flexibilidad granular (NgRx).

Otro error es intentar migrar de una a otra sin una justificación clara.
La migración puede ser un proceso costoso y, a menos que haya problemas
significativos con la librería actual o beneficios muy claros con la nueva,
a menudo es mejor seguir con la que ya tienes implementada.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Servicios como Fuente de Estado',
    'subtopic': 'Uso de servicios para manejar estado',
    'definition': r'''
Aunque NgRx o NGXS son soluciones potentes para la gestión de estado global, en aplicaciones más pequeñas o para estados locales y compartidos de menor complejidad, usar un servicio de Angular como fuente de estado es una estrategia muy común y efectiva.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en una tienda departamental. Si bien hay un sistema de inventario centralizado (como NgRx), las secciones individuales (como la de electrónica o ropa) pueden tener sus propios asistentes que llevan el control del stock de sus productos específicos en ese momento, informando solo lo necesario al sistema central cuando se requiere. De la misma manera, un servicio en Angular puede actuar como ese "asistente" para un slice de estado que es relevante para un grupo de componentes relacionados, o para un estado que no necesita la complejidad de una librería Redux completa.

Un servicio en Angular es una clase que puedes inyectar en cualquier componente, directiva, pipe o incluso en otros servicios. Esto lo convierte en un candidato ideal para centralizar y compartir el estado. En lugar de que cada componente tenga su propia copia de ciertos datos, o que los datos pasen de padre a hijo y viceversa con Inputs y Outputs, un servicio puede ser el único lugar donde reside y se manipula ese estado.

La clave para usar servicios para manejar estado es combinarlos con las capacidades reactivas de RxJS, especialmente con `BehaviorSubject` o `ReplaySubject`.
* **`BehaviorSubject`**: Es un tipo especial de Observable que siempre tiene un valor actual y emite ese valor a los suscriptores nuevos inmediatamente. Esto lo hace ideal para representar un estado actual (ej., `currentUser`, `cartItems`). Cuando el estado cambia, el `BehaviorSubject` emite el nuevo valor a todos los suscriptores, y ellos se actualizan automáticamente.
* **`ReplaySubject`**: Similar a `BehaviorSubject`, pero puede "reproducir" un número específico de valores emitidos previamente a los suscriptores nuevos. Útil si quieres que los nuevos suscriptores obtengan el historial reciente de cambios.

Al centralizar el estado en un servicio y exponerlo a través de Observables, logras:
* **Consistencia**: Todos los componentes que acceden a ese servicio ven la misma versión del estado.
* **Simplicidad**: Para estados menos complejos, es mucho más sencillo de implementar que NgRx o NGXS.
* **Reactividad**: Los componentes pueden suscribirse a los Observables del servicio y reaccionar automáticamente a los cambios de estado.
* **Menos "prop drilling"**: Evitas pasar datos a través de múltiples niveles de componentes usando Inputs y Outputs, haciendo el código más limpio.

Es una solución pragmática y potente para muchos escenarios de gestión de estado en aplicaciones Angular.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE SERVICIOS PARA MANEJAR ESTADO ---

// 1. Servicio de Estado (src/app/services/cart.service.ts)
// Este servicio maneja el estado del carrito de compras
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Product } from '../models/product.model'; // Suponiendo que tienes un modelo Product

@Injectable({
  providedIn: 'root' // Hace que este servicio sea un singleton en toda la aplicación
})
export class CartService {
  // BehaviorSubject para el estado del carrito. Emite el valor inicial (array vacío).
  private cartItemsSubject = new BehaviorSubject<Product[]>([]);
  // Observable público para que los componentes se suscriban a los cambios del carrito.
  // Usamos `.asObservable()` para prevenir que los componentes llamen a `.next()` directamente.
  cartItems$: Observable<Product[]> = this.cartItemsSubject.asObservable();

  // Observable para el número total de ítems en el carrito
  private totalItemsInCartSubject = new BehaviorSubject<number>(0);
  totalItemsInCart$: Observable<number> = this.totalItemsInCartSubject.asObservable();


  constructor() {}

  addItem(product: Product): void {
    const currentItems = this.cartItemsSubject.getValue(); // Obtener el valor actual
    const updatedItems = [...currentItems, product]; // Crear un nuevo array (inmutabilidad)
    this.cartItemsSubject.next(updatedItems); // Emitir el nuevo estado
    this.updateTotalItems();
  }

  removeItem(productId: number): void {
    const currentItems = this.cartItemsSubject.getValue();
    const updatedItems = currentItems.filter(item => item.id !== productId); // Filtrar, creando un nuevo array
    this.cartItemsSubject.next(updatedItems);
    this.updateTotalItems();
  }

  clearCart(): void {
    this.cartItemsSubject.next([]); // Vaciar el carrito
    this.updateTotalItems();
  }

  private updateTotalItems(): void {
    const currentItems = this.cartItemsSubject.getValue();
    this.totalItemsInCartSubject.next(currentItems.length);
  }
}

// 2. Modelo de Producto (src/app/models/product.model.ts)
export interface Product {
  id: number;
  name: string;
  price: number;
}


// 3. Componente que añade al carrito (src/app/product-card/product-card.component.ts)
import { Component, Input } from '@angular/core';
import { CartService } from '../services/cart.service';
import { Product } from '../models/product.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-product-card',
  template: `
    <div class="product-card">
      <h3>{{ product.name }}</h3>
      <p>{{ product.price | currency:'USD' }}</p>
      <button (click)="addToCart()">Añadir al Carrito</button>
    </div>
  `,
  styles: [`
    .product-card { border: 1px solid #ccc; padding: 15px; margin: 10px; }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class ProductCardComponent {
  @Input() product!: Product; // Recibe un producto como input

  constructor(private cartService: CartService) {} // Inyecta el servicio

  addToCart(): void {
    this.cartService.addItem(this.product); // Llama al método del servicio para añadir el producto
    console.log(`Añadido "${this.product.name}" al carrito.`);
  }
}


// 4. Componente que muestra el carrito (src/app/cart-status/cart-status.component.ts)
import { Component } from '@angular/core';
import { CartService } from '../services/cart.service';
import { Observable } from 'rxjs';
import { Product } from '../models/product.model';
import { CommonModule, CurrencyPipe } from '@angular/common';

@Component({
  selector: 'app-cart-status',
  template: `
    <div class="cart-status">
      <h3>Tu Carrito ({{ totalItems$ | async }} items)</h3>
      <button (click)="toggleCartDetails()">
        {{ showDetails ? 'Ocultar Detalles' : 'Ver Detalles' }}
      </button>
      <button (click)="clearAll()" *ngIf="totalItems$ | async">Vaciar Carrito</button>

      <div *ngIf="showDetails">
        <ul *ngIf="(cartItems$ | async) as items; else noItems">
          <li *ngFor="let item of items">
            {{ item.name }} - {{ item.price | currency:'USD' }}
            <button (click)="removeFromCart(item.id)">X</button>
          </li>
        </ul>
        <ng-template #noItems><p>El carrito está vacío.</p></ng-template>
      </div>
    </div>
  `,
  styles: [`
    .cart-status { border: 1px solid #007bff; padding: 15px; margin: 20px; }
    button { margin: 5px; }
    ul { list-style: none; padding: 0; }
    li { margin-bottom: 5px; display: flex; justify-content: space-between; align-items: center; }
  `],
  standalone: true,
  imports: [CommonModule, CurrencyPipe]
})
export class CartStatusComponent {
  cartItems$: Observable<Product[]>;
  totalItems$: Observable<number>;
  showDetails = false;

  constructor(private cartService: CartService) {
    // Suscribirse a los Observables del servicio para obtener el estado reactivamente
    this.cartItems$ = this.cartService.cartItems$;
    this.totalItems$ = this.cartService.totalItemsInCart$;
  }

  toggleCartDetails(): void {
    this.showDetails = !this.showDetails;
  }

  removeFromCart(productId: number): void {
    this.cartService.removeItem(productId);
  }

  clearAll(): void {
    this.cartService.clearCart();
  }
}

// 5. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { ProductCardComponent } from './product-card/product-card.component';
import { CartStatusComponent } from './cart-status/cart-status.component';
import { Product } from './models/product.model'; // Para el dummy data

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    ProductCardComponent, // Importar standalone components
    CartStatusComponent,  // Importar standalone components
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  // Dummy data para probar en AppComponent.html
  // products: Product[] = [
  //   { id: 1, name: 'Camiseta', price: 25 },
  //   { id: 2, name: 'Pantalón', price: 50 },
  //   { id: 3, name: 'Zapatos', price: 75 },
  // ];
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-cart-status></app-cart-status>
<hr>
<h2>Productos Disponibles</h2>
<div style="display: flex; flex-wrap: wrap;">
  <app-product-card [product]="{ id: 1, name: 'Camiseta', price: 25 }"></app-product-card>
  <app-product-card [product]="{ id: 2, name: 'Pantalón', price: 50 }"></app-product-card>
  <app-product-card [product]="{ id: 3, name: 'Zapatos', price: 75 }"></app-product-card>
</div>
*/

/*
Un error común es mutar directamente el estado de un `BehaviorSubject` sin crear
nuevas referencias para los arrays u objetos. Esto puede llevar a problemas con la
detección de cambios en Angular (especialmente con `OnPush`) y hace que la depuración
sea más difícil. Siempre crea nuevas instancias de arrays u objetos al actualizar el estado.
Ejemplo INCORRECTO:
this.cartItemsSubject.getValue().push(product); // ¡Mutación directa!

Ejemplo CORRECTO (como se hizo arriba):
this.cartItemsSubject.next([...currentItems, product]); // Crea un nuevo array

Otro error es olvidar usar `.asObservable()` al exponer el `BehaviorSubject` públicamente.
Si expones directamente el `BehaviorSubject`, cualquier componente podría llamar a `.next()`
y manipular el estado directamente, rompiendo la centralización del control del estado.
`.asObservable()` asegura que solo el servicio pueda emitir nuevos valores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Servicios como Fuente de Estado',
    'subtopic': 'Comunicación entre componentes a través de servicios',
    'definition': r'''
Una vez que decides usar servicios para manejar el estado, te das cuenta de que son la herramienta perfecta para la "comunicación entre componentes", especialmente aquellos que no tienen una relación directa (padre-hijo, hermano a hermano sin un padre común cercano).

No sé tú, pero a mí esto al principio me costó 🤯. La idea es que Pensemos por un momento en un sistema de radio en una empresa. El "servicio" es la estación de radio central. Un departamento "transmite" un mensaje (una acción o un cambio de estado) y cualquier otro departamento que esté "sintonizado" (suscrito al servicio) lo recibe. No importa dónde esté el departamento o su relación jerárquica con el que envió el mensaje; si está suscrito, recibe la información. Esto es mucho más eficiente que pasar notas de mano en mano entre todos los empleados.

Tradicionalmente, la comunicación entre componentes en Angular se ha manejado de varias maneras:
* **`@Input()` / `@Output()`**: Para comunicación padre-hijo (Input) y hijo-padre (Output). Excelente para relaciones directas, pero se vuelve engorroso para componentes muy separados ("prop drilling" o pasar inputs a través de muchos componentes intermedios).
* **`ViewChild` / `ContentChild`**: Para acceder a un componente hijo o contenido proyectado directamente desde el padre. Útil para interacciones muy específicas, pero no para compartir estado de forma reactiva.

Los servicios con Observables (especialmente `Subject` o `BehaviorSubject`) resuelven el problema de la comunicación entre componentes que no tienen una relación directa. Un componente puede inyectar el servicio y:
* **Emitir un evento o actualizar un estado**: Llamando a `next()` en un `Subject` o `BehaviorSubject` dentro del servicio.
* **Escuchar eventos o cambios de estado**: Suscribiéndose al Observable expuesto por el servicio.

Esta aproximación es increíblemente potente para:
* **Notificaciones globales**: Un servicio de notificación que cualquier componente puede usar para mostrar mensajes de éxito, error, etc.
* **Gestión de la autenticación**: Un servicio `AuthService` que notifica a todos los componentes interesados cuando el usuario inicia o cierra sesión.
* **Carrito de compras**: Como vimos en el ejemplo anterior, un `CartService` permite que un componente de producto añada ítems y un componente de encabezado muestre el total, sin que haya una relación directa entre ellos.
* **Filtros globales**: Un servicio que mantiene el estado de los filtros (ej. un buscador) y notifica a múltiples listas o tablas cuando los filtros cambian.

La comunicación a través de servicios promueve el bajo acoplamiento entre componentes, ya que no necesitan saber detalles internos unos de otros. Solo necesitan saber qué servicio inyectar y qué Observable suscribir o qué método llamar.
''',
    'code_example': r'''
// --- EJEMPLO: COMUNICACIÓN ENTRE COMPONENTES A TRAVÉS DE SERVICIOS ---

// 1. Servicio de Mensajería (src/app/services/message.service.ts)
// Este servicio actúa como un "bus de eventos" simple o un "hub de estado"
import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';

// Definición de tipos de mensaje (opcional, pero buena práctica)
export interface AppMessage {
  type: 'success' | 'error' | 'info';
  text: string;
  duration?: number; // Duración en ms para mensajes temporales
}

@Injectable({
  providedIn: 'root'
})
export class MessageService {
  // Subject para emitir mensajes. Los suscriptores no necesitan el valor inicial.
  private messageSubject = new Subject<AppMessage>();
  // Observable público para que los componentes se suscriban
  message$: Observable<AppMessage> = this.messageSubject.asObservable();

  constructor() { }

  // Métodos para enviar diferentes tipos de mensajes
  showSuccess(text: string, duration: number = 3000): void {
    this.messageSubject.next({ type: 'success', text, duration });
  }

  showError(text: string, duration: number = 5000): void {
    this.messageSubject.next({ type: 'error', text, duration });
  }

  showInfo(text: string, duration: number = 3000): void {
    this.messageSubject.next({ type: 'info', text, duration });
  }
}


// 2. Componente que Muestra Mensajes (src/app/message-display/message-display.component.ts)
// Este componente escucha al servicio y muestra los mensajes
import { Component, OnInit, OnDestroy } from '@angular/core';
import { MessageService, AppMessage } from '../services/message.service';
import { Subscription, timer } from 'rxjs';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-message-display',
  template: `
    <div *ngIf="currentMessage" [ngClass]="['message-box', currentMessage.type]">
      {{ currentMessage.text }}
      <button (click)="clearMessage()">X</button>
    </div>
  `,
  styles: [`
    .message-box {
      padding: 10px;
      margin: 10px;
      border-radius: 5px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: fixed; /* Para que siempre esté visible, ej. en la parte superior */
      top: 20px;
      right: 20px;
      z-index: 1000;
      min-width: 250px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .message-box.success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .message-box.error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .message-box.info { background-color: #d1ecf1; color: #0c5460; border: 1px solid #bee5eb; }
    button { background: none; border: none; font-weight: bold; cursor: pointer; color: inherit; }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class MessageDisplayComponent implements OnInit, OnDestroy {
  currentMessage: AppMessage | null = null;
  private messageSubscription!: Subscription;
  private timerSubscription: Subscription | null = null;

  constructor(private messageService: MessageService) { }

  ngOnInit(): void {
    // Suscribirse al Observable de mensajes del servicio
    this.messageSubscription = this.messageService.message$.subscribe(message => {
      this.currentMessage = message;
      // Si hay una duración, configurar un temporizador para limpiar el mensaje
      if (message.duration) {
        if (this.timerSubscription) {
          this.timerSubscription.unsubscribe(); // Cancelar timer anterior si existe
        }
        this.timerSubscription = timer(message.duration).subscribe(() => {
          this.clearMessage();
        });
      }
    });
  }

  clearMessage(): void {
    this.currentMessage = null;
    if (this.timerSubscription) {
      this.timerSubscription.unsubscribe();
      this.timerSubscription = null;
    }
  }

  ngOnDestroy(): void {
    // Es crucial desuscribirse para evitar fugas de memoria
    if (this.messageSubscription) {
      this.messageSubscription.unsubscribe();
    }
    if (this.timerSubscription) {
      this.timerSubscription.unsubscribe();
    }
  }
}


// 3. Componente que Emite Mensajes (src/app/action-button/action-button.component.ts)
// Este componente no tiene relación directa con MessageDisplayComponent
import { Component } from '@angular/core';
import { MessageService } from '../services/message.service';

@Component({
  selector: 'app-action-button',
  template: `
    <div style="margin: 20px; border: 1px dashed blue; padding: 10px;">
      <h4>Componente de Acción</h4>
      <button (click)="sendSuccess()">Enviar Mensaje de Éxito</button>
      <button (click)="sendError()">Enviar Mensaje de Error</button>
      <button (click)="sendInfo()">Enviar Mensaje de Información</button>
    </div>
  `,
  styles: [`
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
  `],
  standalone: true
})
export class ActionButtonComponent {
  constructor(private messageService: MessageService) { } // Inyecta el servicio

  sendSuccess(): void {
    this.messageService.showSuccess('¡Operación realizada con éxito!');
  }

  sendError(): void {
    this.messageService.showError('¡Algo salió mal! Por favor, inténtalo de nuevo.');
  }

  sendInfo(): void {
    this.messageService.showInfo('Aquí tienes una información importante.');
  }
}

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { MessageDisplayComponent } from './message-display/message-display.component';
import { ActionButtonComponent } from './action-button/action-button.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    MessageDisplayComponent, // Importar standalone components
    ActionButtonComponent,   // Importar standalone components
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-message-display></app-message-display>
<app-action-button></app-action-button>
*/

/*
Un error común es usar `Subject` cuando un `BehaviorSubject` es más apropiado.
Si necesitas que los nuevos suscriptores reciban el *valor actual* del estado inmediatamente
después de suscribirse, usa `BehaviorSubject`. Si solo necesitas notificar a los
suscriptores sobre *nuevos eventos* que ocurran después de la suscripción, usa `Subject`.

Otro error grave es olvidar desuscribirse de los Observables del servicio en `ngOnDestroy()`.
Si un componente se suscribe a un Observable de un servicio y no se desuscribe cuando
el componente es destruido, puede haber una "fuga de memoria". El componente ya no existe,
pero la suscripción sigue activa, lo que puede causar comportamientos inesperados y
consumo excesivo de memoria con el tiempo. El `async` pipe en las plantillas es la
forma más segura de evitar esto para observables que se usan solo en la vista.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Servicios como Fuente de Estado',
    'subtopic': 'Ventajas y limitaciones',
    'definition': r'''
Usar servicios para gestionar el estado en Angular es una estrategia poderosa y flexible, pero como toda herramienta, tiene sus pros y sus contras. Entender las "ventajas y limitaciones" te ayudará a decidir cuándo es la mejor opción para tu proyecto.

Vamos a ver de que se trata todo esto... Pensemos por un momento en una navaja suiza. Es increíblemente útil y versátil para muchas tareas pequeñas y medianas. Puedes abrir latas, atornillar algo, cortar un hilo. Es fácil de usar y siempre la tienes a mano. Pero si necesitas construir una casa, una navaja suiza tiene muchas limitaciones; necesitarás herramientas más grandes y especializadas. Los servicios son la navaja suiza para la gestión de estado; son geniales para muchas cosas, pero no para todas.

**Ventajas de usar servicios para manejar estado:**

* **Simplicidad y Facilidad de Uso**: Es la forma más directa y familiar de gestionar el estado en Angular para quienes ya conocen inyección de dependencias y RxJS. Hay menos conceptos abstractos que aprender en comparación con librerías como NgRx o NGXS.
* **Menos Boilerplate**: Generalmente, requiere menos código repetitivo que las librerías de gestión de estado global. No necesitas definir acciones, reducers, efectos y selectores en archivos separados para cada pequeña pieza de estado.
* **Flexibilidad**: Puedes diseñar el servicio y los Observables exactamente como lo necesites para tu caso de uso específico, sin las estructuras rígidas de un patrón Redux.
* **Ideal para Estado Local o Compartido Moderado**: Funciona muy bien para estados que solo necesitan compartirse entre unos pocos componentes relacionados o para estados que no son tan críticos para la integridad global de la aplicación (ej., un carrito de compras temporal, el estado de un formulario complejo antes de enviarse).
* **Familiaridad con RxJS**: Aprovecha al máximo la reactividad de RxJS, que es una parte fundamental del ecosistema de Angular, lo que puede ser una ventaja si tu equipo ya domina esta librería.
* **Fácil de Testear**: Los servicios son clases simples que pueden ser instanciadas y sus métodos probados con facilidad en pruebas unitarias.

**Limitaciones de usar servicios para manejar estado:**

* **Escalabilidad para Aplicaciones Grandes**: En aplicaciones muy grandes y complejas con mucho estado global y muchas interacciones, los servicios pueden volverse difíciles de manejar. La lógica de estado puede dispersarse en varios servicios, haciendo que sea difícil seguir el flujo de datos.
* **Previsibilidad Limitada**: No ofrecen el flujo de datos unidireccional y la trazabilidad estricta de un Store tipo Redux. Es más difícil saber qué componente o parte del código cambió el estado si no hay un patrón estricto para despachar acciones y mutar el estado.
* **Depuración Compleja**: Sin herramientas como Redux DevTools, depurar problemas de estado ("¿quién cambió este valor?") puede ser un desafío, ya que no hay un historial de acciones o un registro centralizado de transiciones de estado.
* **Coherencia de Patrones**: Si no se establece un patrón claro (ej., siempre usar `BehaviorSubject.next()` y `asObservable()`), cada desarrollador puede manejar el estado de manera diferente, llevando a inconsistencias en el código base.
* **Gestión de Efectos Secundarios**: Si bien puedes manejar llamadas a la API en servicios, la orquestación de efectos secundarios complejos (ej. múltiples llamadas en secuencia, reintentos, cancelaciones) puede volverse más complicada sin la estructura de los Efectos de NgRx.

En resumen, los servicios son una solución de gestión de estado excelente y ligera para muchos escenarios en Angular. Sin embargo, para aplicaciones con un estado global vasto, flujos de datos complejos y una alta necesidad de depuración y trazabilidad, una librería dedicada como NgRx o NGXS ofrecerá una arquitectura más robusta y herramientas más potentes. La clave está en elegir la herramienta adecuada para el trabajo.
''',
    'code_example': r'''
// --- EJEMPLO: VENTAJAS Y LIMITACIONES (Conceptual) ---

// Las ventajas y limitaciones de usar servicios para el estado son más sobre
// las decisiones de arquitectura y el comportamiento a gran escala que sobre
// ejemplos de código específicos. Sin embargo, podemos ilustrar algunos puntos.

// --- Ventaja: Simplicidad y Menos Boilerplate ---
// Servicio simple para un contador global:
/*
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class CounterService {
  private _count = new BehaviorSubject<number>(0);
  public readonly count$ = this._count.asObservable(); // Observable para solo lectura

  increment(): void {
    this._count.next(this._count.getValue() + 1);
  }

  decrement(): void {
    this._count.next(this._count.getValue() - 1);
  }
}
*/
// Esto es mucho más conciso que definir Actions, Reducers, y un Store
// con NgRx/NGXS para una funcionalidad tan simple.

// --- Limitación: Depuración (sin DevTools) ---
// Imagina que tienes varios componentes que pueden modificar el mismo estado del servicio.
// Por ejemplo, un `UserService` con un `currentUserSubject`.
// Si `currentUser` cambia inesperadamente, sin un registro de acciones:

// src/app/services/user.service.ts
/*
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

interface User { id: number; name: string; roles: string[]; }

@Injectable({ providedIn: 'root' })
export class UserService {
  private _currentUser = new BehaviorSubject<User | null>(null);
  public readonly currentUser$ = this._currentUser.asObservable();

  constructor() {
    // Simular carga inicial
    setTimeout(() => this.setUser({ id: 1, name: 'Alice', roles: ['admin'] }), 1000);
  }

  setUser(user: User | null): void {
    console.log('UserService: setUser llamado con:', user);
    this._currentUser.next(user);
  }

  updateUserName(name: string): void {
    const user = this._currentUser.getValue();
    if (user) {
      console.log('UserService: updateUserName llamado con:', name);
      this._currentUser.next({ ...user, name: name }); // Inmutabilidad
    }
  }

  logout(): void {
    console.log('UserService: logout llamado');
    this._currentUser.next(null);
  }
}
*/

// src/app/header/header.component.ts
/*
import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-header',
  template: `
    <header>
      <span>Bienvenido, {{ (currentUser$ | async)?.name || 'Invitado' }}</span>
      <button *ngIf="currentUser$ | async" (click)="logout()">Cerrar Sesión</button>
    </header>
  `,
  standalone: true,
  imports: [CommonModule]
})
export class HeaderComponent {
  currentUser$: Observable<any | null>;
  constructor(private userService: UserService) {
    this.currentUser$ = this.userService.currentUser$;
  }
  logout(): void {
    this.userService.logout();
  }
}
*/

// src/app/admin-panel/admin-panel.component.ts
/*
import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-admin-panel',
  template: `
    <div *ngIf="(userService.currentUser$ | async)?.roles.includes('admin')">
      <h3>Panel de Administración</h3>
      <button (click)="changeNameToBob()">Cambiar nombre a Bob</button>
    </div>
  `,
  standalone: true,
  imports: [CommonModule]
})
export class AdminPanelComponent {
  constructor(public userService: UserService) {} // Public para acceso directo en template
  changeNameToBob(): void {
    this.userService.updateUserName('Bob');
  }
}
*/

/*
Si el nombre del usuario cambia inesperadamente, sin las DevTools de NgRx/NGXS,
tendrías que rastrear manualmente cada lugar donde se llama a `userService.updateUserName()`
o `userService.setUser()` o `userService.logout()` para entender de dónde vino el cambio.
Con Redux DevTools, verías una línea de tiempo clara de cada acción despachada
(`SET_USER`, `UPDATE_USER_NAME`, `LOGOUT`) y el estado resultante, haciendo la depuración
mucho más rápida y fácil. Esta es una limitación clave de los servicios para estados complejos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Uso de Observables para datos asíncronos',
    'definition': r'''
En el mundo del desarrollo web moderno, y especialmente en Angular, la mayoría de los datos con los que trabajas no están disponibles de inmediato. Vienen de APIs, bases de datos o eventos del usuario, y se cargan de forma asíncrona. Aquí es donde los "Observables" y la librería RxJS se convierten en tus mejores amigos para manejar estos datos de manera eficiente y reactiva.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en una suscripción a una revista. No recibes todos los números de golpe; recibes uno cada cierto tiempo. Tú, como suscriptor, esperas cada nuevo número. Cuando llega, lo lees. Si la revista deja de publicarse, te desuscribes. Un Observable es como esa "revista": es una fuente de datos que puede emitir múltiples valores a lo largo del tiempo. Tú, como "suscriptor" (Observer), reaccionas a cada nuevo valor a medida que llega.

* **¿Qué es un Observable?**
    En su esencia, un Observable es una secuencia de datos o eventos que pueden emitirse en el futuro. Es un concepto de la programación reactiva que representa una colección de valores que llegan con el tiempo. Piensa en ellos como colecciones asíncronas de datos. A diferencia de las Promesas (que resuelven un único valor en el futuro), los Observables pueden emitir cero, uno o múltiples valores a lo largo del tiempo, y pueden ser cancelados.

* **¿Por qué Observables en Angular?**
    Angular está construido sobre Observables y RxJS. Casi todo lo que es asíncrono en Angular (llamadas HTTP con `HttpClient`, eventos del enrutador, eventos del formulario, eventos del DOM) expone Observables. Esto permite un flujo de datos consistente y reactivo en toda tu aplicación.

* **RxJS: La caja de herramientas de los Observables**
    RxJS (Reactive Extensions for JavaScript) es la librería que implementa el patrón Observable y proporciona una vasta colección de "operadores" que te permiten componer, transformar, filtrar y combinar Observables. Estos operadores son funciones puras que toman un Observable como entrada y devuelven un nuevo Observable. Son inmutables y no modifican el Observable original. Algunos operadores comunes incluyen:
    * `map`: Transforma cada valor emitido.
    * `filter`: Emite solo los valores que cumplen una condición.
    * `debounceTime`: Espera un tiempo antes de emitir el último valor (útil para búsquedas).
    * `switchMap`, `mergeMap`, `concatMap`, `exhaustMap`: Para manejar Observables dentro de Observables (muy importante para llamadas anidadas o secuenciales).
    * `tap`: Para ejecutar efectos secundarios sin modificar los valores.
    * `catchError`: Para manejar errores.
    * `takeUntil`, `take(1)`: Para gestionar la finalización de suscripciones y evitar fugas de memoria.

* **Suscripción a Observables**
    Para obtener los valores de un Observable, necesitas "suscribirte" a él usando el método `subscribe()`. Cuando te suscribes, proporcionas funciones de *next*, *error* y *complete* para manejar los valores emitidos, los errores y la finalización de la secuencia, respectivamente.

* **El `async` pipe de Angular**
    Angular ofrece el `async` pipe (`| async`) en las plantillas, que es una forma super conveniente de suscribirse a un Observable. El `async` pipe se suscribe automáticamente al Observable cuando el componente se inicializa y se desuscribe automáticamente cuando el componente es destruido, previniendo fugas de memoria.

El dominio de Observables y RxJS es fundamental para construir aplicaciones Angular robustas, reactivas y eficientes.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE OBSERVABLES PARA DATOS ASÍNCRONOS ---

// 1. Servicio que devuelve datos asíncronos (src/app/services/data.service.ts)
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; // Para hacer peticiones HTTP
import { Observable, of } from 'rxjs'; // Importar Observable y 'of'
import { delay, map, catchError } from 'rxjs/operators'; // Importar operadores RxJS

interface Post {
  userId: number;
  id: number;
  title: string;
  body: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private postsUrl = 'https://jsonplaceholder.typicode.com/posts';

  constructor(private http: HttpClient) { }

  // Método que devuelve un Observable de posts
  getPosts(): Observable<Post[]> {
    console.log('DataService: Realizando petición HTTP para obtener posts...');
    return this.http.get<Post[]>(this.postsUrl).pipe(
      delay(1000), // Simular un retardo de red
      catchError(error => {
        console.error('Error al cargar posts:', error);
        // Retornar un Observable vacío o un error para que el componente lo maneje
        return of([]); // Retorna un array vacío en caso de error
        // return throwError(() => new Error('Error al cargar datos')); // Para propagar el error
      })
    );
  }

  // Ejemplo de Observable que emite un valor después de un tiempo
  getDelayedMessage(): Observable<string> {
    return of('¡Datos cargados con éxito desde el servicio!').pipe(
      delay(2000) // Emite el valor después de 2 segundos
    );
  }
}


// 2. Componente que consume datos asíncronos (src/app/posts/posts.component.ts)
import { Component, OnInit, OnDestroy } from '@angular/core';
import { DataService } from '../services/data.service';
import { Observable, Subscription } from 'rxjs'; // Importar Observable y Subscription
import { CommonModule, NgIf, NgFor, AsyncPipe } from '@angular/common'; // Importar AsyncPipe

interface Post {
  userId: number;
  id: number;
  title: string;
  body: string;
}

@Component({
  selector: 'app-posts',
  template: `
    <div class="posts-container">
      <h2>Publicaciones (con Observables)</h2>

      <h3>Ejemplo 1: Usando | async pipe (Recomendado)</h3>
      <div *ngIf="posts$ | async as posts; else loadingPosts">
        <ul *ngIf="posts.length > 0; else noPosts">
          <li *ngFor="let post of posts">
            <h4>{{ post.title }}</h4>
            <p>{{ post.body.substring(0, 100) }}...</p>
          </li>
        </ul>
        <ng-template #noPosts><p>No se encontraron publicaciones.</p></ng-template>
      </div>
      <ng-template #loadingPosts><p>Cargando publicaciones...</p></ng-template>

      <h3>Ejemplo 2: Suscripción manual (Requiere desuscripción)</h3>
      <p>{{ manualMessage }}</p>
      <button (click)="loadManualMessage()">Cargar Mensaje Manual</button>

      <hr>
      <button (click)="loadPosts()">Recargar Publicaciones</button>
    </div>
  `,
  styles: [`
    .posts-container { border: 1px solid #0056b3; padding: 20px; margin: 20px; }
    ul { list-style: none; padding: 0; }
    li { background-color: #f0f8ff; margin-bottom: 10px; padding: 10px; border-radius: 5px; }
    button { margin-top: 10px; padding: 10px 15px; cursor: pointer; }
  `],
  standalone: true,
  imports: [CommonModule, NgIf, NgFor, AsyncPipe] // AsyncPipe es clave para el ejemplo 1
})
export class PostsComponent implements OnInit, OnDestroy {
  posts$: Observable<Post[]>; // Observable que será consumido por el async pipe
  manualMessage: string = 'Haz click para cargar el mensaje.';
  private manualSubscription: Subscription | undefined; // Para la suscripción manual

  constructor(private dataService: DataService) {
    // Asignar el Observable directamente. El async pipe se encargará de suscribirse.
    this.posts$ = this.dataService.getPosts();
  }

  ngOnInit(): void {
    // Si usas el async pipe, no necesitas suscripciones en ngOnInit ni desuscripciones en ngOnDestroy para ese Observable.
    // Para el ejemplo 2, sí es necesario.
  }

  loadPosts(): void {
    this.posts$ = this.dataService.getPosts(); // Vuelve a cargar los posts
  }

  loadManualMessage(): void {
    // Ejemplo de suscripción manual:
    this.manualSubscription = this.dataService.getDelayedMessage().subscribe({
      next: (message) => {
        this.manualMessage = message;
        console.log('Mensaje manual recibido:', message);
      },
      error: (err) => {
        this.manualMessage = 'Error al cargar mensaje: ' + err.message;
        console.error('Error manual:', err);
      },
      complete: () => {
        console.log('Mensaje manual: Observable completado.');
        // No es estrictamente necesario desuscribirse aquí si el observable completa
        // pero es una buena práctica si el observable no completara.
      }
    });
  }

  ngOnDestroy(): void {
    // Desuscribirse de suscripciones manuales para evitar fugas de memoria
    if (this.manualSubscription) {
      this.manualSubscription.unsubscribe();
      console.log('Suscripción manual desuscrita.');
    }
    // No es necesario desuscribirse de `posts$` porque el `async` pipe lo hace automáticamente.
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // ¡Importante para HttpClient!
import { AppComponent } from './app.component';
import { PostsComponent } from './posts/posts.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule, // Añadir HttpClientModule aquí
    PostsComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-posts></app-posts>
*/

/*
Un error común es olvidar desuscribirse de los Observables cuando se suscribe manualmente.
Si te suscribes a un Observable en `ngOnInit` (o en cualquier otro lugar) y no lo
desuscribes en `ngOnDestroy()`, esa suscripción seguirá activa incluso después de que
el componente haya sido destruido, lo que puede llevar a "fugas de memoria" y
comportamientos inesperados. Por eso, el `async` pipe es altamente recomendado.

Otro error es confundir Promesas con Observables. Las Promesas solo emiten un único valor y
no pueden ser canceladas. Los Observables pueden emitir múltiples valores a lo largo del tiempo
y son cancelables, lo que los hace mucho más potentes para flujos de datos complejos y continuos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Manejo de múltiples fuentes de datos',
    'definition': r'''
En una aplicación real, rara vez obtienes toda la información que necesitas de una sola fuente. A menudo, tienes que combinar datos de diferentes APIs, servicios o incluso eventos del usuario para construir la vista o la lógica de negocio completa. Aquí es donde el "manejo de múltiples fuentes de datos" con Observables y los operadores de combinación de RxJS se vuelven indispensables.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en un chef que prepara un plato complejo. No solo saca los ingredientes de una despensa; tal vez el pescado viene de un proveedor, las verduras del mercado y las especias de una tienda especializada. Para que el plato esté listo, necesita que todos esos ingredientes estén disponibles y, a veces, deben combinarse o procesarse en un orden específico. En Angular, cuando construyes una vista, a menudo es como ese plato: necesitas datos de múltiples "proveedores" (fuentes asíncronas) y combinarlos para presentar la "receta" final al usuario.

RxJS ofrece una suite de operadores poderosos para combinar Observables de diferentes maneras:

* **`forkJoin`**: Si necesitas que todos los Observables completen y te den su *último* valor emitido al mismo tiempo. Es como el `Promise.all()` de los Observables. Útil cuando necesitas cargar varios datos independientes antes de mostrar algo.
* **`zip`**: Combina Observables emitiendo un array de valores en orden, esperando que cada Observable emita un valor en su respectiva posición. Es decir, emite cuando todos los Observables han emitido *un* valor en la misma "ronda". Si uno emite más rápido, `zip` espera.
* **`combineLatest`**: Emite un array de los *últimos* valores emitidos por cada Observable tan pronto como *cualquiera* de ellos emite un nuevo valor. Es decir, te da el valor más reciente de cada Observable. Útil cuando tienes múltiples fuentes de datos que cambian independientemente y quieres reaccionar a cualquier cambio.
* **`merge`**: Combina los valores de múltiples Observables en un solo Observable, emitiendo los valores tan pronto como llegan. Si tienes dos Observables que emiten datos en diferentes momentos y solo quieres juntar todos esos datos en un solo flujo, `merge` es tu operador.
* **`switchMap` / `concatMap` / `mergeMap` / `exhaustMap`**: Estos operadores son cruciales para encadenar Observables, especialmente cuando una operación asíncrona depende del resultado de otra.
    * **`switchMap`**: Es el más usado. Cancela la suscripción anterior y cambia a una nueva si el Observable de origen emite un nuevo valor. Ideal para búsquedas con autocompletado, donde solo te interesa el resultado de la *última* búsqueda.
    * **`concatMap`**: Espera a que el Observable interno complete antes de procesar el siguiente. Ideal para operaciones que deben ocurrir en estricta secuencia (ej., guardar datos en orden).
    * **`mergeMap` (o `flatMap`)**: Permite que múltiples Observables internos se ejecuten en paralelo. Ideal para disparar varias llamadas API simultáneamente sin esperar a que una complete para que empiece la otra.
    * **`exhaustMap`**: Ignora los nuevos valores del Observable de origen mientras el Observable interno actual está en progreso. Ideal para evitar clics dobles en botones de envío de formulario.

Dominar estos operadores te permite construir flujos de datos complejos y reactivos, haciendo que tu aplicación sea más eficiente y la lógica de datos más fácil de gestionar.
''',
    'code_example': r'''
// --- EJEMPLO: MANEJO DE MÚLTIPLES FUENTES DE DATOS ---

// 1. Servicio de Datos con múltiples endpoints (src/app/services/multi-data.service.ts)
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, forkJoin, zip, combineLatest, merge, of } from 'rxjs';
import { delay, tap, catchError, map } from 'rxjs/operators';

interface User {
  id: number;
  name: string;
  email: string;
}

interface Todo {
  userId: number;
  id: number;
  title: string;
  completed: boolean;
}

interface Product {
  id: number;
  name: string;
  price: number;
}

@Injectable({
  providedIn: 'root'
})
export class MultiDataService {
  private usersUrl = 'https://jsonplaceholder.typicode.com/users';
  private todosUrl = 'https://jsonplaceholder.typicode.com/todos';
  // Simulación de otra API
  private productsUrl = 'assets/products.json'; // O una API real

  constructor(private http: HttpClient) { }

  getUsers(): Observable<User[]> {
    console.log('Fetching users...');
    return this.http.get<User[]>(this.usersUrl).pipe(delay(500));
  }

  getTodos(): Observable<Todo[]> {
    console.log('Fetching todos...');
    return this.http.get<Todo[]>(this.todosUrl).pipe(delay(800));
  }

  getProducts(): Observable<Product[]> {
    console.log('Fetching products...');
    // Usamos `of` para simular datos locales o un mock
    const dummyProducts: Product[] = [
      { id: 1, name: 'Laptop', price: 1200 },
      { id: 2, name: 'Mouse', price: 25 },
      { id: 3, name: 'Keyboard', price: 75 }
    ];
    return of(dummyProducts).pipe(delay(300));
  }

  // --- Operadores de Combinación ---

  // forkJoin: Cuando necesitas que todos completen y te den el último valor
  getAllInitialData(): Observable<[User[], Todo[], Product[]]> {
    return forkJoin([
      this.getUsers(),
      this.getTodos(),
      this.getProducts()
    ]).pipe(
      tap(() => console.log('forkJoin: Todas las fuentes iniciales cargadas.')),
      catchError(error => {
        console.error('Error con forkJoin:', error);
        return of([[], [], []]); // Retorna arrays vacíos en caso de error
      })
    );
  }

  // combineLatest: Cuando necesitas el último valor de cada Observable que cambia independientemente
  getDynamicData(user$: Observable<User>, search$: Observable<string>): Observable<[User, string]> {
    return combineLatest([user$, search$]).pipe(
      tap(([user, search]) => console.log(`combineLatest: User: ${user.name}, Search: ${search}`)),
      catchError(error => {
        console.error('Error con combineLatest:', error);
        return of([{} as User, '']);
      })
    );
  }

  // zip: Cuando necesitas emparejar valores por índice de emisión
  getPairedUserAndTodo(): Observable<[User, Todo]> {
    return zip(
      this.getUsers().pipe(map(users => users[0])), // Solo el primer usuario
      this.getTodos().pipe(map(todos => todos[0]))  // Solo el primer todo
    ).pipe(
      tap(([user, todo]) => console.log(`zip: Emparejado ${user.name} con ${todo.title}`))
    );
  }

  // merge: Cuando simplemente quieres juntar flujos de eventos
  getCombinedEvents(): Observable<string> {
    const click1$ = of('Botón 1 Clic').pipe(delay(100));
    const click2$ = of('Botón 2 Clic').pipe(delay(300));
    return merge(click1$, click2$).pipe(
      tap(event => console.log(`merge: Evento: ${event}`))
    );
  }
}

// 2. Componente que consume múltiples fuentes (src/app/multi-data/multi-data.component.ts)
import { Component, OnInit } from '@angular/core';
import { MultiDataService } from '../services/multi-data.service';
import { Observable, Subject } from 'rxjs'; // Subject para simular un observable dinámico
import { CommonModule } from '@angular/common'; // Para async pipe y *ngIf, *ngFor
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { startWith } from 'rxjs/operators';

interface User { id: number; name: string; email: string; }
interface Todo { userId: number; id: number; title: string; completed: boolean; }
interface Product { id: number; name: string; price: number; }

@Component({
  selector: 'app-multi-data',
  template: `
    <div class="multi-data-container">
      <h2>Manejo de Múltiples Fuentes de Datos</h2>

      <h3>Datos Iniciales (forkJoin)</h3>
      <div *ngIf="initialData$ | async as data; else loadingInitial">
        <p>Usuarios Cargados: {{ data[0].length }}</p>
        <p>Tareas Cargadas: {{ data[1].length }}</p>
        <p>Productos Cargados: {{ data[2].length }}</p>
        <h4>Primer Usuario: {{ data[0][0]?.name }}</h4>
      </div>
      <ng-template #loadingInitial><p>Cargando datos iniciales...</p></ng-template>

      <h3>Datos Dinámicos (combineLatest)</h3>
      <input type="text" [formControl]="searchControl" placeholder="Buscar usuario...">
      <p>Usuario Dinámico: {{ (dynamicData$ | async)?.[0]?.name }}</p>
      <p>Búsqueda Actual: {{ (dynamicData$ | async)?.[1] }}</p>

      <h3>Usuario y Tarea Emparejados (zip)</h3>
      <div *ngIf="pairedData$ | async as pair">
        <p>Usuario: {{ pair[0].name }}</p>
        <p>Tarea: {{ pair[1].title }}</p>
      </div>
      <button (click)="triggerCombinedEvents()">Ver Eventos Combinados (merge)</button>
    </div>
  `,
  styles: [`
    .multi-data-container { border: 1px solid #1a73e8; padding: 20px; margin: 20px; }
    input { padding: 8px; margin-bottom: 10px; }
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
  `],
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule]
})
export class MultiDataComponent implements OnInit {
  initialData$: Observable<[User[], Todo[], Product[]]> = new Observable();
  dynamicData$: Observable<[User, string]> = new Observable();
  pairedData$: Observable<[User, Todo]> = new Observable();

  // Para simular datos dinámicos con combineLatest
  currentUserSubject = new Subject<User>();
  searchControl = new FormControl('');

  constructor(private multiDataService: MultiDataService) {}

  ngOnInit(): void {
    // Ejemplo de forkJoin
    this.initialData$ = this.multiDataService.getAllInitialData();

    // Ejemplo de combineLatest
    // Simular un cambio de usuario cada 3 segundos
    let userIndex = 0;
    this.multiDataService.getUsers().pipe(
      delay(100), // Asegurarse que se carguen primero
      map(users => users[userIndex++ % users.length])
    ).subscribe(user => this.currentUserSubject.next(user));

    this.dynamicData$ = this.multiDataService.getDynamicData(
      this.currentUserSubject.asObservable(),
      this.searchControl.valueChanges.pipe(startWith('')) // Emite el valor inicial
    );

    // Ejemplo de zip
    this.pairedData$ = this.multiDataService.getPairedUserAndTodo();
  }

  triggerCombinedEvents(): void {
    this.multiDataService.getCombinedEvents().subscribe(event => {
      console.log(`Evento de merge recibido en componente: ${event}`);
      // Aquí podrías actualizar un mensaje en la UI
    });
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { MultiDataComponent } from './multi-data/multi-data.component';
import { ReactiveFormsModule } from '@angular/forms'; // Necesario para FormControl

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    MultiDataComponent, // Importar standalone component
    ReactiveFormsModule, // Importar ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-multi-data></app-multi-data>
*/

/*
Un error común es usar el operador incorrecto para la combinación de Observables.
Por ejemplo, usar `forkJoin` cuando realmente necesitas reaccionar a cambios
continuos de múltiples fuentes (donde `combineLatest` sería mejor).
O usar `mergeMap` cuando solo te interesa el último resultado y los anteriores
deberían cancelarse (`switchMap` es la elección correcta para eso).
Entender las diferencias entre `forkJoin`, `zip`, `combineLatest`, `merge` y los operadores de mapeo
es crucial para evitar comportamientos inesperados y optimizar el rendimiento.

Otro error es olvidar manejar errores en los Observables combinados.
Si uno de los Observables en un `forkJoin` (o `zip`, `combineLatest`) falla y no se
maneja el error con `catchError` en ese Observable específico, todo el Observable combinado
fallará y no emitirá ningún valor, lo que puede dejar tu UI en un estado de carga indefinido.
Siempre considera el manejo de errores en cada Observable individual antes de combinarlos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Estado y Gestión de Datos',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Sincronización y actualización de datos',
    'definition': r'''
Una vez que tienes datos asíncronos y sabes cómo combinarlos, el siguiente desafío es cómo mantenerlos "sincronizados" y actualizados en tu aplicación, especialmente cuando múltiples partes del sistema pueden influir en el mismo conjunto de datos. La "sincronización y actualización de datos" es clave para asegurar que tu interfaz de usuario siempre muestre la información más reciente y precisa, sin importar de dónde provenga o quién la modifique.

Esto tiene una explicación, y es porque Pensemos por un momento en un sistema de información de vuelos en un aeropuerto. Hay una fuente principal que dice cuándo despegan y aterrizan los aviones, pero también hay actualizaciones de la torre de control, de los controladores de equipaje, etc. La pantalla del aeropuerto necesita "sincronizar" todas esas fuentes para mostrar la información más actual a los pasajeros. Si un vuelo se retrasa o cambia de puerta, esa información debe reflejarse instantáneamente en la pantalla para que los pasajeros no se pierdan. En tu aplicación, la sincronización de datos es ese desafío de mantener todo coherente.

En Angular, la sincronización de datos a menudo implica:

* **Fuentes de Verdad Únicas**: Ya sea que uses un servicio con `BehaviorSubject` o un Store de NgRx/NGXS, la idea es tener una única fuente para cada pieza de estado importante. Esto evita que los datos se dupliquen y se vuelvan inconsistentes entre diferentes componentes.
* **Emisión Reactiva de Cambios**: Cuando los datos cambian en la fuente de verdad (ej., una API devuelve nuevos datos, el usuario añade un ítem al carrito), el `BehaviorSubject` o el Store debe emitir un nuevo valor. Todos los componentes suscritos a ese valor se actualizarán automáticamente.
* **Operadores de RxJS para Transformación y Composición**:
    * **`switchMap` (o `concatMap`, `mergeMap`)**: Como vimos, estos son vitales para encadenar llamadas asíncronas. Si la interfaz de usuario desencadena una acción que requiere una actualización de la API y luego una recarga de datos, `switchMap` te permite "cambiar" de una operación a otra de forma limpia.
    * **`shareReplay`**: Este operador es un salvavidas para evitar múltiples peticiones HTTP redundantes. Si varios componentes se suscriben al mismo Observable que hace una llamada HTTP, `shareReplay` permite que la petición se haga una sola vez y luego comparta la respuesta con todos los suscriptores. También puede "reproducir" el último valor emitido a los nuevos suscriptores, lo que es genial para el caching.
    * **`combineLatest`**: Útil para sincronizar estados que cambian independientemente. Si tienes datos de usuario y datos de permisos que provienen de dos fuentes diferentes, `combineLatest` te da el último valor de ambos cada vez que uno de ellos cambia.
    * **`startWith`**: Puedes usarlo para dar un valor inicial a un Observable, lo que es útil para que tu UI tenga algo que mostrar inmediatamente mientras se cargan los datos asíncronos.
* **Actualización Optimista**: Para mejorar la experiencia del usuario, a veces puedes actualizar la UI *antes* de que la operación de la API se confirme. Por ejemplo, si el usuario marca una tarea como completada, puedes actualizar la UI inmediatamente y luego enviar la petición a la API. Si la API falla, puedes revertir la UI. Esto da una sensación de mayor reactividad, pero requiere una buena gestión de errores.
* **Invalidación y Recarga de Caché**: Cuando sabes que los datos en el servidor han cambiado (ej., después de una operación de creación, actualización o eliminación), necesitas una forma de "invalidar" los datos en tu caché local (ya sea en un servicio o en NgRx) y recargarlos para reflejar la última verdad del servidor.

El manejo efectivo de la sincronización y actualización de datos es lo que transforma una aplicación con datos estáticos en una aplicación web dinámica y fluida que responde en tiempo real a los cambios.
''',
    'code_example': r'''
// --- EJEMPLO: SINCRONIZACIÓN Y ACTUALIZACIÓN DE DATOS ---

// 1. Servicio de Datos con Cache y Actualización (src/app/services/data-sync.service.ts)
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, of } from 'rxjs';
import { tap, catchError, shareReplay, switchMap, filter } from 'rxjs/operators';

interface Post {
  userId: number;
  id: number;
  title: string;
  body: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataSyncService {
  private postsUrl = 'https://jsonplaceholder.typicode.com/posts';
  private usersUrl = 'https://jsonplaceholder.typicode.com/users';

  // BehaviorSubject para almacenar el estado de los posts en caché
  private _posts = new BehaviorSubject<Post[]>([]);
  // Observable público para que los componentes se suscriban a los posts
  posts$: Observable<Post[]> = this._posts.asObservable();

  // BehaviorSubject para indicar que se necesita recargar los posts
  private reloadPostsSubject = new BehaviorSubject<void>(undefined);

  constructor(private http: HttpClient) {
    // Escuchar el `reloadPostsSubject` y cuando emita, recargar los posts
    this.reloadPostsSubject.pipe(
      // Evitar que se recargue al inicio si el subject emite un valor inicial (undefined)
      // filter(val => val !== undefined),
      // switchMap para cancelar peticiones anteriores si se activa una nueva recarga
      switchMap(() => this.fetchPostsFromServer()),
      // tap para actualizar el BehaviorSubject local después de la carga
      tap(posts => {
        console.log('DataSyncService: _posts actualizado en caché con:', posts.length, 'posts.');
        this._posts.next(posts);
      }),
      // Manejo de errores para la recarga
      catchError(error => {
        console.error('DataSyncService: Error al recargar posts:', error);
        // Podrías emitir un estado de error o un array vacío si quieres
        return of([]); // Retorna un Observable vacío para que la cadena no se rompa
      })
    ).subscribe(); // Suscribirse para que el flujo se active
  }

  // Método para obtener posts del servidor (privado, solo llamado internamente)
  private fetchPostsFromServer(): Observable<Post[]> {
    console.log('DataSyncService: Llamando a la API para obtener los posts...');
    return this.http.get<Post[]>(this.postsUrl).pipe(
      delay(700), // Simular latencia
      catchError(error => {
        console.error('Error al obtener posts del servidor:', error);
        return of([]); // Retorna un array vacío en caso de error
      })
    );
  }

  // Método público para que los componentes puedan iniciar una recarga
  public reloadPosts(): void {
    console.log('DataSyncService: Solicitando recarga de posts...');
    this.reloadPostsSubject.next();
  }

  // Método para simular la creación de un post que invalida la caché
  createPost(newPost: Partial<Post>): Observable<Post> {
    console.log('DataSyncService: Creando nuevo post en el servidor...');
    return this.http.post<Post>(this.postsUrl, newPost).pipe(
      delay(500),
      tap(response => {
        console.log('DataSyncService: Post creado, invalidando caché y recargando...');
        this.reloadPosts(); // Invalida la caché y dispara la recarga
      }),
      catchError(error => {
        console.error('DataSyncService: Error al crear post:', error);
        return of({} as Post); // Retorna un objeto vacío o error
      })
    );
  }

  // Uso de shareReplay para evitar peticiones redundantes
  // Si varios componentes se suscriben a esto, la petición a usersUrl se hará UNA SOLA VEZ.
  getUsersWithCache(): Observable<any[]> {
    console.log('DataSyncService: Obteniendo usuarios (con shareReplay)...');
    return this.http.get<any[]>(this.usersUrl).pipe(
      delay(400),
      shareReplay({ bufferSize: 1, refCount: true }), // Cacha el último valor y lo comparte
      catchError(error => {
        console.error('Error al obtener usuarios con shareReplay:', error);
        return of([]);
      })
    );
  }
}

// 2. Componente de Vista (src/app/data-viewer/data-viewer.component.ts)
import { Component, OnInit } from '@angular/core';
import { DataSyncService } from '../services/data-sync.service';
import { Observable } from 'rxjs';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Para el input del nuevo post

interface Post { id: number; title: string; body: string; userId: number; }

@Component({
  selector: 'app-data-viewer',
  template: `
    <div class="data-viewer-container">
      <h2>Sincronización y Actualización de Datos</h2>

      <h3>Posts (actualización con recarga)</h3>
      <button (click)="refreshPosts()">Recargar Posts</button>
      <input type="text" [(ngModel)]="newPostTitle" placeholder="Título del nuevo post">
      <button (click)="addPost()">Añadir Post y Recargar</button>

      <div *ngIf="posts$ | async as posts; else loadingPosts">
        <ul *ngIf="posts.length > 0; else noPosts">
          <li *ngFor="let post of posts | slice:0:5"> <h4>{{ post.title }}</h4>
            <p>{{ post.body.substring(0, 50) }}...</p>
          </li>
        </ul>
        <ng-template #noPosts><p>No hay posts disponibles.</p></ng-template>
      </div>
      <ng-template #loadingPosts><p>Cargando posts...</p></ng-template>

      <h3>Usuarios (con shareReplay)</h3>
      <button (click)="getUsers()">Ver Usuarios</button>
      <div *ngIf="users$ | async as users">
        <p>Usuarios Cargados (compartidos): {{ users.length }}</p>
        <ul>
          <li *ngFor="let user of users | slice:0:3">
            {{ user.name }} ({{ user.email }})
          </li>
        </ul>
      </div>
      <ng-template #loadingUsers><p>Cargando usuarios una sola vez...</p></ng-template>
    </div>
  `,
  styles: [`
    .data-viewer-container { border: 1px solid #28a745; padding: 20px; margin: 20px; }
    button { margin: 5px; padding: 10px 15px; cursor: pointer; }
    input { padding: 8px; margin-bottom: 10px; width: 250px; }
  `],
  standalone: true,
  imports: [CommonModule, FormsModule]
})
export class DataViewerComponent implements OnInit {
  posts$: Observable<Post[]>;
  users$: Observable<any[]> | undefined; // Para el ejemplo de shareReplay
  newPostTitle: string = '';

  constructor(private dataSyncService: DataSyncService) {
    this.posts$ = this.dataSyncService.posts$;
  }

  ngOnInit(): void {
    // Cargar los posts inicialmente
    this.dataSyncService.reloadPosts();
  }

  refreshPosts(): void {
    this.dataSyncService.reloadPosts(); // Solicita una recarga
  }

  addPost(): void {
    if (this.newPostTitle.trim()) {
      const postToAdd: Partial<Post> = {
        title: this.newPostTitle.trim(),
        body: `Este es el cuerpo del nuevo post: ${this.newPostTitle}.`,
        userId: 1
      };
      this.dataSyncService.createPost(postToAdd).subscribe({
        next: (response) => {
          console.log('Post añadido con éxito:', response);
          this.newPostTitle = ''; // Limpiar el input
          // La recarga ya se manejó en el tap del servicio
        },
        error: (err) => console.error('Error al añadir post:', err)
      });
    } else {
      console.warn('El título del post no puede estar vacío.');
    }
  }

  getUsers(): void {
    // Si se llama varias veces, la petición HTTP solo se hará una vez gracias a shareReplay
    this.users$ = this.dataSyncService.getUsersWithCache();
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { DataViewerComponent } from './data-viewer/data-viewer.component';
import { FormsModule } from '@angular/forms'; // Para ngModel

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    DataViewerComponent, // Importar standalone component
    FormsModule, // Importar FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-data-viewer></app-data-viewer>
*/

/*
Un error común es no usar `shareReplay` cuando múltiples suscriptores necesitan
los mismos datos de una petición HTTP costosa. Sin `shareReplay`, cada suscripción
disparará una nueva petición HTTP, lo que es ineficiente y puede sobrecargar el servidor.
Asegúrate de aplicarlo a Observables que deben compartir su resultado entre múltiples consumidores.

Otro error es no tener un mecanismo claro para "invalidar la caché" y recargar los datos
después de una operación de escritura (POST, PUT, DELETE). Si no recargas los datos después
de modificarlos en el servidor, tu interfaz de usuario mostrará información desactualizada,
rompiendo la sincronización. El uso de un `Subject` o `BehaviorSubject` para disparar
recargas (como `reloadPostsSubject` en el ejemplo) es una estrategia efectiva.
*/
'''
  });
}

Future<void> insertAngularMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Internacionalización (i18n)',
    'subtopic': 'Uso de ngx-translate',
    'definition': r'''
Cuando creas aplicaciones web, no siempre serán usadas solo en tu país. Si quieres que tu app llegue a más gente, es crucial que se adapte a diferentes idiomas y culturas. Aquí es donde entra la internacionalización (i18n), y en Angular, `ngx-translate` es una librería muy popular que te ayuda a lograrlo de forma sencilla.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una película de Hollywood que se distribuye a nivel mundial. No se limita a proyectarse en inglés; se dobla a múltiples idiomas o se le añaden subtítulos para que la audiencia de cada país la pueda entender y disfrutar. `ngx-translate` es como el equipo de doblaje y subtítulos de tu aplicación Angular. Toma el texto original de tu interfaz de usuario y lo "traduce" al idioma que el usuario prefiera, haciendo que tu aplicación sea accesible y amigable en cualquier parte del mundo.

`ngx-translate` es un módulo de internacionalización para Angular que te permite cargar archivos de traducción y cambiar el idioma de tu aplicación dinámicamente, sin necesidad de recargar la página. Sus características principales son:

* **Traducciones basadas en claves**: En lugar de escribir el texto directamente en tus plantillas y componentes, usas una "clave" (por ejemplo, `HOME.TITLE`, `BUTTON.SAVE`). `ngx-translate` busca el valor de esa clave en el archivo de traducción del idioma actualmente seleccionado.
* **Archivos de traducción**: Las traducciones se almacenan en archivos JSON (o cualquier otro formato que elijas) que mapean las claves a los textos traducidos para cada idioma (ej., `en.json`, `es.json`, `fr.json`).
* **Pipes y directivas**: `ngx-translate` te ofrece un `Pipe` (`| translate`) y una `Directiva` (`[translate]`) para integrar fácilmente las traducciones en tus plantillas HTML, así como un servicio (`TranslateService`) para trabajar con traducciones en tu código TypeScript.
* **Carga asíncrona**: Los archivos de traducción se cargan de forma asíncrona, lo que significa que tu aplicación no tiene que esperar a que todas las traducciones estén disponibles antes de renderizarse.

Usar `ngx-translate` simplifica enormemente el proceso de hacer tu aplicación multilingüe, ya que abstrae la complejidad de la carga y gestión de las traducciones, permitiéndote enfocarte en el contenido y la lógica de tu aplicación.
''',
    'code_example': r'''
// --- EJEMPLO DE NGX-TRANSLATE: CONFIGURACIÓN Y USO BÁSICO ---

// 1. Instalar ngx-translate:
// `npm install @ngx-translate/core @ngx-translate/http-loader`

// 2. Crear los archivos de traducción (src/assets/i18n/)
// src/assets/i18n/en.json
/*
{
  "HOME": {
    "TITLE": "Welcome to our Multi-language App",
    "SUBTITLE": "This is a simple example of internationalization."
  },
  "BUTTON": {
    "SAVE": "Save",
    "CANCEL": "Cancel",
    "HELLO_USER": "Hello, {{name}}!"
  }
}
*/

// src/assets/i18n/es.json
/*
{
  "HOME": {
    "TITLE": "Bienvenido a nuestra App Multilenguaje",
    "SUBTITLE": "Este es un ejemplo simple de internacionalización."
  },
  "BUTTON": {
    "SAVE": "Guardar",
    "CANCEL": "Cancelar",
    "HELLO_USER": "¡Hola, {{name}}!"
  }
}
*/

// 3. Configurar AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient, HttpClientModule } from '@angular/common/http'; // Necesario para cargar los archivos de traducción
import { TranslateLoader, TranslateModule } from '@ngx-translate/core'; // Importar TranslateModule y TranslateLoader
import { TranslateHttpLoader } from '@ngx-translate/http-loader'; // Importar TranslateHttpLoader
import { AppComponent } from './app.component';
import { LangSelectorComponent } from './lang-selector/lang-selector.component'; // Un componente para cambiar el idioma

// Función para crear un loader HTTP
// Esta función le dice a ngx-translate cómo cargar tus archivos JSON de traducción
export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule, // Añadir HttpClientModule
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory, // Usar la función para cargar traducciones desde assets/i18n/
        deps: [HttpClient]
      },
      // defaultLanguage: 'en' // Opcional: idioma por defecto si no se especifica
    }),
    LangSelectorComponent // Si tienes un componente para cambiar el idioma
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 4. Usar en un Componente (src/app/app.component.ts)
import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-root',
  template: `
    <div style="text-align:center; padding: 20px;">
      <h1>{{ 'HOME.TITLE' | translate }}</h1>
      <p>{{ 'HOME.SUBTITLE' | translate }}</p>
      <p>{{ 'BUTTON.HELLO_USER' | translate:{name: 'Angular Developer'} }}</p>

      <button>{{ 'BUTTON.SAVE' | translate }}</button>
      <button>{{ 'BUTTON.CANCEL' | translate }}</button>

      <app-lang-selector></app-lang-selector>
    </div>
  `,
  styles: [`
    h1 { color: #3f51b5; }
    p { font-size: 1.1em; }
    button { margin: 10px; padding: 10px 20px; font-size: 1em; cursor: pointer; }
  `]
})
export class AppComponent implements OnInit {
  constructor(private translate: TranslateService) {
    // Configurar los idiomas disponibles y el idioma por defecto
    translate.addLangs(['en', 'es']);
    translate.setDefaultLang('en'); // Si no se detecta idioma o no se especifica, usa inglés
  }

  ngOnInit(): void {
    // Intentar usar el idioma del navegador si está disponible
    const browserLang = this.translate.getBrowserLang();
    this.translate.use(browserLang?.match(/en|es/) ? browserLang : 'en');
  }
}

// 5. Componente para cambiar el idioma (src/app/lang-selector/lang-selector.component.ts)
import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-lang-selector',
  template: `
    <div style="margin-top: 20px;">
      <button (click)="changeLanguage('en')">English</button>
      <button (click)="changeLanguage('es')">Español</button>
    </div>
  `,
  standalone: true, // Este componente se puede usar como standalone
  imports: [], // No necesita módulos adicionales
})
export class LangSelectorComponent {
  constructor(private translate: TranslateService) {}

  changeLanguage(lang: string): void {
    this.translate.use(lang);
    console.log(`Cambiando idioma a: ${lang}`);
  }
}

/*
Un error común es olvidar importar `HttpClientModule` en el `AppModule` cuando
se usa `TranslateHttpLoader`. Sin este módulo, `ngx-translate` no podrá hacer
las peticiones HTTP para cargar tus archivos de traducción, lo que resultará
en errores de inyección o fallos al cargar las traducciones.

Otro error es no manejar los parámetros en las traducciones correctamente.
Si tienes una clave como "HELLO_USER": "Hello, {{name}}!", y olvidas pasar
el objeto de parámetros en tu pipe o directiva (`| translate:{name: 'Juan'}`),
la traducción se mostrará literalmente con `{{name}}` o simplemente vacía.
Siempre asegúrate de que los parámetros en la clave de traducción se pasen
correctamente al método `translate` o al pipe.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Internacionalización (i18n)',
    'subtopic': 'Archivos de traducción y carga dinámica',
    'definition': r'''
Para que una aplicación sea verdaderamente global, no basta con tener una librería de internacionalización; necesitas gestionar dónde guardas tus traducciones y cómo las cargas. Los "archivos de traducción" y la "carga dinámica" son el corazón de cómo `ngx-translate` sabe qué texto mostrar para cada idioma.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una biblioteca con estantes llenos de libros en diferentes idiomas. Cada libro es como un archivo de traducción, y las palabras dentro son como las claves. Cuando alguien pide un libro en un idioma específico, el bibliotecario (que sería `ngx-translate`) va al estante de ese idioma, busca el libro correcto y se lo entrega. La "carga dinámica" significa que la biblioteca no tiene que tener todos los libros de todos los idiomas abiertos al mismo tiempo; solo abre y trae los que necesita en el momento.

En `ngx-translate`, la forma más común y recomendada de organizar tus traducciones es en archivos JSON. Cada archivo representa un idioma y contiene un mapa de claves a valores. Por ejemplo:

* **`en.json`**: Contiene todas las traducciones en inglés.
* **`es.json`**: Contiene las mismas claves, pero con las traducciones en español.

Estos archivos se suelen almacenar en una carpeta específica, como `src/assets/i18n/`.

La "carga dinámica" se refiere a cómo `ngx-translate` obtiene estos archivos. Lo más común es usar `TranslateHttpLoader`, que es un *loader* proporcionado por `@ngx-translate/http-loader`. Este `loader` utiliza el `HttpClient` de Angular para hacer peticiones HTTP y descargar los archivos JSON de traducción de forma asíncrona cuando se solicitan.

Esto tiene varias ventajas:

* **Optimización del rendimiento**: Solo se cargan los archivos de traducción del idioma que el usuario necesita, lo que reduce el tamaño inicial del paquete de la aplicación.
* **Flexibilidad**: Puedes cargar traducciones desde cualquier fuente, no solo desde archivos estáticos. Podrías tener un backend que te sirva las traducciones, por ejemplo.
* **Mantenimiento simplificado**: Las traducciones se mantienen separadas del código, lo que facilita que los traductores trabajen en ellas sin tocar la lógica de la aplicación.

Además de la carga inicial, `ngx-translate` te permite cambiar el idioma en tiempo de ejecución. Cuando cambias el idioma con `translate.use('es')`, la librería detecta si ya tiene las traducciones para 'es' en caché. Si no, las cargará dinámicamente y luego actualizará todos los elementos de la interfaz de usuario que usen el pipe o la directiva `translate`. Esto garantiza una experiencia de usuario fluida y sin interrupciones al cambiar de idioma.
''',
    'code_example': r'''
// --- EJEMPLO DE ARCHIVOS DE TRADUCCIÓN Y CARGA DINÁMICA ---

// 1. Estructura de archivos de traducción:
// Asegúrate de tener una carpeta `src/assets/i18n`
// src/assets/i18n/
// ├── en.json
// └── es.json

// Contenido de `en.json`:
/*
{
  "HEADER": {
    "NAV_HOME": "Home",
    "NAV_ABOUT": "About Us",
    "NAV_CONTACT": "Contact"
  },
  "FOOTER": {
    "COPYRIGHT": "© 2023 My App. All rights reserved."
  },
  "MESSAGES": {
    "SAVED_SUCCESS": "Your data has been saved successfully!",
    "ERROR_OCCURRED": "An error occurred. Please try again."
  }
}
*/

// Contenido de `es.json`:
/*
{
  "HEADER": {
    "NAV_HOME": "Inicio",
    "NAV_ABOUT": "Acerca de Nosotros",
    "NAV_CONTACT": "Contacto"
  },
  "FOOTER": {
    "COPYRIGHT": "© 2023 Mi App. Todos los derechos reservados."
  },
  "MESSAGES": {
    "SAVED_SUCCESS": "¡Tus datos se han guardado correctamente!",
    "ERROR_OCCURRED": "Ha ocurrido un error. Por favor, inténtalo de nuevo."
  }
}
*/

// 2. Configuración en AppModule (src/app/app.module.ts) - Similar al subtema anterior
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { TranslateLoader, TranslateModule, TranslateService } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { AppComponent } from './app.component';
import { NavComponent } from './nav/nav.component'; // Un componente de navegación
import { FooterComponent } from './footer/footer.component'; // Un componente de pie de página

export function HttpLoaderFactory(http: HttpClient) {
  // Configura la ruta base para los archivos de traducción y su extensión
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
    NavComponent,
    FooterComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(translate: TranslateService) {
    translate.addLangs(['en', 'es']);
    translate.setDefaultLang('en');
    const browserLang = translate.getBrowserLang();
    translate.use(browserLang?.match(/en|es/) ? browserLang : 'en');
  }
}

// 3. Uso en Componentes (src/app/nav/nav.component.ts)
import { Component } from '@angular/core';
import { TranslateModule } from '@ngx-translate/core'; // Importar TranslateModule para el pipe

@Component({
  selector: 'app-nav',
  template: `
    <nav>
      <a routerLink="/home">{{ 'HEADER.NAV_HOME' | translate }}</a>
      <a routerLink="/about">{{ 'HEADER.NAV_ABOUT' | translate }}</a>
      <a routerLink="/contact">{{ 'HEADER.NAV_CONTACT' | translate }}</a>
    </nav>
  `,
  styles: [`
    nav { background-color: #f8f8f8; padding: 10px; text-align: center; }
    a { margin: 0 15px; text-decoration: none; color: #333; font-weight: bold; }
  `],
  standalone: true,
  imports: [TranslateModule] // Importar aquí para usar el pipe en el template standalone
})
export class NavComponent { }

// 4. Uso en otro Componente (src/app/footer/footer.component.ts)
import { Component } from '@angular/core';
import { TranslateModule } from '@ngx-translate/core';

@Component({
  selector: 'app-footer',
  template: `
    <footer>
      <p>{{ 'FOOTER.COPYRIGHT' | translate }}</p>
    </footer>
  `,
  styles: [`
    footer { background-color: #e8e8e8; padding: 15px; text-align: center; margin-top: 50px; }
    p { font-size: 0.9em; color: #555; }
  `],
  standalone: true,
  imports: [TranslateModule]
})
export class FooterComponent { }

// 5. Un componente que simula una acción y muestra un mensaje traducido
// src/app/save-button/save-button.component.ts
import { Component } from '@angular/core';
import { TranslateService, TranslateModule } from '@ngx-translate/core';
import { CommonModule } from '@angular/common'; // Para *ngIf

@Component({
  selector: 'app-save-button',
  template: `
    <div style="text-align: center; margin-top: 30px;">
      <button (click)="saveData()">{{ 'BUTTON.SAVE' | translate }}</button>
      <p *ngIf="message" [ngClass]="messageType">{{ message }}</p>
    </div>
  `,
  styles: [`
    button { padding: 10px 20px; font-size: 1em; cursor: pointer; }
    .success { color: green; font-weight: bold; }
    .error { color: red; font-weight: bold; }
  `],
  standalone: true,
  imports: [TranslateModule, CommonModule]
})
export class SaveButtonComponent {
  message: string = '';
  messageType: 'success' | 'error' = 'success';

  constructor(private translate: TranslateService) {}

  saveData(): void {
    // Simular una operación asíncrona de guardado
    const success = Math.random() > 0.5; // 50% de posibilidades de éxito

    if (success) {
      this.translate.get('MESSAGES.SAVED_SUCCESS').subscribe(translatedText => {
        this.message = translatedText;
        this.messageType = 'success';
      });
    } else {
      this.translate.get('MESSAGES.ERROR_OCCURRED').subscribe(translatedText => {
        this.message = translatedText;
        this.messageType = 'error';
      });
    }
    // Limpiar el mensaje después de un tiempo
    setTimeout(() => this.message = '', 3000);
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-nav></app-nav>
<app-save-button></app-save-button>
<app-footer></app-footer>
*/

/*
Un error común es no mantener la coherencia en las claves de traducción entre los
archivos JSON. Si una clave existe en `en.json` pero no en `es.json`,
`ngx-translate` mostrará la clave literal en lugar de una traducción
(ej., `HOME.TITLE` en lugar de "Bienvenido..."). Es crucial que todos los
archivos de idioma tengan las mismas claves, incluso si el valor está vacío
para algunos idiomas.

Otro error es asumir que `ngx-translate` manejará los errores de carga de archivos
de forma silenciosa. Si un archivo JSON de traducción no se encuentra (ej., un error
en la ruta o en el nombre del archivo), `TranslateHttpLoader` emitirá un error HTTP.
Es una buena práctica añadir un `catchError` en la configuración del `TranslateLoader`
o al menos ser consciente de los errores en la consola del navegador para depurar.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Internacionalización (i18n)',
    'subtopic': 'Soporte para múltiples idiomas',
    'definition': r'''
Crear una aplicación que hable diferentes idiomas es una gran ventaja en el mercado global. Para lograr un "soporte para múltiples idiomas" completo en Angular, especialmente con `ngx-translate`, necesitas considerar no solo las traducciones de texto, sino también cómo tu aplicación detecta y cambia el idioma, y cómo maneja aspectos culturales como fechas, números y monedas.

Seguramente pensarás de qué va todo esto... 

Pensemos por un momento en un mapa mundial. No solo cambia el nombre de los países, sino que las distancias se miden en kilómetros o millas, las temperaturas en Celsius o Fahrenheit, y las fechas se escriben de diferentes maneras según la región. De la misma forma, el soporte para múltiples idiomas no es solo traducir palabras; es adaptar toda la experiencia del usuario a su cultura local. `ngx-translate` te ayuda con el texto, y Angular te da herramientas para el resto de los aspectos culturales.

Aquí los puntos clave para un soporte robusto de múltiples idiomas:

* **Detección del idioma del navegador**: Una práctica común es intentar detectar el idioma preferido del usuario a través de su navegador (`navigator.language` o `navigator.languages`). `ngx-translate` tiene un método (`getBrowserLang()`) que te ayuda con esto. Si tu aplicación soporta ese idioma, lo usas; si no, caes en un idioma por defecto.
* **Cambio de idioma dinámico**: Permite al usuario cambiar el idioma de la aplicación en cualquier momento. Esto se logra llamando al método `translate.use('codigo_idioma')` (ej., `translate.use('es')`). Cuando se cambia el idioma, `ngx-translate` se encarga de recargar las traducciones y actualizar la interfaz de usuario.
* **Idioma por defecto (`setDefaultLang`)**: Siempre es crucial definir un idioma por defecto. Este idioma se usará si no se puede detectar el idioma del navegador, o si el idioma detectado no es compatible con tu aplicación. Esto asegura que la aplicación siempre tenga un idioma base.
* **Fallback de idiomas**: Si una clave de traducción no se encuentra en el idioma actual, `ngx-translate` puede configurarse para buscar esa clave en el idioma por defecto. Esto es útil para evitar errores de traducción incompletos.
* **Internacionalización de datos (i18n Pipes de Angular)**: Más allá del texto estático, las fechas, números y monedas necesitan ser formateados según las convenciones locales. Angular proporciona sus propios pipes de internacionalización (`DatePipe`, `CurrencyPipe`, `DecimalPipe`, `PercentPipe`) que se basan en el API de internacionalización del navegador (`Intl.NumberFormat`, `Intl.DateTimeFormat`). Para que estos pipes funcionen correctamente, necesitas registrar los datos de localización (locale data) para los idiomas que soportes, utilizando `registerLocaleData` de `@angular/common/locales`.
* **Dirección de texto (RTL/LTR)**: Para idiomas como el árabe o el hebreo, la dirección del texto es de derecha a izquierda (RTL). Necesitarás manejar esto en tu CSS y posiblemente en tu código HTML. `ngx-translate` no lo maneja directamente, pero puedes usar directivas o clases CSS condicionales.

Implementar un soporte completo para múltiples idiomas eleva la calidad de tu aplicación, haciéndola accesible y relevante para una audiencia mucho más amplia, sin importar dónde se encuentren.
''',
    'code_example': r'''
// --- EJEMPLO DE SOPORTE PARA MÚLTIPLES IDIOMAS ---

// 1. Configuración de idiomas y detección en AppModule (src/app/app.module.ts)
import { NgModule, LOCALE_ID } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { TranslateLoader, TranslateModule, TranslateService } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { AppComponent } from './app.component';
import { registerLocaleData } from '@angular/common'; // Importar para los pipes de i18n de Angular
import localeEs from '@angular/common/locales/es'; // Importar datos de localización para español
import localeFr from '@angular/common/locales/fr'; // Importar datos de localización para francés (ejemplo)

// Registrar los datos de localización para los idiomas que se van a usar
registerLocaleData(localeEs, 'es');
registerLocaleData(localeFr, 'fr'); // Registrar francés

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
  ],
  providers: [
    // Proveer el LOCALE_ID dinámicamente basado en el idioma de ngx-translate
    // Esto es crucial para que los pipes de Angular como DatePipe, CurrencyPipe funcionen correctamente
    {
      provide: LOCALE_ID,
      deps: [TranslateService],
      useFactory: (translateService: TranslateService) => {
        // Al iniciar, usa el idioma por defecto o el del navegador.
        // Después, cuando el idioma cambie, este valor se actualizará.
        // Se debe usar un Observable para que el LOCALE_ID se actualice dinámicamente si es necesario.
        // Sin embargo, LOCALE_ID se inyecta una sola vez al inicio de la app.
        // Para cambios dinámicos en fechas/números, los pipes lo manejan automáticamente si el locale está registrado.
        return translateService.currentLang || translateService.getDefaultLang();
      }
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(private translate: TranslateService) {
    translate.addLangs(['en', 'es', 'fr']); // Añadir francés como idioma soportado
    translate.setDefaultLang('en');

    // Intentar usar el idioma del navegador
    const browserLang = translate.getBrowserLang();
    // Usar el idioma del navegador si es soportado, de lo contrario, usar el por defecto
    const currentLang = browserLang?.match(/en|es|fr/) ? browserLang : 'en';
    translate.use(currentLang).subscribe(() => {
      // Una vez que el idioma se ha cargado, actualizar LOCALE_ID (aunque el provider de LOCALE_ID se resuelve una vez)
      // Los pipes de Angular como DatePipe se basan en el locale del navegador por defecto o el provisto.
      // Para cambiar dinámicamente LOCALE_ID, se requiere un enfoque más avanzado (ej. recargar la app o usar un interceptor para pipes).
      // Pero los pipes de Angular ya son reactivos a los datos de localización registrados.
      console.log(`Idioma inicial establecido a: ${currentLang}`);
    });
  }
}

// 2. Archivos de traducción adicionales (src/assets/i18n/fr.json)
// src/assets/i18n/fr.json
/*
{
  "HOME": {
    "TITLE": "Bienvenue dans notre application multilingue",
    "SUBTITLE": "Ceci est un simple exemple d'internationalisation."
  },
  "BUTTON": {
    "SAVE": "Sauvegarder",
    "CANCEL": "Annuler",
    "HELLO_USER": "Bonjour, {{name}} !"
  },
  "DATA": {
    "TODAY_IS": "Aujourd'hui, nous sommes le",
    "PRICE": "Prix",
    "BALANCE": "Solde de votre compte"
  }
}
*/

// 3. Componente que utiliza los pipes de i18n de Angular (src/app/data-display/data-display.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule, DatePipe, CurrencyPipe, DecimalPipe } from '@angular/common'; // Importar pipes de i18n
import { TranslateModule, TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-data-display',
  template: `
    <div style="text-align:center; padding: 20px;">
      <h2>{{ 'DATA.TODAY_IS' | translate }} {{ today | date:'fullDate' }}</h2>
      <p>{{ 'DATA.PRICE' | translate }}: {{ productPrice | currency:'EUR':'symbol':'1.2-2' }}</p>
      <p>{{ 'DATA.BALANCE' | translate }}: {{ accountBalance | number:'1.2-2' }}</p>

      <button (click)="changeLanguage('en')">English</button>
      <button (click)="changeLanguage('es')">Español</button>
      <button (click)="changeLanguage('fr')">Français</button>
    </div>
  `,
  styles: [`
    h2 { color: #2196f3; }
    p { font-size: 1.1em; }
    button { margin: 10px; padding: 10px 20px; font-size: 1em; cursor: pointer; }
  `],
  standalone: true,
  // Necesario importar los pipes de i18n para usarlos en el template de un componente standalone
  imports: [CommonModule, TranslateModule, DatePipe, CurrencyPipe, DecimalPipe]
})
export class DataDisplayComponent implements OnInit {
  today: Date = new Date();
  productPrice: number = 1234.56;
  accountBalance: number = 987654.321;

  constructor(private translate: TranslateService) {}

  ngOnInit(): void {
    // Escuchar cambios de idioma para actualizar el LOCALE_ID o simplemente reaccionar si es necesario
    this.translate.onLangChange.subscribe((event: any) => {
      // No necesitamos actualizar `today`, `productPrice`, etc. directamente aquí,
      // porque los pipes de Angular ya reaccionan al LOCALE_ID.
      // Si la aplicación necesitara cambiar el LOCALE_ID en tiempo real,
      // requeriría una configuración más avanzada (como recargar la aplicación).
      // Sin embargo, para la mayoría de los casos, registrar los locales y usar los pipes es suficiente.
      console.log(`Idioma cambiado a: ${event.lang}`);
    });
  }

  changeLanguage(lang: string): void {
    this.translate.use(lang);
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-data-display></app-data-display>
*/

/*
Un error común es no registrar los datos de localización (`registerLocaleData`)
para los idiomas que quieres soportar con los pipes de i18n de Angular.
Si intentas usar `DatePipe` o `CurrencyPipe` para un idioma cuyo locale data no
ha sido registrado, Angular no sabrá cómo formatear las fechas o monedas para
ese idioma y podrías ver errores o un formato incorrecto.
Siempre asegúrate de importar y registrar los datos de locale para cada idioma.

Otro error es confundir `ngx-translate` (para traducción de strings) con los
pipes de i18n de Angular (para formato de fechas, números, etc.).
`ngx-translate` se ocupa del texto estático de tu interfaz, mientras que los pipes
de Angular manejan la representación cultural de datos dinámicos.
Ambos son necesarios para un soporte completo de múltiples idiomas y culturas.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Accesibilidad',
    'subtopic': 'Buenas prácticas de accesibilidad',
    'definition': r'''
Crear aplicaciones web accesibles significa que cualquier persona, independientemente de sus capacidades (visuales, auditivas, motoras o cognitivas), pueda usar e interactuar con ellas sin barreras. Las "buenas prácticas de accesibilidad" no son solo una cuestión de cumplimiento legal o responsabilidad social, sino que mejoran la experiencia de usuario para todos y amplían el alcance de tu aplicación.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un edificio moderno que tiene rampas, ascensores, señalización en braille y puertas anchas. No solo es funcional para personas en silla de ruedas, sino que también beneficia a padres con carritos de bebé, personas con equipaje pesado o incluso a alguien con una lesión temporal. De la misma manera, implementar buenas prácticas de accesibilidad en tu código no solo ayuda a personas con discapacidades, sino que mejora la usabilidad para todos, como usuarios con conexiones lentas, dispositivos móviles, o en situaciones de poca luz.

Implementar la accesibilidad desde el inicio del proyecto es mucho más eficiente que intentar añadirla al final. Aquí te dejo algunas buenas prácticas clave:

* **HTML Semántico**: Usa los elementos HTML adecuados para el propósito de tu contenido. Por ejemplo, utiliza `<button>` para botones, `<nav>` para navegación, `<header>` para encabezados, `<h1>` a `<h6>` para títulos con la jerarquía correcta. Esto ayuda a los lectores de pantalla a entender la estructura y el significado de tu página. Evita usar `<div>` o `<span>` para todo y luego aplicar estilos para hacer que parezcan botones o enlaces; esto rompe la semántica y confunde a las tecnologías asistivas.
* **Contraste de Color Suficiente**: Asegúrate de que haya un contraste adecuado entre el color del texto y el color de fondo. Las pautas WCAG (Web Content Accessibility Guidelines) sugieren un contraste mínimo de 4.5:1 para texto normal y 3:1 para texto grande. Hay muchas herramientas online para verificar esto.
* **Texto Alternativo para Imágenes**: Todas las imágenes que transmitan información deben tener un atributo `alt` descriptivo. Si una imagen es puramente decorativa, el `alt` debe ser vacío (`alt=""`) para que los lectores de pantalla la ignoren.
* **Navegación por Teclado**: Asegúrate de que todos los elementos interactivos (enlaces, botones, campos de formulario) sean accesibles y operables usando solo el teclado. El orden de tabulación (`tabindex`) debe ser lógico y coherente. El foco visual debe ser siempre claro para que el usuario sepa dónde está.
* **Etiquetas de Formulario Claras**: Asocia etiquetas (`<label>`) explícitamente a los campos de formulario utilizando el atributo `for`. Esto permite que los lectores de pantalla anuncien el propósito del campo cuando el usuario se enfoca en él.
* **Mensajes de Error Accesibles**: Los mensajes de error de los formularios deben ser claros, concisos y estar asociados al campo correspondiente. Deben ser detectables por lectores de pantalla cuando aparecen.
* **Contenido Claroy Comprensible**: Usa un lenguaje sencillo y claro. Evita la jerga innecesaria. Proporciona instrucciones claras y evita estructuras de oraciones complejas.
* **Interactividad con el Ratón Y Teclado**: Si un elemento es interactivo con el ratón (ej., un `hover`), asegúrate de que también sea interactivo con el teclado.

Adoptar estas prácticas desde el principio te ahorrará tiempo y esfuerzo a largo plazo, y garantizará que tu aplicación sea utilizable por la mayor cantidad de personas posible.
''',
    'code_example': r'''
// --- EJEMPLO: BUENAS PRÁCTICAS DE ACCESIBILIDAD ---

// 1. HTML Semántico (src/app/semantic-html/semantic-html.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-semantic-html',
  template: `
    <section>
      <h2>Uso de HTML Semántico</h2>
      <nav aria-label="Main Navigation">
        <ul>
          <li><a href="#home">Inicio</a></li>
          <li><a href="#products">Productos</a></li>
          <li><a href="#contact">Contacto</a></li>
        </ul>
      </nav>

      <article>
        <h3>Título del Artículo</h3>
        <p>Este es un párrafo de contenido dentro de un artículo semántico.</p>
        <button type="button">Enviar Formulario</button>
      </article>

      </section>
  `,
  styles: [`
    section { border: 1px solid #ccc; padding: 15px; margin: 20px; }
    nav ul { list-style: none; padding: 0; display: flex; justify-content: center; }
    nav li { margin: 0 10px; }
    button { padding: 10px 20px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 5px; }
    .fake-button { border: 1px solid red; padding: 10px; cursor: pointer; } /* Mal ejemplo: no es accesible por teclado por defecto */
  `],
  standalone: true,
  imports: [CommonModule]
})
export class SemanticHtmlComponent { }

// 2. Texto Alternativo para Imágenes (src/app/image-alt/image-alt.component.ts)
import { Component } from '@angular/core';

@Component({
  selector: 'app-image-alt',
  template: `
    <section>
      <h2>Texto Alternativo para Imágenes</h2>
      <img src="assets/angular-logo.png" alt="Logotipo de Angular, un escudo rojo con un símbolo de fuego estilizado" width="100">
      <p>Este es el logotipo de Angular.</p>

      <img src="assets/decorative-line.png" alt="" aria-hidden="true" width="200">
      <p>Esta es una línea decorativa que los lectores de pantalla ignorarán.</p>

      </section>
  `,
  styles: [`
    section { border: 1px solid #ccc; padding: 15px; margin: 20px; text-align: center; }
    img { margin: 10px; }
  `],
  standalone: true,
})
export class ImageAltComponent { }

// 3. Etiquetas de Formulario Claras (src/app/form-labels/form-labels.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; // Necesario para ngModel

@Component({
  selector: 'app-form-labels',
  template: `
    <section>
      <h2>Etiquetas de Formulario Claras</h2>
      <form>
        <div>
          <label for="username">Nombre de Usuario:</label>
          <input type="text" id="username" name="username" [(ngModel)]="username">
        </div>
        <div>
          </div>
      </form>
    </section>
  `,
  styles: [`
    section { border: 1px solid #ccc; padding: 15px; margin: 20px; }
    div { margin-bottom: 10px; }
    label { display: block; margin-bottom: 5px; font-weight: bold; }
    input { padding: 8px; width: 200px; border: 1px solid #ddd; }
  `],
  standalone: true,
  imports: [CommonModule, FormsModule]
})
export class FormLabelsComponent {
  username: string = '';
}

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { SemanticHtmlComponent } from './semantic-html/semantic-html.component';
import { ImageAltComponent } from './image-alt/image-alt.component';
import { FormLabelsComponent } from './form-labels/form-labels.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    SemanticHtmlComponent, // Importar standalone components
    ImageAltComponent,
    FormLabelsComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-semantic-html></app-semantic-html>
<app-image-alt></app-image-alt>
<app-form-labels></app-form-labels>
*/

/*
Un error común es usar elementos HTML de forma incorrecta o "abusar" de divs y spans.
Por ejemplo, crear un botón con un `div` y un `(click)` listener. Aunque visualmente
parezca un botón, no tendrá el comportamiento por defecto de un botón (como ser accesible
con la tecla Tab y activarse con Enter o Espacio) para los usuarios de teclado o lectores de pantalla.
Siempre usa el elemento HTML semántico correcto para el propósito de tu contenido.

Otro error es olvidar proporcionar texto alternativo para imágenes informativas
o dar un `alt` genérico como "imagen" o "foto". Un `alt` vacío es para imágenes
puramente decorativas. Un `alt` descriptivo es crucial para que los usuarios
ciegos o con baja visión comprendan el contenido de las imágenes.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Accesibilidad',
    'subtopic': 'Uso de roles y atributos ARIA',
    'definition': r'''
A veces, el HTML semántico por sí solo no es suficiente para transmitir el significado completo de los elementos complejos de una interfaz de usuario a las tecnologías asistivas. Aquí es donde entran en juego los "roles y atributos ARIA" (Accessible Rich Internet Applications). ARIA es un conjunto de atributos especiales que puedes añadir a los elementos HTML para proporcionar información adicional sobre su propósito, estado y propiedades a los lectores de pantalla y otras tecnologías asistivas.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en una conversación entre dos personas que no hablan el mismo idioma. Si una de ellas no puede entender una palabra clave, la conversación se rompe. ARIA es como un "traductor simultáneo" que ayuda a las tecnologías asistivas a entender esos elementos de la interfaz de usuario que visualmente son obvios para un usuario vidente, pero que no tienen una representación semántica nativa en HTML (como un acordeón, un carrusel, un dialog modal personalizado, etc.). ARIA llena ese vacío de comunicación.

Es importante recordar la primera regla de ARIA: **"Si puedes usar un elemento HTML nativo con la semántica y el comportamiento de accesibilidad deseados, úsalo en lugar de un elemento ARIA."** Por ejemplo, un `<button>` ya es accesible por defecto; no necesitas `role="button"` en un `<div>`.

Los atributos ARIA se dividen en dos categorías principales:

1.  **Roles (role="...")**: Definen el tipo o propósito de un elemento en la interfaz de usuario.
    * Ejemplos: `role="navigation"`, `role="alert"`, `role="dialog"`, `role="tablist"`, `role="tab"`, `role="slider"`.
    * Cuando un lector de pantalla encuentra un elemento con un rol, anuncia su tipo al usuario. Por ejemplo, `role="button"` indica que el elemento se comporta como un botón.

2.  **Estados y Propiedades (aria-...)**: Proporcionan información dinámica sobre el estado actual de un elemento o sus propiedades.
    * **Estados**: Indican el estado cambiante de un elemento (ej., `aria-expanded="true/false"`, `aria-checked="true/false/mixed"`, `aria-hidden="true/false"`).
    * **Propiedades**: Describen características o relaciones estáticas de un elemento (ej., `aria-label`, `aria-labelledby`, `aria-describedby`, `aria-haspopup`, `aria-live`).

    * **`aria-label`**: Proporciona una etiqueta de texto accesible para elementos que no tienen texto visible (ej., un botón con solo un icono).
    * **`aria-labelledby`**: Se usa para referenciar el `id` de otro elemento que sirve como etiqueta para el elemento actual.
    * **`aria-describedby`**: Se usa para referenciar el `id` de otro elemento que proporciona una descripción adicional para el elemento actual.
    * **`aria-live`**: Indica que una región de la página se actualiza dinámicamente y que los cambios deben ser anunciados por el lector de pantalla. Útil para mensajes de error, notificaciones, resultados de búsqueda. Los valores comunes son `polite` (anuncia los cambios cuando el usuario no está interactuando) o `assertive` (anuncia inmediatamente, interrumpiendo al usuario).

El uso correcto de ARIA es esencial para que tus componentes personalizados complejos (como selectores de fecha, menús desplegables complejos, o modales) sean accesibles. Sin embargo, úsalo con cuidado: un uso incorrecto puede ser peor que no usarlo en absoluto, ya que puede confundir a las tecnologías asistivas.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE ROLES Y ATRIBUTOS ARIA ---

// 1. Componente de Acordeón con ARIA (src/app/accordion/accordion.component.ts)
import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-accordion',
  template: `
    <div class="accordion-item">
      <h3 [attr.id]="headerId">
        <button
          [attr.aria-expanded]="isExpanded"        [attr.aria-controls]="contentId"         (click)="toggle()"
          class="accordion-header"
        >
          {{ title }}
        </button>
      </h3>
      <div
        [attr.id]="contentId"
        [attr.aria-labelledby]="headerId"        [attr.aria-hidden]="!isExpanded"         class="accordion-content"
        [ngClass]="{'expanded': isExpanded}"
      >
        <ng-content></ng-content> </div>
    </div>
  `,
  styles: [`
    .accordion-item { border: 1px solid #ddd; margin-bottom: 10px; }
    .accordion-header {
      width: 100%;
      text-align: left;
      padding: 10px 15px;
      background-color: #f5f5f5;
      border: none;
      cursor: pointer;
      font-size: 1.1em;
      font-weight: bold;
      color: #333;
    }
    .accordion-content {
      padding: 15px;
      border-top: 1px solid #eee;
      display: none; /* Por defecto oculto */
    }
    .accordion-content.expanded {
      display: block; /* Visible cuando expandido */
    }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class AccordionComponent implements OnInit {
  @Input() title: string = 'Accordion Title';
  @Input() id: string = ''; // ID único para el acordeón
  isExpanded: boolean = false;

  headerId: string = '';
  contentId: string = '';

  ngOnInit(): void {
    if (!this.id) {
      // Generar un ID único si no se proporciona, para ARIA
      this.id = 'accordion-' + Math.random().toString(36).substring(2, 9);
    }
    this.headerId = this.id + '-header';
    this.contentId = this.id + '-content';
  }

  toggle(): void {
    this.isExpanded = !this.isExpanded;
  }
}

// 2. Componente de Notificación con aria-live (src/app/live-announcer/live-announcer.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslateModule, TranslateService } from '@ngx-translate/core'; // Para ejemplo de i18n con accesibilidad

@Component({
  selector: 'app-live-announcer',
  template: `
    <div style="text-align: center; margin-top: 30px;">
      <h3>Notificaciones Accesibles</h3>
      <button (click)="showMessage('success')">Mostrar Éxito</button>
      <button (click)="showMessage('error')">Mostrar Error</button>

      <div
        *ngIf="message"
        [attr.role]="messageType === 'error' ? 'alert' : 'status'"
        [attr.aria-live]="messageType === 'error' ? 'assertive' : 'polite'"
        class="message-box"
        [ngClass]="messageType"
      >
        {{ message }}
      </div>
    </div>
  `,
  styles: [`
    .message-box {
      padding: 10px;
      margin-top: 15px;
      border-radius: 5px;
      font-weight: bold;
      max-width: 300px;
      margin-left: auto;
      margin-right: auto;
    }
    .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
  `],
  standalone: true,
  imports: [CommonModule, TranslateModule]
})
export class LiveAnnouncerComponent {
  message: string = '';
  messageType: 'success' | 'error' = 'success';

  constructor(private translate: TranslateService) {}

  showMessage(type: 'success' | 'error'): void {
    this.messageType = type;
    const key = type === 'success' ? 'MESSAGES.SAVED_SUCCESS' : 'MESSAGES.ERROR_OCCURRED';
    this.translate.get(key).subscribe(translatedText => {
      this.message = translatedText;
    });

    // Limpiar el mensaje después de un tiempo
    setTimeout(() => this.message = '', 4000);
  }
}


// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { AccordionComponent } from './accordion/accordion.component';
import { LiveAnnouncerComponent } from './live-announcer/live-announcer.component';
import { HttpClientModule, HttpClient } from '@angular/common/http'; // Para ngx-translate
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';

// Para ngx-translate (igual que en subtemas anteriores)
export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AccordionComponent, // Importar standalone components
    LiveAnnouncerComponent,
    HttpClientModule, // Necesario para TranslateHttpLoader
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(translate: TranslateService) {
    translate.addLangs(['en', 'es']);
    translate.setDefaultLang('en');
    const browserLang = translate.getBrowserLang();
    translate.use(browserLang?.match(/en|es/) ? browserLang : 'en');
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-accordion id="my-accordion-1" title="Sección 1">
  <p>Contenido de la sección 1 del acordeón.</p>
</app-accordion>

<app-accordion id="my-accordion-2" title="Sección 2">
  <ul>
    <li>Ítem 1</li>
    <li>Ítem 2</li>
  </ul>
</app-accordion>

<app-live-announcer></app-live-announcer>
*/

/*
Un error común es usar atributos ARIA de forma redundante o incorrecta.
Por ejemplo, poner `role="button"` en un elemento `<button>`. Esto es redundante
porque el botón ya tiene esa semántica de forma nativa. O peor, usar `role="button"`
en un `div` pero no hacerlo navegable por teclado (`tabindex="0"`) o no añadir
listeners para las teclas Enter y Espacio. Un uso incorrecto de ARIA puede
confundir más a los lectores de pantalla que no usarlo en absoluto.

Otro error es olvidar las asociaciones `aria-labelledby` y `aria-controls`
para componentes complejos como acordeones o pestañas. Estos atributos son
cruciales para que los lectores de pantalla puedan informar al usuario qué
elemento está etiquetando a otro o qué elemento controla a cuál, mejorando la
navegación y comprensión de la interfaz.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Accesibilidad',
    'subtopic': 'Pruebas de accesibilidad',
    'definition': r'''
No basta con implementar buenas prácticas y añadir atributos ARIA; para garantizar que tu aplicación sea realmente accesible, necesitas "pruebas de accesibilidad". Las pruebas son la forma de verificar si lo que has construido es realmente usable por todas las personas, incluyendo aquellas que dependen de tecnologías asistivas.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en construir una rampa para sillas de ruedas. No basta con instalarla; tienes que probarla para asegurarte de que la inclinación es correcta, que el ancho es suficiente y que no hay obstáculos. Si no la pruebas, alguien podría lastimarse o no poder usarla. En el desarrollo web, las pruebas de accesibilidad son esa verificación crucial. Te permiten identificar y corregir barreras antes de que tus usuarios se las encuentren, asegurando que tu aplicación sea verdaderamente inclusiva.

Las pruebas de accesibilidad se pueden realizar de varias maneras, y es una buena práctica combinar diferentes enfoques:

1.  **Pruebas Manuales / Experiencia de Usuario**:
    * **Navegación con teclado**: Intenta usar toda tu aplicación solo con el teclado (Tab, Shift+Tab, Enter, Espacio, flechas). Asegúrate de que todos los elementos interactivos sean alcanzables y operables, y que el foco visual sea siempre claro.
    * **Pruebas con lectores de pantalla**: Utiliza un lector de pantalla (como NVDA o JAWS en Windows, VoiceOver en macOS/iOS, o TalkBack en Android). Es la forma más directa de experimentar tu aplicación como lo haría un usuario ciego. Escucha cómo se anuncia el contenido, si la navegación tiene sentido y si puedes completar tareas comunes.
    * **Pruebas con zoom y alto contraste**: Verifica cómo se ve y funciona tu aplicación con el zoom del navegador (al 200% o 400%) y con temas de alto contraste.
    * **Pruebas con baja visión/daltonismo**: Utiliza extensiones de navegador para simular diferentes tipos de daltonismo o baja visión y verifica la legibilidad y el contraste.

2.  **Herramientas Automatizadas**:
    * **Extensiones de navegador**: Hay muchas extensiones excelentes como [Axe DevTools](https://www.deque.com/axe/devtools/), [Lighthouse](https://developer.chrome.com/docs/lighthouse/) (integrado en Chrome DevTools) o [WAVE](https://wave.webaim.org/). Estas herramientas pueden detectar automáticamente muchos problemas de accesibilidad (especialmente violaciones de WCAG) analizando el DOM. Son rápidas y fáciles de usar, pero solo detectan aproximadamente el 30-50% de los problemas de accesibilidad.
    * **Linters y plugins de IDE**: Algunas herramientas pueden advertirte sobre problemas de accesibilidad directamente en tu código mientras escribes (ej., ESLint con plugins de accesibilidad).
    * **Herramientas de línea de comandos / CI/CD**: Para integrar la accesibilidad en tu flujo de trabajo de integración continua, puedes usar herramientas como Axe-core CLI o Pa11y para ejecutar pruebas automatizadas como parte de tus builds.

3.  **Pruebas de Usabilidad con Personas con Discapacidad**:
    * Si tienes los recursos, la forma más valiosa de probar la accesibilidad es involucrar a usuarios reales con diferentes discapacidades. Su feedback es invaluable para identificar problemas que las herramientas automatizadas o las pruebas manuales por desarrolladores quizás no detecten.

Recuerda que la accesibilidad es un proceso continuo. No es algo que haces una vez y olvidas. Integrar las pruebas de accesibilidad en cada fase del desarrollo es fundamental para construir productos verdaderamente inclusivos.
''',
    'code_example': r'''
// --- EJEMPLO: PRUEBAS DE ACCESIBILIDAD (CONCEPTUAL Y CON HERRAMIENTAS) ---

// Las pruebas de accesibilidad son predominantemente manuales y con herramientas externas,
// más que directamente a través de código de Angular. Sin embargo, podemos ilustrar
// cómo se integrarían conceptualmente y cómo un código Angular podría ser "testeable"
// en términos de accesibilidad.

// 1. Componente con errores de accesibilidad INTENCIONALES para demostrar pruebas
// src/app/bad-accessibility/bad-accessibility.component.ts
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-bad-accessibility',
  template: `
    <div class="container">
      <h2>Ejemplo con Problemas de Accesibilidad</h2>

      <p class="low-contrast">Este texto tiene un contraste bajo con el fondo.</p>

      <div class="not-a-button" (click)="doSomething()">Click aquí (no es un botón real)</div>

      <img src="assets/decorative-bg.png" style="width: 100px; height: 100px; background-color: #000;">

      <input type="text" placeholder="Tu nombre">

      <div class="feedback-message">
        <p *ngIf="showFeedback">¡Formulario enviado con éxito!</p>
      </div>

      <button (click)="toggleFeedback()">Mostrar Feedback</button>
    </div>
  `,
  styles: [`
    .container { border: 1px dashed red; padding: 20px; margin: 20px; }
    .low-contrast { background-color: #f0f0f0; color: #aaaaaa; /* Contraste bajo */ }
    .not-a-button {
      background-color: #ffcc00;
      padding: 10px 15px;
      cursor: pointer;
      border: 1px solid #aa8800;
      margin-top: 10px;
    }
    .feedback-message { border: 1px solid blue; padding: 10px; margin-top: 15px; }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class BadAccessibilityComponent {
  showFeedback: boolean = false;

  doSomething(): void {
    alert('Acción ejecutada');
  }

  toggleFeedback(): void {
    this.showFeedback = !this.showFeedback;
  }
}

// 2. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { BadAccessibilityComponent } from './bad-accessibility/bad-accessibility.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BadAccessibilityComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-bad-accessibility></app-bad-accessibility>
*/

/*
--- CÓMO REALIZAR LAS PRUEBAS DE ACCESIBILIDAD ---

1.  **Pruebas Manuales (usando el componente `BadAccessibilityComponent` como ejemplo):**
    * **Navegación con teclado**:
        * Carga la aplicación.
        * Presiona `Tab` repetidamente. ¿Puedes llegar al "botón" `div.not-a-button`? No, porque los divs no son navegables por teclado por defecto. Un usuario de teclado no podría activarlo.
        * ¿El foco visual es claro cuando navegas por otros elementos?
    * **Lectores de pantalla (ej., NVDA, VoiceOver):**
        * Activa un lector de pantalla en tu sistema operativo.
        * Navega por la página. Escucha cómo se anuncian los elementos.
        * ¿El texto "Este texto tiene un contraste bajo..." se lee con dificultad si simulas problemas de visión?
        * ¿Se anuncia la imagen sin `alt`? (Probablemente no, pero es un problema porque no se transmite su contenido si es informativa).
        * ¿El "botón" `div.not-a-button` se anuncia como un botón? No, solo como texto.
        * Cuando el mensaje "¡Formulario enviado con éxito!" aparece, ¿el lector de pantalla lo anuncia automáticamente? Probablemente no, porque no tiene `aria-live`.
    * **Contraste:**
        * Usa una herramienta como [WebAIM Color Contrast Checker](https://webaim.org/resources/contrastchecker/) o la función de contraste en Chrome DevTools (pestaña `Elements`, selecciona el texto, en la sección `Styles` busca la flecha de contraste al lado del color). Verás que el texto `.low-contrast` no cumple los requisitos WCAG.

2.  **Herramientas Automatizadas (ej., Lighthouse en Chrome DevTools):**
    * Abre Chrome DevTools (F12 o Ctrl+Shift+I).
    * Ve a la pestaña `Lighthouse`.
    * Selecciona la categoría `Accessibility` y haz clic en `Generate report`.
    * Lighthouse analizará tu página y listará los problemas de accesibilidad encontrados, como:
        * "Background and foreground colors do not have a sufficient contrast ratio." (para `.low-contrast`)
        * "Image elements do not have [alt] attributes." (para la `img` sin alt)
        * "Form elements do not have associated labels." (para el `input` sin label)
        * "Buttons do not have an accessible name." (si el `div` se hubiera intentado hacer un botón con un rol ARIA sin nombre)
        * (Nota: Lighthouse no detecta todos los problemas, especialmente los de lógica o flujo de usuario).

3.  **Herramientas de Extensión (ej., Axe DevTools):**
    * Instala la extensión `Axe DevTools` en Chrome/Firefox.
    * Abre DevTools, ve a la pestaña `Axe DevTools`.
    * Haz clic en `Analyze`. Te mostrará una lista más detallada y amigable de problemas.

--- ERRORES COMUNES EN PRUEBAS ---

* **Dependencia excesiva en herramientas automatizadas**: Las herramientas automatizadas son un excelente punto de partida, pero no pueden detectar todos los problemas de accesibilidad. Por ejemplo, no pueden determinar si el texto alternativo de una imagen es *descriptivo* o solo existe, ni si el orden de tabulación es *lógico*. Siempre combínalas con pruebas manuales.
* **No probar con usuarios reales**: La experiencia más valiosa proviene de usuarios con discapacidades reales. Ellos identificarán barreras que un desarrollador (incluso uno con experiencia en accesibilidad) podría pasar por alto.
* **Probar solo una vez al final**: La accesibilidad debe ser un proceso continuo. Integrar pruebas automatizadas en CI/CD y realizar pruebas manuales regularmente (después de cada sprint o antes de cada release) ayuda a identificar y corregir problemas tempranamente, lo que es mucho más económico que arreglarlos al final del ciclo de desarrollo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Localización (l10n)',
    'subtopic': 'Formateo de fechas y números',
    'definition': r'''
Mientras que la internacionalización (i18n) se encarga de preparar tu aplicación para diferentes idiomas, la "localización" (l10n) se centra en adaptar tu aplicación a la cultura específica de una región o *locale*. Un aspecto crucial de la localización es el "formateo de fechas y números", ya que varían enormemente de un país a otro.

No sé tú, pero a mí esto al principio me costó 🤯. La idea es que Pensemos por un momento en las fechas. En Estados Unidos, 06/07/2025 significa 7 de junio de 2025. Pero en muchos países de Europa, 06/07/2025 significaría 6 de julio de 2025. ¡Es un día diferente y un mes diferente! Lo mismo ocurre con los números: en algunos lugares se usa la coma como separador decimal, y en otros el punto. Los formatos de moneda también cambian. Si tu aplicación no adapta estos formatos, puede generar confusión o errores graves para tus usuarios. Angular, junto con el API de internacionalización del navegador, nos ayuda a manejar esto.

Angular no tiene su propio motor de localización para fechas y números, sino que se apoya en la API `Intl` (Internationalization API) de JavaScript, que es parte del navegador. Esto significa que la compatibilidad con los formatos dependerá en gran medida del navegador del usuario.

Angular nos proporciona una serie de "pipes" para formatear estos datos en tus plantillas:

* **`DatePipe`**: Formatea una fecha según el locale especificado. Puedes controlar el formato con cadenas predefinidas ('short', 'medium', 'long', 'full') o patrones personalizados.
    * Ejemplo: `{{ myDate | date:'shortDate':'es' }}` (en formato corto para español).
* **`CurrencyPipe`**: Formatea un número como una cantidad de moneda.
    * Ejemplo: `{{ myAmount | currency:'EUR':'symbol':'1.2-2':'fr' }}` (cantidad en euros, con símbolo, 2 decimales, para francés).
* **`DecimalPipe` (`number` pipe)**: Formatea un número decimal.
    * Ejemplo: `{{ myNumber | number:'1.2-2':'de' }}` (número con 1 entero, 2 decimales, para alemán, que usa coma como separador decimal).
* **`PercentPipe`**: Formatea un número como un porcentaje.
    * Ejemplo: `{{ myPercentage | percent:'1.0-2':'en-US' }}` (porcentaje con 0 enteros, 2 decimales, para inglés de EE. UU.).

Para que estos pipes funcionen correctamente con diferentes locales, debes "registrar" los datos de localización necesarios en tu aplicación. Esto se hace usando la función `registerLocaleData` de `@angular/common/locales` y importando los datos de cada locale que quieras soportar. Luego, puedes especificar el `LOCALE_ID` en tu `AppModule` (o pasarlo directamente al pipe).

Manejar el formateo de fechas y números es crucial para garantizar que tu aplicación sea intuitiva y libre de errores culturales para usuarios de todo el mundo.
''',
    'code_example': r'''
// --- EJEMPLO: FORMATEO DE FECHAS Y NÚMEROS ---

// 1. Registrar datos de localización en AppModule (src/app/app.module.ts)
// Esto es VITAL para que los pipes de i18n de Angular funcionen correctamente
import { NgModule, LOCALE_ID } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { registerLocaleData } from '@angular/common';

// Importa los datos de localización para los idiomas que vayas a usar
import localeEs from '@angular/common/locales/es';
import localeDe from '@angular/common/locales/de'; // Alemán para ejemplo de coma decimal
import localeFr from '@angular/common/locales/fr'; // Francés para ejemplo de moneda

// Registra los datos de localización. El primer argumento es el código del locale.
registerLocaleData(localeEs, 'es');
registerLocaleData(localeDe, 'de');
registerLocaleData(localeFr, 'fr');

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule, // Si usas HttpClient para otras cosas
  ],
  providers: [
    // Proveer el LOCALE_ID de forma global para toda la aplicación.
    // Esto afectará a todos los pipes de i18n que no especifiquen un locale explícitamente.
    // Para cambiarlo dinámicamente en tiempo de ejecución, se requeriría una estrategia más avanzada
    // o pasar el locale directamente a cada pipe.
    { provide: LOCALE_ID, useValue: 'es' } // Establecemos 'es' como idioma por defecto global
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 2. Componente que usa los pipes de formateo (src/app/locale-display/locale-display.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule, DatePipe, CurrencyPipe, DecimalPipe, PercentPipe } from '@angular/common';

@Component({
  selector: 'app-locale-display',
  template: `
    <div class="locale-container">
      <h2>Formateo de Fechas y Números</h2>

      <h3>Fechas:</h3>
      <p>Fecha actual (Global 'es'): {{ today | date:'fullDate' }}</p>
      <p>Fecha actual (en-US): {{ today | date:'short':'en-US' }}</p>
      <p>Fecha actual (de-DE): {{ today | date:'long':'de' }}</p>
      <p>Fecha actual (fr-FR): {{ today | date:'medium':'fr' }}</p>

      <h3>Números:</h3>
      <p>Número (Global 'es'): {{ myNumber | number:'1.2-2' }}</p>
      <p>Número (en-US): {{ myNumber | number:'1.2-2':'en-US' }}</p>
      <p>Número (de-DE, coma decimal): {{ myNumber | number:'1.2-2':'de' }}</p>

      <h3>Moneda:</h3>
      <p>Precio (Global 'es', EUR): {{ productPrice | currency:'EUR':'symbol':'1.2-2' }}</p>
      <p>Precio (en-US, USD): {{ productPrice | currency:'USD':'symbol':'1.2-2':'en-US' }}</p>
      <p>Precio (fr-FR, EUR): {{ productPrice | currency:'EUR':'symbol':'1.2-2':'fr' }}</p>

      <h3>Porcentaje:</h3>
      <p>Progreso (Global 'es'): {{ progress | percent:'1.0-2' }}</p>
      <p>Progreso (en-US): {{ progress | percent:'1.0-2':'en-US' }}</p>

      <hr>
      <p>Puedes cambiar el idioma global en `app.module.ts` en `LOCALE_ID`.</p>
    </div>
  `,
  styles: [`
    .locale-container { border: 1px solid #009688; padding: 20px; margin: 20px; }
    h3 { color: #00796b; }
    p { font-size: 1.1em; }
  `],
  standalone: true,
  // Importar CommonModule y los pipes necesarios para usarlos en templates de componentes standalone
  imports: [CommonModule, DatePipe, CurrencyPipe, DecimalPipe, PercentPipe]
})
export class LocaleDisplayComponent implements OnInit {
  today: Date = new Date();
  myNumber: number = 12345.6789;
  productPrice: number = 99.99;
  progress: number = 0.75;

  constructor() { }

  ngOnInit(): void { }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-locale-display></app-locale-display>
*/

/*
Un error común es olvidar importar y registrar los datos de localización
(`registerLocaleData`) para los idiomas que quieres soportar. Si no haces esto,
los pipes de i18n de Angular no sabrán cómo formatear las fechas o números
para ese locale y podrían mostrar errores o un formato por defecto inesperado.
Asegúrate de que cada locale que uses en tus pipes esté registrado.

Otro error es confundir el `LOCALE_ID` global inyectado con la capacidad
de los pipes para recibir un locale como argumento. El `LOCALE_ID` global
establece el locale predeterminado para toda la aplicación, pero aún puedes
sobrescribirlo para un pipe específico pasándole el locale como último argumento
(`{{ value | pipeName:format:locale_code }}`). Esto es útil si tienes
componentes que necesitan mostrar datos en un locale diferente al global.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Localización (l10n)',
    'subtopic': 'Adaptación de contenido según la región',
    'definition': r'''
La localización no se trata solo de traducir texto o formatear fechas y números; también implica "adaptar el contenido según la región". Esto significa mostrar diferentes imágenes, videos, enlaces o incluso secciones completas de contenido basadas en la ubicación geográfica o las preferencias culturales del usuario. Es una forma de hacer que tu aplicación se sienta verdaderamente "hecha a medida" para cada usuario.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un sitio web de comercio electrónico global. El mismo producto puede tener diferentes precios, ofertas especiales o incluso disponibilidad según el país. Además, las imágenes de marketing, los eslóganes o incluso los colores pueden necesitar adaptarse para resonar con la cultura local. Adaptar el contenido según la región es como tener un "escaparate" diferente para cada país, mostrando lo que es más relevante y atractivo para esa audiencia específica.

La adaptación de contenido va más allá de la traducción y se enfoca en la "cultura" y "relevancia" regional. Aquí algunas estrategias y consideraciones:

* **Contenido Condicional**: Puedes usar directivas de Angular como `*ngIf` o `[hidden]` junto con el idioma o la región detectada para mostrar u ocultar bloques de contenido específicos. Por ejemplo, mostrar un video de YouTube diferente según la región debido a restricciones de licencia, o un banner promocional que solo aplica a un país.
* **Imágenes y Activos Específicos de la Región**: En lugar de cargar la misma imagen para todos, puedes tener carpetas de activos por idioma/región (`assets/images/es/`, `assets/images/en/`) y cargar dinámicamente la URL de la imagen en tu código o plantilla. Esto es crucial para la sensibilidad cultural o el cumplimiento legal (ej., ciertos productos no se pueden mostrar en ciertos países).
* **Enlaces y Redirecciones Geográficas**: Un enlace a la página de "Contacto" podría redirigir a un formulario de contacto diferente o a un número de teléfono local según la región del usuario.
* **Formatos de Dirección y Teléfono**: Los formularios de entrada de direcciones y números de teléfono varían mucho entre países. Necesitarás adaptar las máscaras de entrada, los placeholders y la validación para reflejar los formatos locales.
* **Unidades de Medida**: Mostrar temperaturas en Celsius o Fahrenheit, distancias en kilómetros o millas, o tamaños de ropa en sistemas de medición locales. Esto no se hace con `ngx-translate`, sino con lógica condicional en tu código y posiblemente pipes personalizados si la API `Intl` no lo cubre directamente.
* **Consideraciones Legales y de Privacidad**: Algunas regiones tienen requisitos legales específicos (como GDPR en Europa). El contenido relacionado con la privacidad o los términos de servicio puede necesitar variaciones regionales.

Implementar la adaptación de contenido requiere un diseño cuidadoso de tu arquitectura de datos y de la lógica de tu aplicación para determinar la región del usuario y cargar el contenido adecuado. Es un paso importante para que tu aplicación no solo se "hable" el idioma, sino que también "entienda" la cultura de tus usuarios.
''',
    'code_example': r'''
// --- EJEMPLO: ADAPTACIÓN DE CONTENIDO SEGÚN LA REGIÓN ---

// 1. Servicio para gestionar el idioma/región activo (src/app/services/region.service.ts)
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { TranslateService } from '@ngx-translate/core';

@Injectable({
  providedIn: 'root'
})
export class RegionService {
  // BehaviorSubject para el idioma/región activo
  private _currentLocale = new BehaviorSubject<string>('en-US'); // Valor inicial
  currentLocale$: Observable<string> = this._currentLocale.asObservable();

  constructor(private translateService: TranslateService) {
    // Escuchar cambios de idioma de ngx-translate y actualizar el locale
    this.translateService.onLangChange.subscribe(event => {
      // Mapear el idioma de ngx-translate a un locale más específico si es necesario
      // Por simplicidad, aquí asumimos 'es' -> 'es-ES', 'en' -> 'en-US', etc.
      // En una app real, podrías tener una lógica de mapeo más compleja.
      const newLocale = this.mapLangToLocale(event.lang);
      this._currentLocale.next(newLocale);
      console.log(`RegionService: Locale actualizado a ${newLocale}`);
    });
  }

  setLocale(locale: string): void {
    // Podrías ajustar el idioma de ngx-translate aquí también si es diferente
    const lang = locale.split('-')[0]; // Extraer el idioma principal
    this.translateService.use(lang); // Notificar a ngx-translate para cargar traducciones
    this._currentLocale.next(locale); // Actualizar nuestro locale específico de región
  }

  private mapLangToLocale(lang: string): string {
    switch (lang) {
      case 'es': return 'es-ES'; // Español de España
      case 'fr': return 'fr-FR'; // Francés de Francia
      case 'de': return 'de-DE'; // Alemán de Alemania
      case 'en':
      default: return 'en-US'; // Inglés de Estados Unidos
    }
  }
}

// 2. Componente que adapta el contenido (src/app/region-content/region-content.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegionService } from '../services/region.service';
import { Observable } from 'rxjs';
import { TranslateModule } from '@ngx-translate/core';

@Component({
  selector: 'app-region-content',
  template: `
    <div class="region-content-container">
      <h2>Contenido Adaptado por Región</h2>

      <div class="controls">
        <button (click)="changeRegion('en-US')">🇺🇸 English (US)</button>
        <button (click)="changeRegion('es-ES')">🇪🇸 Español (ES)</button>
        <button (click)="changeRegion('fr-FR')">🇫🇷 Français (FR)</button>
        <button (click)="changeRegion('de-DE')">🇩🇪 Deutsch (DE)</button>
      </div>

      <ng-container *ngIf="currentLocale$ | async as locale">
        <p>Región activa: <strong>{{ locale }}</strong></p>

        <h3>Mensaje de Bienvenida Regional:</h3>
        <p [ngSwitch]="locale">
          <span *ngSwitchCase="'en-US'">Welcome to our US site! Discover our latest deals.</span>
          <span *ngSwitchCase="'es-ES'">¡Bienvenido a nuestro sitio español! Descubre nuestras últimas ofertas.</span>
          <span *ngSwitchCase="'fr-FR'">Bienvenue sur notre site français ! Découvrez nos dernières offres.</span>
          <span *ngSwitchCase="'de-DE'">Willkommen auf unserer deutschen Webseite! Entdecken Sie unsere neuesten Angebote.</span>
          <span *ngSwitchDefault>Welcome!</span>
        </p>

        <h3>Imagen Regional:</h3>
        <img [src]="getImageUrl(locale)" alt="Imagen de bienvenida regional" class="regional-image">

        <h3>Unidades de Medida:</h3>
        <p [ngSwitch]="locale">
          <span *ngSwitchCase="'en-US'">Temperatura: {{ temperatureFahrenheit }}°F ({{ temperatureCelsius }}°C)</span>
          <span *ngSwitchDefault>Temperatura: {{ temperatureCelsius }}°C ({{ temperatureFahrenheit }}°F)</span>
        </p>

        <h3>Enlace de Contacto Regional:</h3>
        <a [href]="getContactLink(locale)">{{ 'COMMON.CONTACT_US' | translate }}</a>
      </ng-container>
    </div>
  `,
  styles: [`
    .region-content-container { border: 1px solid #d32f2f; padding: 20px; margin: 20px; }
    .controls button { margin: 5px; padding: 10px 15px; cursor: pointer; }
    .regional-image { max-width: 300px; height: auto; margin-top: 15px; border-radius: 8px; }
    h3 { color: #c62828; margin-top: 20px; }
    a { display: block; margin-top: 15px; color: #1976d2; text-decoration: none; font-weight: bold; }
    a:hover { text-decoration: underline; }
  `],
  standalone: true,
  imports: [CommonModule, TranslateModule]
})
export class RegionContentComponent implements OnInit {
  currentLocale$: Observable<string>;
  temperatureCelsius: number = 25;
  temperatureFahrenheit: number = (this.temperatureCelsius * 9/5) + 32;

  constructor(private regionService: RegionService) {
    this.currentLocale$ = this.regionService.currentLocale$;
  }

  ngOnInit(): void {
    // Puedes cargar un locale por defecto o el del navegador al inicio
    // this.regionService.setLocale('en-US'); // O basado en la detección del navegador
  }

  changeRegion(locale: string): void {
    this.regionService.setLocale(locale);
  }

  getImageUrl(locale: string): string {
    // Simular diferentes imágenes por región
    switch (locale) {
      case 'es-ES': return 'https://via.placeholder.com/300x200/FFC107/FFFFFF?text=Bienvenido+ES';
      case 'fr-FR': return 'https://via.placeholder.com/300x200/4CAF50/FFFFFF?text=Bienvenue+FR';
      case 'de-DE': return 'https://via.placeholder.com/300x200/2196F3/FFFFFF?text=Willkommen+DE';
      case 'en-US':
      default: return 'https://via.placeholder.com/300x200/9C27B0/FFFFFF?text=Welcome+US';
    }
  }

  getContactLink(locale: string): string {
    // Simular diferentes enlaces de contacto
    switch (locale) {
      case 'es-ES': return '/contact/spain';
      case 'fr-FR': return '/contact/france';
      case 'de-DE': return '/contact/germany';
      case 'en-US':
      default: return '/contact/usa';
    }
  }
}

// 3. Extender archivos de traducción si es necesario para texto que se usa con ngx-translate
// src/assets/i18n/en.json (Añadir)
/*
{
  "COMMON": {
    "CONTACT_US": "Contact Us"
  },
  // ... resto de tus traducciones
}
*/
// src/assets/i18n/es.json (Añadir)
/*
{
  "COMMON": {
    "CONTACT_US": "Contáctanos"
  },
  // ... resto de tus traducciones
}
*/

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { AppComponent } from './app.component';
import { RegionContentComponent } from './region-content/region-content.component';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    RegionContentComponent, // Importar standalone component
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  // Configuración de ngx-translate (igual que en subtemas anteriores)
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-region-content></app-region-content>
*/

/*
Un error común es asumir que las traducciones de `ngx-translate` son suficientes
para toda la localización. `ngx-translate` es para texto, pero para adaptar imágenes,
videos, enlaces, lógica de unidades o formatos de dirección, necesitarás lógica
condicional en tus componentes y servicios, que responda al locale o región actual.
No todo es un string traducible.

Otro error es manejar la detección de región de forma simplista o incorrecta.
Simplemente usar el idioma del navegador (`navigator.language`) no siempre es
suficiente, ya que "en" podría ser "en-US", "en-GB", "en-CA", cada uno con sus
propias sutilezas culturales. Considera también la dirección IP del usuario si
la precisión de la región es crítica para tu contenido.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Localización (l10n)',
    'subtopic': 'Soporte para diferentes formatos de entrada',
    'definition': r'''
Cuando construyes formularios para usuarios de todo el mundo, un aspecto que a menudo se pasa por alto pero que es crítico para la experiencia de usuario es el "soporte para diferentes formatos de entrada". Esto va más allá de traducir las etiquetas de los campos; se trata de aceptar y validar datos como números de teléfono, direcciones, códigos postales o fechas de nacimiento en el formato que los usuarios esperan en su propia región.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un formulario de registro global. Si pides un número de teléfono y solo esperas un formato específico (ej., `(XXX) XXX-XXXX` como en EE. UU.), pero un usuario en Europa intenta ingresar `+XX X XX XX XX XX`, tu formulario podría rechazarlo o interpretarlo mal. O si un campo de fecha espera `MM/DD/YYYY` y un usuario español ingresa `DD/MM/YYYY`, se producirá un error o una fecha incorrecta. Adaptar los formatos de entrada es como darle a cada usuario un formulario que "habla" su propio lenguaje de datos.

El soporte para diferentes formatos de entrada implica varias consideraciones:

* **Máscaras de Entrada (Input Masks)**: Para campos como números de teléfono o códigos postales, puedes usar librerías de máscaras de entrada (ej., `ng-brazil-masks` para Brasil o librerías genéricas como `ngx-mask`). Estas guían al usuario para que ingrese el formato esperado, pero debes permitir flexibilidad según la región.
* **Validación Localizada**: Las reglas de validación deben adaptarse al formato esperado.
    * **Números de Teléfono**: Los patrones de expresiones regulares para validar números de teléfono son muy diferentes entre países.
    * **Códigos Postales**: La longitud y el formato de los códigos postales varían enormemente.
    * **Fechas**: Si no usas un selector de fecha, la validación manual de cadenas de fecha debe considerar `DD/MM/YYYY`, `MM/DD/YYYY`, `YYYY-MM-DD`, etc.
* **Campos de Dirección**: Los componentes de dirección suelen requerir múltiples campos (calle, número, código postal, ciudad, estado/provincia, país) y el orden y la obligatoriedad de estos campos varían según la región. Podrías necesitar componentes de formulario dinámicos o condicionales.
* **Componentes de Terceros para Internacionalización**: A menudo, es más práctico usar librerías de componentes UI que ya vienen con soporte integrado para localización de formularios, como Angular Material con su soporte de `DateAdapter` y `MAT_DATE_LOCALE`.
* **Auto-detección y Sugerencia**: Una buena práctica es intentar autodetectar el país o región del usuario (por IP, idioma del navegador, o geolocalización) y sugerir los formatos de entrada predeterminados, pero permitiendo al usuario cambiarlo si es necesario.
* **Parseo y Normalización**: Una vez que has aceptado un formato de entrada localizado, a menudo necesitarás "parsearlo" a un formato estándar (ej., ISO 8601 para fechas) para almacenarlo en tu backend o para realizar operaciones internas.

Implementar el soporte para diferentes formatos de entrada mejora drásticamente la usabilidad de tus formularios, reduce los errores del usuario y facilita el proceso de recopilación de datos de una audiencia global.
''',
    'code_example': r'''
// --- EJEMPLO: SOPORTE PARA DIFERENTES FORMATOS DE ENTRADA ---

// Este ejemplo se enfoca en la lógica y cómo se aplicarían conceptos.
// Para implementaciones completas de máscaras o validaciones complejas,
// a menudo se recurriría a librerías de terceros o APIs de geolocalización.

// 1. Servicio para detectar y gestionar el locale (src/app/services/form-locale.service.ts)
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// Podrías tener una lista de locales soportados con sus formatos de ejemplo
interface LocaleConfig {
  code: string;
  country: string;
  phoneFormat: string; // Ej. "(XXX) XXX-XXXX" o "+XX X XX XX XX XX"
  dateFormat: string;  // Ej. "MM/DD/YYYY" o "DD/MM/YYYY"
  zipCodeFormat: string; // Ej. "XXXXX" o "XX-XXX"
}

@Injectable({
  providedIn: 'root'
})
export class FormLocaleService {
  private locales: LocaleConfig[] = [
    { code: 'en-US', country: 'United States', phoneFormat: '(###) ###-####', dateFormat: 'MM/DD/YYYY', zipCodeFormat: '#####', },
    { code: 'es-ES', country: 'España', phoneFormat: '+34 ### ## ## ##', dateFormat: 'DD/MM/YYYY', zipCodeFormat: '#####', },
    { code: 'fr-FR', country: 'France', phoneFormat: '+33 # ## ## ## ##', dateFormat: 'DD/MM/YYYY', zipCodeFormat: '#####', },
    { code: 'de-DE', country: 'Deutschland', phoneFormat: '+49 ### ### ####', dateFormat: 'DD.MM.YYYY', zipCodeFormat: '#####', },
    { code: 'pt-BR', country: 'Brasil', phoneFormat: '(##) #####-####', dateFormat: 'DD/MM/YYYY', zipCodeFormat: '#####-###', },
  ];

  private _currentLocaleConfig = new BehaviorSubject<LocaleConfig>(this.locales[0]); // Default a US
  currentLocaleConfig$: Observable<LocaleConfig> = this._currentLocaleConfig.asObservable();

  constructor() {
    // Podrías intentar detectar el locale del navegador o la IP aquí
    const browserLang = navigator.language;
    const defaultLocale = this.locales.find(l => l.code.startsWith(browserLang)) || this.locales[0];
    this._currentLocaleConfig.next(defaultLocale);
    console.log(`FormLocaleService: Locale inicial: ${defaultLocale.country}`);
  }

  setLocale(localeCode: string): void {
    const selectedLocale = this.locales.find(l => l.code === localeCode);
    if (selectedLocale) {
      this._currentLocaleConfig.next(selectedLocale);
      console.log(`FormLocaleService: Locale cambiado a: ${selectedLocale.country}`);
    } else {
      console.warn(`Locale ${localeCode} no soportado.`);
    }
  }

  getLocales(): LocaleConfig[] {
    return this.locales;
  }
}

// 2. Componente de Formulario Localizado (src/app/localized-form/localized-form.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormLocaleService } from '../services/form-locale.service';
import { Observable } from 'rxjs';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

// Para una máscara de entrada real, usarías una librería como ngx-mask:
// npm install ngx-mask --save
// Import NgxMaskModule.forRoot() in your AppModule
// <input [mask]="(currentLocaleConfig$ | async)?.phoneFormat" ...>

@Component({
  selector: 'app-localized-form',
  template: `
    <div class="localized-form-container">
      <h2>Formulario con Soporte de Entrada Localizado</h2>

      <div class="controls">
        <label for="locale-select">Seleccionar Región:</label>
        <select id="locale-select" (change)="onLocaleChange($event)">
          <option *ngFor="let locale of locales$ | async" [value]="locale.code">
            {{ locale.country }} ({{ locale.code }})
          </option>
        </select>
      </div>

      <ng-container *ngIf="currentLocaleConfig$ | async as localeConfig">
        <p>Formato de teléfono esperado: `{{ localeConfig.phoneFormat }}`</p>
        <p>Formato de fecha esperado: `{{ localeConfig.dateFormat }}`</p>

        <form [formGroup]="userForm" (ngSubmit)="onSubmit()">
          <div>
            <label for="phone">Número de Teléfono:</label>
            <input type="text" id="phone" formControlName="phone" [placeholder]="localeConfig.phoneFormat"
                   [class.is-invalid]="userForm.controls['phone'].invalid && userForm.controls['phone'].touched">
            <div *ngIf="userForm.controls['phone'].invalid && userForm.controls['phone'].touched" class="error-message">
              Por favor, ingrese un número de teléfono válido para {{ localeConfig.country }}.
            </div>
          </div>

          <div>
            <label for="birthDate">Fecha de Nacimiento:</label>
            <input type="text" id="birthDate" formControlName="birthDate" [placeholder]="localeConfig.dateFormat"
                   [class.is-invalid]="userForm.controls['birthDate'].invalid && userForm.controls['birthDate'].touched">
            <div *ngIf="userForm.controls['birthDate'].invalid && userForm.controls['birthDate'].touched" class="error-message">
              Por favor, ingrese la fecha en formato {{ localeConfig.dateFormat }}.
            </div>
          </div>

          <button type="submit" [disabled]="userForm.invalid">Enviar Datos</button>
        </form>
      </ng-container>
    </div>
  `,
  styles: [`
    .localized-form-container { border: 1px solid #1a237e; padding: 20px; margin: 20px; }
    .controls { margin-bottom: 20px; }
    label { display: block; margin-bottom: 5px; font-weight: bold; }
    input[type="text"] { padding: 8px; width: 250px; border: 1px solid #ddd; margin-bottom: 5px; }
    .is-invalid { border-color: red; }
    .error-message { color: red; font-size: 0.85em; margin-bottom: 10px; }
    button { padding: 10px 20px; background-color: #3f51b5; color: white; border: none; border-radius: 5px; cursor: pointer; }
    button:disabled { background-color: #ccc; cursor: not-allowed; }
  `],
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule] // Necesario para formularios reactivos
})
export class LocalizedFormComponent implements OnInit {
  currentLocaleConfig$: Observable<LocaleConfig>;
  locales$: Observable<LocaleConfig[]>;
  userForm: FormGroup;

  constructor(private formLocaleService: FormLocaleService) {
    this.currentLocaleConfig$ = this.formLocaleService.currentLocaleConfig$;
    this.locales$ = this.formLocaleService.getLocales();

    this.userForm = new FormGroup({
      phone: new FormControl('', Validators.required),
      birthDate: new FormControl('', Validators.required)
    });
  }

  ngOnInit(): void {
    // Almacenar la referencia al servicio para usarlo en el validador dinámico
    const service = this.formLocaleService;

    // Crear un validador personalizado que dependa del locale actual
    this.userForm.get('phone')?.setValidators(
      (control) => {
        const value = control.value;
        const currentFormat = service.currentLocaleConfig$.getValue().phoneFormat;
        // Aquí iría la lógica de validación real (regex, librería de phone numbers)
        // Por simplicidad, solo chequeamos si no está vacío.
        const isValid = value && value.length > 5; // Placeholder simple
        return isValid ? null : { invalidPhoneFormat: true };
      }
    );

    this.userForm.get('birthDate')?.setValidators(
      (control) => {
        const value = control.value;
        const currentFormat = service.currentLocaleConfig$.getValue().dateFormat;
        // Aquí iría la lógica de validación de fecha real
        // Ej. verificar si 'DD/MM/YYYY' es válido para 'es-ES'
        const isValid = value && value.length === currentFormat.length; // Placeholder simple
        return isValid ? null : { invalidDateFormat: true };
      }
    );

    // Actualizar validadores cuando el locale cambie
    this.currentLocaleConfig$.subscribe(() => {
      this.userForm.get('phone')?.updateValueAndValidity();
      this.userForm.get('birthDate')?.updateValueAndValidity();
    });
  }

  onLocaleChange(event: Event): void {
    const selectElement = event.target as HTMLSelectElement;
    this.formLocaleService.setLocale(selectElement.value);
  }

  onSubmit(): void {
    if (this.userForm.valid) {
      console.log('Formulario enviado:', this.userForm.value);
      alert('Datos enviados: ' + JSON.stringify(this.userForm.value));
      // Aquí se enviaría a un backend, que debería ser capaz de parsear los formatos locales.
    } else {
      console.warn('Formulario inválido');
      this.userForm.markAllAsTouched(); // Marcar todos los campos como tocados para mostrar errores
    }
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { LocalizedFormComponent } from './localized-form/localized-form.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    LocalizedFormComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-localized-form></app-localized-form>
*/

/*
Un error común es implementar validaciones de formato de entrada rígidas que
no se adaptan a la región del usuario. Por ejemplo, una expresión regular de
teléfono que solo acepta el formato de EE. UU. (XXX) XXX-XXXX. Esto hará que
usuarios de otros países no puedan completar el formulario. Siempre debes
diseñar tus validaciones para que sean flexibles y se adapten al locale.

Otro error es olvidar "normalizar" los datos de entrada después de la validación.
Si un usuario ingresa una fecha como "07/06/2025" (DD/MM/YYYY para ES) y tu
backend espera "2025-06-07" (ISO 8601), necesitas convertir ese formato antes
de enviar los datos. No hacerlo puede llevar a errores en el almacenamiento
o procesamiento de la información.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Compatibilidad de Navegadores',
    'subtopic': 'Soporte para navegadores antiguos',
    'definition': r'''
Aunque el desarrollo web moderno avanza a pasos agigantados con nuevas funcionalidades y APIs de JavaScript, no todos los usuarios tienen el navegador más reciente. Garantizar el "soporte para navegadores antiguos" es crucial si quieres que tu aplicación sea accesible para la mayor cantidad de personas posible, incluso si eso significa un poco más de esfuerzo.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una canción de moda que sale hoy. Si solo se puede escuchar en los altavoces de última generación, mucha gente no la va a disfrutar. Pero si también suena bien en unos auriculares más antiguos o en un equipo de música de hace unos años, entonces tiene un alcance mucho mayor. De la misma manera, si tu aplicación solo funciona en Chrome o Firefox actualizados, te estás perdiendo una porción de tu audiencia, ya sea porque tienen sistemas operativos antiguos, políticas de empresa que restringen actualizaciones, o simplemente porque no tienen el hábito de actualizar.

El desafío con los navegadores antiguos es que no soportan las últimas características de JavaScript (ESNext), CSS o las APIs web que usamos hoy en día para crear aplicaciones modernas. Angular, al estar construido sobre tecnologías modernas, se beneficiaría enormemente de estas características. Sin embargo, para no dejar a nadie atrás, necesitamos estrategias para soportar entornos menos capaces.

Aquí te dejo algunas consideraciones clave para el soporte de navegadores antiguos:

* **Identificar tu Audiencia Objetivo**: Antes de añadir soporte para navegadores antiguos, es vital saber si tus usuarios realmente los utilizan. Herramientas de análisis como Google Analytics pueden decirte qué navegadores y versiones usan tus visitantes. Apuntar a IE11 puede tener sentido para algunas audiencias empresariales, pero no para un público general.
* **Decidir el Nivel de Soporte**: ¿Es un "soporte completo" donde todo funciona perfectamente, o un "soporte degradado elegante" donde la aplicación es usable pero quizás con menos funcionalidades o un aspecto visual ligeramente diferente? A veces, un soporte básico es suficiente.
* **Transpilación de Código**: El código JavaScript moderno (ES2015+ o ESNext) se "transpila" a una versión anterior de JavaScript (ej., ES5) que los navegadores más viejos pueden entender. Esto lo hace por ti el `build` de Angular con herramientas como Babel o TypeScript.
* **Polyfills**: Son fragmentos de código que implementan funcionalidades de JavaScript modernas que faltan en navegadores antiguos. Si un navegador no tiene una API como `fetch` o `Promise`, un polyfill la añade para que tu código pueda usarla sin problemas. Angular ya configura muchos polyfills por defecto.
* **CSS Prefijos de Vendedor y Compatibilidad**: Las propiedades CSS más nuevas a menudo necesitan prefijos de vendedor (ej., `-webkit-`, `-moz-`) para funcionar en navegadores antiguos. Herramientas como Autoprefixer (que se integra en el proceso de build de Angular) añaden estos prefijos automáticamente.
* **Evitar APIs Modernas sin Polyfill**: Sé consciente de las APIs web que usas. Si una API no tiene un polyfill o si el polyfill es muy pesado, considera alternativas o proporciona una experiencia degradada para esos navegadores.

Aunque mantener la compatibilidad puede aumentar el tamaño del paquete de tu aplicación y el tiempo de compilación, es un esfuerzo que puede valer la pena para asegurar una audiencia más amplia y una experiencia inclusiva.
''',
    'code_example': r'''
// --- EJEMPLO: SOPORTE PARA NAVEGADORES ANTIGUOS Y POLYFILLS ---

// 1. Configuración de `browserslist` (archivo `browserslist` en la raíz de tu proyecto)
// Angular CLI usa este archivo para saber qué navegadores debes soportar.
// Esto influye en la transpilación de JavaScript y en los prefijos CSS.
// Puedes encontrar una lista completa de configuraciones en: https://browsersl.ist/
/*
# browserslist file (en la raíz de tu proyecto)

# Para producción (ng build --configuration=production)
production:
  >0.2%
  not dead
  not op_mini all
  not ie 11 # Excluye IE 11 para producción moderna (opcional, si no lo necesitas)

# Para desarrollo (ng serve)
development:
  last 1 chrome version
  last 1 firefox version
  last 1 safari version
*/
// Si necesitas IE11, lo añadirías así:
/*
production:
  >0.2%
  not dead
  not op_mini all
  IE 11 # Incluye IE 11
*/

// 2. Archivo `polyfills.ts` (src/polyfills.ts)
// Este archivo es donde importas los polyfills necesarios.
// Angular CLI genera uno por defecto con los más comunes.
// Solo necesitas añadir los polyfills que tu aplicación *específicamente* necesite
// y que no estén cubiertos por defecto.

/***************************************************************************************************
 * BROWSER POLYFILLS
 */

/**
 * If you need to support IE11, add the following to `polyfills.ts`:
 * import 'core-js/es/array';
 * import 'core-js/es/date';
 * import 'core-js/es/function';
 * import 'core-js/es/map';
 * import 'core-js/es/math';
 * import 'core-js/es/number';
 * import 'core-js/es/object';
 * import 'core-js/es/promise';
 * import 'core-js/es/regexp';
 * import 'core-js/es/set';
 * import 'core-js/es/string';
 * import 'core-js/es/symbol';
 * import 'core-js/es/weak-map';
 * import 'core-js/es/array-buffer';
 * import 'core-js/es/data-view';
 * import 'core-js/es/typed-array';
 * import 'core-js/es/reflect'; // Para el uso de Reflect-metadata en Angular (normalmente ya incluido)
 */

// Ejemplo de añadir un polyfill específico (si no estuviera en `core-js` por defecto)
// Si tu código usa una API como `IntersectionObserver` y necesitas soportar navegadores
// antiguos que no la tienen:
// `npm install intersection-observer`
// import 'intersection-observer';

// Si tu aplicación usa una API que no está en `core-js`, como `fetch`:
// `npm install whatwg-fetch`
// import 'whatwg-fetch'; // Polyfill para la API Fetch


// 3. Demostración en un Componente (src/app/browser-support-demo/browser-support-demo.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-browser-support-demo',
  template: `
    <div class="browser-support-container">
      <h2>Demostración de Compatibilidad de Navegadores</h2>

      <p>
        Esta aplicación está configurada para intentar ser compatible con diferentes navegadores.
        El código moderno de JavaScript se transpila y se usan polyfills para funcionalidades faltantes.
      </p>

      <h3>Funcionalidades Modernas:</h3>
      <p>
        Promesas soportadas: <strong>{{ isPromiseSupported }}</strong>
      </p>
      <p>
        Fetch API soportada: <strong>{{ isFetchSupported }}</strong>
      </p>
      <p>
        Map/Set soportados: <strong>{{ isMapSetSupported }}</strong>
      </p>

      <div *ngIf="!isPromiseSupported" class="warning">
        <p><strong>Advertencia:</strong> El navegador actual no soporta nativamente Promises. Se usa un polyfill.</p>
      </div>
      <div *ngIf="!isFetchSupported" class="warning">
        <p><strong>Advertencia:</strong> El navegador actual no soporta nativamente Fetch API. Se usa un polyfill.</p>
      </div>
    </div>
  `,
  styles: [`
    .browser-support-container { border: 1px solid #4CAF50; padding: 20px; margin: 20px; }
    h3 { color: #2E7D32; }
    .warning {
      background-color: #fff3cd;
      border: 1px solid #ffeeba;
      color: #856404;
      padding: 10px;
      margin-top: 15px;
      border-radius: 5px;
    }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class BrowserSupportDemoComponent implements OnInit {
  isPromiseSupported: boolean = false;
  isFetchSupported: boolean = false;
  isMapSetSupported: boolean = false;

  ngOnInit(): void {
    // Estas comprobaciones verificarían si la funcionalidad nativa existe.
    // Si un polyfill está presente, la funcionalidad *estará* disponible,
    // pero esta comprobación diría si es nativa o proporcionada por polyfill.
    this.isPromiseSupported = typeof Promise !== 'undefined';
    this.isFetchSupported = typeof fetch !== 'undefined';
    this.isMapSetSupported = typeof Map !== 'undefined' && typeof Set !== 'undefined';
  }
}

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { BrowserSupportDemoComponent } from './browser-support-demo/browser-support-demo.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserSupportDemoComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-browser-support-demo></app-browser-support-demo>
*/

/*
Un error común es no definir correctamente tu `browserslist`.
Si no especificas los navegadores que necesitas soportar (o usas una configuración
demasiado moderna), el proceso de build de Angular podría no transpilarr
tu código JavaScript o CSS a un nivel que los navegadores más antiguos puedan entender.
Esto resultará en errores de sintaxis o propiedades CSS no reconocidas en esos navegadores.

Otro error es añadir polyfills indiscriminadamente.
Incluir polyfills para cada posible API moderna que quizás uses o no,
sin un análisis previo, aumenta innecesariamente el tamaño del bundle de tu aplicación.
Esto afecta el rendimiento de carga para *todos* los usuarios, incluso los de navegadores modernos.
Solo importa los polyfills que sean estrictamente necesarios para tu base de usuarios objetivo
y las funcionalidades que utilizas.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Compatibilidad de Navegadores',
    'subtopic': 'Uso de polyfills',
    'definition': r'''
Los "polyfills" son un concepto fundamental cuando hablamos de "soporte para navegadores antiguos". Piensa en ellos como pequeños fragmentos de código JavaScript que proporcionan la funcionalidad de las APIs web o de las características del lenguaje JavaScript moderno que un navegador antiguo no tiene de forma nativa. Es decir, "rellenan" los huecos.

Pensemos por un momento en un adaptador universal para enchufes eléctricos. Cuando viajas a un país con un tipo de enchufe diferente, el adaptador te permite usar tus aparatos electrónicos sin importar el tipo de toma de corriente. Un polyfill hace algo parecido: permite que tu código moderno, escrito con las últimas características de JavaScript o APIs, "funcione" en un entorno de navegador más antiguo que no las soporta nativamente.

El problema es que el ecosistema web evoluciona muy rápido. Constantemente aparecen nuevas APIs de navegador (como `fetch` para peticiones HTTP, `IntersectionObserver` para detectar la visibilidad de elementos, o `ResizeObserver`) y nuevas características de JavaScript (como `Promise`, `Map`, `Set`, `async/await`). Los navegadores más recientes las implementan rápidamente, pero los antiguos no.

Aquí es donde entran los polyfills:

* **¿Cómo funcionan?**: Cuando importas un polyfill, se ejecuta un código que verifica si una funcionalidad específica ya existe en el entorno global del navegador. Si no existe, el polyfill la implementa. De esta manera, tu código puede llamar a esa funcionalidad sin preocuparse si es nativa o proporcionada por el polyfill.
* **Archivos `polyfills.ts` en Angular**: Angular CLI genera un archivo `src/polyfills.ts` por defecto. Este archivo es el lugar central para importar todos los polyfills que tu aplicación necesita. Contiene comentarios útiles que te guían sobre qué polyfills importar para navegadores específicos, como IE11.
* **`core-js`**: Es una de las librerías de polyfills más populares y exhaustivas. Angular utiliza `core-js` para cubrir la mayoría de las características de JavaScript de ES6+ (ES2015 y posteriores) que puedan faltar en navegadores antiguos.
* **Polyfills específicos de API**: Para APIs web completas que no están cubiertas por `core-js` (como `fetch`, `Web Animations API` o `IntersectionObserver`), a menudo necesitarás instalar e importar librerías de polyfills específicas para esas APIs.

**Importante**: Aunque los polyfills son muy útiles, no son una solución mágica. Cada polyfill añade tamaño a tu bundle final, lo que significa que tu aplicación tardará más en cargar. Por eso, es fundamental solo incluir los polyfills que realmente necesitas para los navegadores que tus usuarios utilizan. La clave es un equilibrio entre la compatibilidad y el rendimiento.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE POLYFILLS EN ANGULAR ---

// 1. Archivo `polyfills.ts` (src/polyfills.ts)
// Este es el archivo principal donde se gestionan los polyfills.
// Angular CLI ya preconfigura muchos por defecto.
// Los que están comentados suelen ser para IE11 o características muy antiguas.

/***************************************************************************************************
 * BROWSER POLYFILLS
 */

/**
 * If you need to support IE11, add the following to `polyfills.ts`:
 * import 'core-js/es/array';
 * import 'core-js/es/date';
 * import 'core-js/es/function';
 * import 'core-js/es/map';
 * import 'core-js/es/math';
 * import 'core-js/es/number';
 * import 'core-js/es/object';
 * import 'core-js/es/promise';
 * import 'core-js/es/regexp';
 * import 'core-js/es/set';
 * import 'core-js/es/string';
 * import 'core-js/es/symbol';
 * import 'core-js/es/weak-map';
 * import 'core-js/es/array-buffer';
 * import 'core-js/es/data-view';
 * import 'core-js/es/typed-array';
 * import 'core-js/es/reflect';
 */

// EJEMPLO: Si tu aplicación usa la API `IntersectionObserver`
// y tu `browserslist` incluye navegadores que no la soportan (ej. IE11 o Safari < 12.1):
// 1. Instala el polyfill: `npm install intersection-observer`
// 2. Descomenta o añade la siguiente línea en `polyfills.ts`:
// import 'intersection-observer';

// EJEMPLO: Si tu aplicación usa la API `Web Animations API` (no soportada por completo en todos los navegadores)
// 1. Instala el polyfill: `npm install web-animations-js`
// 2. Descomenta o añade la siguiente línea en `polyfills.ts`:
// import 'web-animations-js';


// 2. Componente de demostración (src/app/polyfill-demo/polyfill-demo.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-polyfill-demo',
  template: `
    <div class="polyfill-container">
      <h2>Demostración de Polyfills</h2>

      <p>
        Verificando la disponibilidad de APIs y características de JavaScript:
      </p>

      <ul>
        <li>
          <strong>Promise:</strong> {{ isPromiseAvailable ? 'Disponible' : 'No disponible (necesitaría polyfill)' }}
        </li>
        <li>
          <strong>Map:</strong> {{ isMapAvailable ? 'Disponible' : 'No disponible (necesitaría polyfill)' }}
        </li>
        <li>
          <strong>Fetch API:</strong> {{ isFetchAvailable ? 'Disponible' : 'No disponible (necesitaría polyfill)' }}
        </li>
        <li>
          <strong>IntersectionObserver:</strong> {{ isIntersectionObserverAvailable ? 'Disponible' : 'No disponible (necesitaría polyfill)' }}
        </li>
      </ul>

      <p class="note">
        Si ves "Disponible", significa que la funcionalidad está presente. Podría ser nativa del navegador o proporcionada por un polyfill.
        Si la ejecutas en un navegador moderno, la mayoría serán nativas. Si simulas un navegador antiguo (ej. IE11 con dev tools),
        verás que algunas no estarían disponibles sin polyfills.
      </p>
    </div>
  `,
  styles: [`
    .polyfill-container { border: 1px solid #7B1FA2; padding: 20px; margin: 20px; }
    h2 { color: #512DA8; }
    ul { list-style: none; padding: 0; }
    li { margin-bottom: 5px; }
    .note { font-size: 0.9em; color: #555; margin-top: 20px; }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class PolyfillDemoComponent implements OnInit {
  isPromiseAvailable: boolean = false;
  isMapAvailable: boolean = false;
  isFetchAvailable: boolean = false;
  isIntersectionObserverAvailable: boolean = false;

  ngOnInit(): void {
    // Comprueba si la API o característica está definida en el entorno global
    this.isPromiseAvailable = typeof Promise !== 'undefined';
    this.isMapAvailable = typeof Map !== 'undefined';
    this.isFetchAvailable = typeof fetch !== 'undefined';
    this.isIntersectionObserverAvailable = typeof IntersectionObserver !== 'undefined';
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { PolyfillDemoComponent } from './polyfill-demo/polyfill-demo.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    PolyfillDemoComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-polyfill-demo></app-polyfill-demo>
*/

/*
Un error común es añadir polyfills sin necesidad, lo que infla el tamaño del bundle.
Si tu `browserslist` ya excluye navegadores muy antiguos (ej., no soportas IE11)
y no estás usando APIs muy nuevas que requieran polyfills específicos, es posible
que la configuración por defecto de Angular sea suficiente. Revisar qué polyfills
se importan y eliminar los innecesarios puede mejorar el rendimiento.

Otro error es esperar que los polyfills solucionen todos los problemas de compatibilidad.
Aunque cubren muchas brechas, no pueden replicar perfectamente todo el comportamiento
o rendimiento de las APIs nativas. Además, no solucionan problemas de CSS con prefijos
de navegador (eso lo maneja Autoprefixer y tu `browserslist`) ni comportamientos
distintos de los navegadores que van más allá de una simple "función faltante".
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Internacionalización y Accesibilidad',
    'topic': 'Compatibilidad de Navegadores',
    'subtopic': 'Pruebas de compatibilidad',
    'definition': r'''
Una vez que has implementado polyfills y configurado tu `browserslist`, la única manera de estar seguro de que tu aplicación funciona como esperas en diferentes entornos es a través de las "pruebas de compatibilidad". Estas pruebas verifican que tu aplicación se comporta y se ve correctamente en una variedad de navegadores y dispositivos, asegurando una experiencia de usuario consistente.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en un paraguas que se vende en todo el mundo. No basta con probarlo en un día soleado. Tienes que probarlo en lluvia ligera, tormentas fuertes y vientos racheados para saber si realmente funciona como se espera en diferentes condiciones. De la misma manera, tu aplicación necesita ser probada en una "variedad de navegadores" para asegurar que su funcionalidad y su apariencia se mantengan estables y utilizables, sin importar dónde la abra el usuario.

Las pruebas de compatibilidad de navegadores son cruciales y pueden ser un desafío debido a la gran cantidad de combinaciones posibles. Aquí te dejo algunas estrategias y herramientas:

1.  **Definir la Matriz de Compatibilidad**: Antes de empezar a probar, establece claramente qué navegadores, versiones y sistemas operativos vas a soportar. Esto debería basarse en los datos de uso de tus usuarios y los requisitos del proyecto.

2.  **Pruebas Manuales**:
    * **Navegadores Reales**: Si tienes los recursos, es ideal probar en máquinas virtuales o dispositivos físicos con las versiones de navegador y sistema operativo objetivo.
    * **Emuladores y Simuladores**: Para dispositivos móviles, los emuladores (como los de Android Studio) y simuladores (como Xcode para iOS) son útiles para probar en diferentes tamaños de pantalla y versiones de OS.
    * **Modo de Desarrollo del Navegador (DevTools)**: Las herramientas de desarrollo de Chrome y Firefox permiten emular dispositivos móviles y ajustar el user-agent, lo cual es útil para pruebas rápidas de responsive design y algunas comprobaciones de compatibilidad, pero no reemplaza las pruebas en navegadores reales.

3.  **Herramientas de Pruebas de Compatibilidad**:
    * **Servicios de Pruebas en la Nube**: Son herramientas muy populares que te permiten probar tu aplicación en cientos de combinaciones de navegadores y dispositivos reales sin tener que configurarlos tú mismo. Algunos ejemplos son:
        * **BrowserStack**: Ofrece acceso a una amplia gama de navegadores y dispositivos reales.
        * **Sauce Labs**: Similar a BrowserStack, con énfasis en la automatización de pruebas.
        * **LambdaTest**: Otra opción robusta para pruebas en la nube.
        * Estos servicios te permiten ejecutar tus pruebas automatizadas (ej., E2E con Cypress) en su infraestructura.
    * **Herramientas de automatización de End-to-End (E2E)**: Frameworks como Cypress, Playwright o Selenium son excelentes para escribir pruebas que simulan la interacción de un usuario y pueden ejecutarse en diferentes navegadores.
        * **Cypress**: Excelente para pruebas rápidas en navegadores basados en Chromium, Firefox y WebKit.
        * **Playwright**: Desarrollado por Microsoft, soporta Chromium, Firefox y WebKit, y es muy rápido y confiable.
        * **Selenium**: Una opción más antigua pero muy potente, soporta casi todos los navegadores y lenguajes.

4.  **Linters y Herramientas de Análisis Estático**:
    * **ESLint y Stylelint**: Con las configuraciones adecuadas, pueden advertirte sobre el uso de características de JavaScript o CSS que no son compatibles con tu `browserslist` objetivo.

Al integrar las pruebas de compatibilidad en tu pipeline de desarrollo, puedes asegurarte de que tu aplicación ofrezca una experiencia consistente y de alta calidad a todos tus usuarios, independientemente de su navegador o dispositivo.
''',
    'code_example': r'''
// --- EJEMPLO: PRUEBAS DE COMPATIBILIDAD (CONCEPTUAL Y CON HERRAMIENTAS) ---

// Al igual que las pruebas de accesibilidad, las pruebas de compatibilidad
// se realizan principalmente con herramientas externas o en diferentes entornos de navegador.
// Sin embargo, podemos ilustrar la configuración y cómo Angular se prepara para ello.

// 1. Configuración de `browserslist` (reafirmando su importancia)
// Este archivo es el punto de partida. Angular CLI lo usa para la transpilación
// de TypeScript a JavaScript y para añadir prefijos a tu CSS (usando Autoprefixer).
// Si tu `browserslist` no es preciso, tus bundles de producción podrían no ser
// compatibles con los navegadores que necesitas soportar.
/*
# browserslist file (en la raíz de tu proyecto)

# Ejemplo para un soporte más amplio, incluyendo IE11
production:
  IE 11
  last 2 Chrome versions
  last 2 Firefox versions
  last 2 Edge versions
  last 2 Safari versions
  last 2 iOS versions
  last 2 Android versions
  last 2 ChromeAndroid versions
  not op_mini all

development:
  last 1 chrome version
  last 1 firefox version
  last 1 safari version
*/

// 2. Archivo `tsconfig.json` (src/tsconfig.json)
// La opción `target` en `compilerOptions` especifica la versión de JavaScript
// a la que TypeScript compilará tu código. Esto debe ser compatible con tus navegadores objetivo.
// Si tu `browserslist` incluye IE11, `es5` es el target seguro.
/*
{
  "compilerOptions": {
    "target": "es2017", // O "es5" si necesitas un soporte muy amplio (ej. IE11)
    "module": "es2020",
    "lib": [
      "es2020",
      "dom"
    ],
    // ... otras opciones
  },
  // ...
}
*/

// 3. Demostración en un Componente (src/app/compatibility-test-demo/compatibility-test-demo.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-compatibility-test-demo',
  template: `
    <div class="test-container">
      <h2>Demostración de Pruebas de Compatibilidad</h2>

      <p>
        El objetivo de las pruebas de compatibilidad es asegurar que esta aplicación
        funciona consistentemente en diferentes navegadores y dispositivos.
      </p>

      <h3>Ejemplos de características que se prueban:</h3>
      <ul>
        <li>Funcionalidad de botones y enlaces.</li>
        <li>Diseño responsivo y adaptabilidad en diferentes tamaños de pantalla.</li>
        <li>Rendimiento de animaciones CSS.</li>
        <li>Comportamiento de formularios y validaciones.</li>
        <li>Carga y visualización de imágenes y videos.</li>
        <li>Interacciones con JavaScript modernas (ej. drag and drop, WebSockets).</li>
      </ul>

      <div class="feature-box">
        <h4>CSS Moderno (con Autoprefixer)</h4>
        <p class="css-grid-example">
          Este div usa CSS Grid. Su disposición debe ser consistente.
        </p>
      </div>

      <div class="feature-box">
        <h4>JavaScript Moderno (con Transpilación y Polyfills)</h4>
        <button (click)="logBrowserInfo()">Mostrar Información del Navegador</button>
        <p *ngIf="browserInfo">{{ browserInfo }}</p>
      </div>
    </div>
  `,
  styles: [`
    .test-container { border: 1px solid #FFC107; padding: 20px; margin: 20px; }
    h2 { color: #FFA000; }
    .feature-box {
      border: 1px solid #FFECB3;
      padding: 15px;
      margin-top: 15px;
      border-radius: 5px;
    }
    .css-grid-example {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
      background-color: #fff8e1;
      padding: 10px;
    }
    .css-grid-example::before { content: "Columna 1"; padding: 5px; border: 1px solid #ccc; }
    .css-grid-example::after { content: "Columna 2"; padding: 5px; border: 1px solid #ccc; }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class CompatibilityTestDemoComponent implements OnInit {
  browserInfo: string | null = null;

  ngOnInit(): void { }

  logBrowserInfo(): void {
    // navigator.userAgent es la forma tradicional, pero no siempre es confiable.
    // Para pruebas reales, usarías herramientas que inyecten el user agent real.
    this.browserInfo = `User Agent: ${navigator.userAgent}`;
    console.log(this.browserInfo);
  }
}

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { CompatibilityTestDemoComponent } from './compatibility-test-demo/compatibility-test-demo.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    CompatibilityTestDemoComponent, // Importar standalone component
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-compatibility-test-demo></app-compatibility-test-demo>
*/

/*
--- CÓMO REALIZAR LAS PRUEBAS DE COMPATIBILIDAD ---

1.  **Pruebas Manuales (usando el componente `CompatibilityTestDemoComponent` como ejemplo):**
    * **Navegadores Diferentes**: Abre tu aplicación en Chrome, Firefox, Edge, Safari (si tienes Mac), y en un navegador antiguo (ej., IE11 si lo soportas, o versiones antiguas de Chrome/Firefox si las puedes emular).
    * **Dispositivos Móviles**: Abre tu aplicación en un teléfono iOS (Safari/Chrome) y un teléfono Android (Chrome). Usa emuladores si no tienes los dispositivos físicos.
    * **Verifica CSS Grid**: Observa el `.css-grid-example`. ¿Se ve como una cuadrícula de dos columnas en todos los navegadores? En navegadores muy antiguos sin soporte de Grid, podría apilarse.
    * **Funcionalidad JS**: Haz clic en el botón "Mostrar Información del Navegador". ¿Funciona en todos los navegadores?
    * **Diseño Responsivo**: Cambia el tamaño de la ventana del navegador. ¿La disposición de los elementos se adapta correctamente en todos los puntos de ruptura (breakpoints)?

2.  **Herramientas de Pruebas en la Nube (BrowserStack, Sauce Labs, LambdaTest):**
    * Registra una cuenta en uno de estos servicios.
    * Carga tu aplicación (o un enlace a ella).
    * Selecciona las combinaciones de navegador/OS/dispositivo que quieres probar.
    * Puedes iniciar sesiones manuales para interactuar con tu aplicación, o integrar tus pruebas E2E (escritas con Cypress/Playwright/Selenium) para que se ejecuten automáticamente en su infraestructura.
    * Estas herramientas te darán capturas de pantalla, videos y logs de errores para cada combinación.

3.  **Herramientas de Automatización (Cypress, Playwright):**
    * **Configura Cypress/Playwright**: Instala y configura una de estas herramientas en tu proyecto.
    * **Escribe Pruebas E2E**: Escribe pruebas que simulen el flujo de usuario a través de tu aplicación (ej., "el usuario puede iniciar sesión", "el usuario puede añadir un producto al carrito").
    * **Ejecuta Pruebas en Múltiples Navegadores**:
        * Cypress: `cypress run --browser chrome` o `cypress run --browser firefox`
        * Playwright: `npx playwright test --project=chromium` o `--project=firefox` o `--project=webkit`
    * Estas pruebas se ejecutarán en diferentes navegadores y te alertarán sobre fallos de funcionalidad o renderizado.

--- ERRORES COMUNES EN PRUEBAS ---

* **No definir una matriz de compatibilidad**: Lanzarse a probar sin saber qué navegadores son prioritarios es una pérdida de tiempo y recursos. Prioriza según tus usuarios.
* **Confiar solo en herramientas automatizadas**: Las herramientas automatizadas son geniales para detectar errores, pero no pueden reemplazar la "experiencia de usuario" en un navegador real. Un diseño que se ve ligeramente desalineado o una animación que se siente lenta en un navegador específico solo se detectará con una prueba manual o visual.
* **Ignorar errores de consola**: Durante las pruebas de compatibilidad, revisa siempre la consola del navegador. Los errores de JavaScript o advertencias de CSS pueden indicar problemas de compatibilidad que no son inmediatamente obvios en la interfaz de usuario.
* **Probar solo la última versión de un navegador**: A veces, los usuarios no actualizan sus navegadores tan rápido. Asegúrate de probar las versiones anteriores que aún estén en uso por una parte significativa de tu audiencia.
*/
'''
  });
}

Future<void> insertAngularMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Animaciones en Angular',
    'subtopic': 'Uso del módulo de animaciones',
    'definition': r'''
Las animaciones son una forma poderosa de hacer que tu aplicación web se sienta más viva y reactiva a las interacciones del usuario. En Angular, podemos lograr esto de una manera muy organizada y eficiente gracias a su módulo de animaciones dedicado.

No sé tú, pero a mí esto al principio me costó 🤯. La idea es que Pensemos por un momento en una aplicación sin animaciones: es como un libro de texto, funcional pero estático. Ahora, imagina una aplicación con animaciones fluidas: es como una película interactiva, donde los elementos aparecen, desaparecen o cambian de estado de una manera que guía tu atención y mejora la experiencia general. El módulo de animaciones de Angular nos permite controlar cómo se mueven los elementos en la interfaz de usuario, añadiendo esa capa extra de pulido.

El módulo de animaciones de Angular (`@angular/animations`) se construye sobre la API Web Animations (que Angular polyfills si el navegador no la soporta nativamente, como vimos en el tema anterior). Esto significa que las animaciones se ejecutan de manera eficiente, a menudo utilizando el hilo principal del navegador lo menos posible, para mantener la interfaz de usuario fluida.

Para empezar a usar el módulo de animaciones, necesitas hacer un par de cosas:

* **Importar `BrowserAnimationsModule`**: Este módulo es el que habilita el sistema de animaciones en tu aplicación. Debes importarlo una única vez en tu `AppModule`. Sin él, tus animaciones no funcionarán.
* **Definir `animations` en tu Componente**: Dentro del decorador `@Component`, puedes añadir una propiedad `animations` que es un array. Aquí es donde definirás tus disparadores (`trigger`) de animación, que son como "recetas" que describen cómo se mueven los elementos.

El módulo de animaciones te permite definir transiciones entre estados (por ejemplo, `void => *` para cuando un elemento aparece, o `* => void` para cuando desaparece), o animar propiedades CSS directamente (como opacidad, tamaño, posición). Puedes encadenar animaciones, aplicar retrasos, y controlar la duración y la curva de aceleración. Esto te da un control muy granular sobre cómo se ve y se siente el movimiento en tu aplicación. Por ejemplo, Netflix utiliza animaciones sutiles pero efectivas en sus interfaces para guiar al usuario a través del contenido y hacer que la navegación sea más atractiva.
''',
    'code_example': r'''
// --- EJEMPLO: USO DEL MÓDULO DE ANIMACIONES ---

// 1. Habilitar el módulo de animaciones en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'; // Importar aquí
import { AppComponent } from './app.component';
import { SimpleAnimationComponent } from './simple-animation/simple-animation.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule, // <-- ¡Importante! Habilita el módulo de animaciones
    SimpleAnimationComponent, // Importar componente standalone
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 2. Componente con una animación simple (src/app/simple-animation/simple-animation.component.ts)
import { Component } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition
} from '@angular/animations'; // Importar las funciones de animaciones
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-simple-animation',
  template: `
    <div class="animation-container">
      <h2>Animación Simple</h2>

      <button (click)="toggleVisibility()">Alternar Visibilidad</button>

      <div
        class="animated-box"
        [@fadeAnimation]="isVisible ? 'visible' : 'hidden'"
      >
        Este es un cuadro que se desvanece al aparecer y desaparecer.
      </div>

      <p class="note">
        Haz clic en el botón para ver la animación de entrada y salida.
      </p>
    </div>
  `,
  styles: [`
    .animation-container { border: 1px solid #673AB7; padding: 20px; margin: 20px; text-align: center; }
    .animated-box {
      width: 200px;
      height: 100px;
      background-color: #9C27B0;
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 20px auto;
      border-radius: 8px;
    }
    button { padding: 10px 15px; background-color: #673AB7; color: white; border: none; border-radius: 5px; cursor: pointer; }
    .note { font-size: 0.9em; color: #555; margin-top: 20px; }
  `],
  standalone: true,
  imports: [CommonModule],
  animations: [
    trigger('fadeAnimation', [
      // Estado 'void' es cuando el elemento no está en el DOM (antes de entrar)
      // Estado '*' es cualquier estado (incluyendo visible)
      // Estado 'visible' y 'hidden' son estados personalizados que definimos

      state('visible', style({ opacity: 1, transform: 'scale(1)' })),
      state('hidden', style({ opacity: 0, transform: 'scale(0.8)' })),

      // Transición de entrada (cuando el elemento aparece en el DOM)
      transition('void => visible', [
        style({ opacity: 0, transform: 'scale(0.8)' }), // Estilo inicial para la entrada
        animate('300ms ease-out', style({ opacity: 1, transform: 'scale(1)' })) // Anima a visible
      ]),

      // Transición de salida (cuando el elemento desaparece del DOM)
      transition('visible => void', [
        animate('200ms ease-in', style({ opacity: 0, transform: 'scale(0.8)' })) // Anima a invisible
      ])
    ])
  ]
})
export class SimpleAnimationComponent {
  isVisible: boolean = true;

  toggleVisibility(): void {
    this.isVisible = !this.isVisible;
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-simple-animation></app-simple-animation>
*/

/*
Un error común es olvidar importar `BrowserAnimationsModule` en tu `AppModule`.
Sin este módulo, Angular no sabrá cómo procesar tus definiciones de animación,
y simplemente no se ejecutarán. Asegúrate de que esté en tu array de `imports`.

Otro error es definir mal los `state` o `transition` para animaciones de entrada/salida.
A veces, se confunde `void` con un estado regular, o se intenta animar un elemento
que no tiene un `*ngIf` o `*ngFor` (que son los que activan las transiciones `void`).
Asegúrate de que tus transiciones coincidan con cómo el elemento entra y sale del DOM.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Animaciones en Angular',
    'subtopic': 'Transiciones y estados',
    'definition': r'''
En el corazón del sistema de animaciones de Angular están las "transiciones y estados". Imagina que cada elemento de tu interfaz de usuario puede tener diferentes "estados" (como visible/oculto, abierto/cerrado, activo/inactivo), y las "transiciones" son las reglas que definen cómo se mueve un elemento de un estado a otro.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un semáforo. No solo pasa de rojo a verde instantáneamente; a menudo hay una fase amarilla de transición que indica que el cambio está por ocurrir. En las aplicaciones, las transiciones suaves entre estados evitan cambios bruscos y hacen que la interfaz sea más comprensible y agradable para el usuario. Es lo que hace que una aplicación se sienta "pulida" en lugar de "rígida".

En Angular, defines los estados de tus elementos y luego especificas cómo se deben animar los cambios entre esos estados.

Aquí te explico los conceptos clave:

* **`state()`**: Define un nombre para un estado y los estilos CSS asociados a ese estado. Por ejemplo, puedes definir un estado `open` con `opacity: 1` y `height: *` (altura automática), y un estado `closed` con `opacity: 0` y `height: 0`. Angular aplicará estos estilos cuando el elemento entre en ese estado.
* **`transition()`**: Define cómo un elemento debe animarse cuando pasa de un estado a otro. La sintaxis es `transition('estadoInicial => estadoFinal', [...animaciones])`.
    * Puedes usar comodines:
        * `*`: Representa cualquier estado.
        * `void`: Representa el estado en el que el elemento no está en el DOM (cuando se añade o se quita con `*ngIf`).
    * Ejemplos de transiciones comunes:
        * `'void => *'`: Cuando un elemento se añade al DOM.
        * `'* => void'`: Cuando un elemento se elimina del DOM.
        * `'open => closed'`: Cuando un elemento cambia explícitamente de un estado "abierto" a "cerrado" (por ejemplo, un acordeón).
* **`animate()`**: Dentro de una `transition`, usas `animate()` para especificar la duración, el retraso y la curva de aceleración (easing) de la animación, y opcionalmente los estilos a los que quieres animar.
    * Sintaxis básica: `animate('duración [retraso] [easing]', style({...}))`.
    * Ejemplo: `animate('500ms ease-out', style({ opacity: 1 }))`.

Al combinar `state` y `transition`, puedes crear animaciones complejas y responsivas que reaccionan a la lógica de tu aplicación. Por ejemplo, piensa en cómo Google Maps hace zoom suavemente cuando cambias la escala, o cómo los paneles laterales de muchas aplicaciones de correo se deslizan suavemente al abrirse y cerrarse. Esa fluidez se logra con transiciones y estados bien definidos.
''',
    'code_example': r'''
// --- EJEMPLO: TRANSICIONES Y ESTADOS ---

// 1. Componente con animaciones de estado y transición (src/app/state-transition-animation/state-transition-animation.component.ts)
import { Component } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition
} from '@angular/animations';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-state-transition-animation',
  template: `
    <div class="animation-container">
      <h2>Transiciones y Estados</h2>

      <button (click)="toggleOpen()">Alternar Panel ({{ isOpen ? 'Cerrar' : 'Abrir' }})</button>

      <div
        class="animated-panel"
        [@panelState]="isOpen ? 'open' : 'closed'"
      >
        <p>Contenido del panel.</p>
        <p>Este panel se anima de acuerdo a su estado.</p>
      </div>

      <hr>

      <h3>Animación de Lista (Entrada/Salida)</h3>
      <button (click)="addItem()">Añadir Ítem</button>
      <button (click)="removeItem()">Eliminar Último Ítem</button>
      <ul class="item-list">
        <li *ngFor="let item of items; let i = index"
            [@listItem]="'in'"
            (@listItem.done)="animationDone($event)"
            (@listItem.start)="animationStart($event)"
            [attr.data-item-index]="i"
            (click)="removeItemByIndex(i)">
          {{ item }}
        </li>
      </ul>

      <p class="note">
        Haz clic en el panel o en los ítems de la lista para ver las transiciones.
      </p>
    </div>
  `,
  styles: [`
    .animation-container { border: 1px solid #E91E63; padding: 20px; margin: 20px; text-align: center; }
    .animated-panel {
      width: 300px;
      height: 0; /* Controlado por animación */
      background-color: #F8BBD0;
      overflow: hidden; /* Oculta el contenido si la altura es 0 */
      margin: 20px auto;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    .animated-panel p { padding: 15px; color: #333; }

    .item-list { list-style: none; padding: 0; margin-top: 20px; }
    .item-list li {
      background-color: #FFCDD2;
      border: 1px solid #E57373;
      margin: 5px auto;
      padding: 10px;
      width: 250px;
      text-align: left;
      cursor: pointer;
      border-radius: 4px;
      position: relative; /* Para la animación de posición */
    }
    .item-list li:hover { background-color: #EF9A9A; }

    button { margin: 5px; padding: 10px 15px; background-color: #E91E63; color: white; border: none; border-radius: 5px; cursor: pointer; }
    .note { font-size: 0.9em; color: #555; margin-top: 20px; }
  `],
  standalone: true,
  imports: [CommonModule],
  animations: [
    trigger('panelState', [
      // Definimos los estados 'open' y 'closed' con sus estilos finales
      state('open', style({
        height: '*', // '*' significa la altura automática
        opacity: 1,
        backgroundColor: '#F8BBD0'
      })),
      state('closed', style({
        height: '0px',
        opacity: 0,
        backgroundColor: '#FFEBEE'
      })),

      // Definimos las transiciones entre estos estados
      transition('closed <=> open', [
        animate('400ms ease-in-out') // Anima todas las propiedades cambiadas durante 400ms
      ]),
    ]),
    trigger('listItem', [
      // Animación de entrada de un ítem en la lista
      transition('void => *', [
        style({ transform: 'translateX(-100%)', opacity: 0 }), // Comienza fuera de la vista y transparente
        animate('300ms ease-out', style({ transform: 'translateX(0)', opacity: 1 })) // Desliza y aparece
      ]),
      // Animación de salida de un ítem de la lista
      transition('* => void', [
        animate('200ms ease-in', style({ transform: 'translateX(100%)', opacity: 0 })) // Desliza y desaparece
      ])
    ])
  ]
})
export class StateTransitionAnimationComponent implements OnInit {
  isOpen: boolean = true;
  items: string[] = ['Item 1', 'Item 2', 'Item 3'];
  nextItemId: number = 4;

  ngOnInit(): void {
    //
  }

  toggleOpen(): void {
    this.isOpen = !this.isOpen;
  }

  addItem(): void {
    this.items.push(`Item ${this.nextItemId++}`);
  }

  removeItem(): void {
    if (this.items.length > 0) {
      this.items.pop(); // Elimina el último ítem, lo que activa la transición 'void'
    }
  }

  removeItemByIndex(index: number): void {
    this.items.splice(index, 1);
  }

  // Eventos para depuración o lógica adicional cuando la animación empieza/termina
  animationStart(event: AnimationEvent): void {
    console.log(`Animación ${event.triggerName} empezó. Estado: ${event.fromState} -> ${event.toState}`);
  }

  animationDone(event: AnimationEvent): void {
    console.log(`Animación ${event.triggerName} terminó. Estado: ${event.fromState} -> ${event.toState}`);
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-state-transition-animation></app-state-transition-animation>
*/

/*
Un error común es definir transiciones que no tienen un estado inicial o final claro,
especialmente con los estados `void` y `*`. Si un elemento entra o sale del DOM (con `*ngIf`),
debes usar `void => *` o `* => void` respectivamente. Si estás animando un cambio de
propiedad explícitamente controlada por el estado, debes definir los estados y la transición
entre ellos (ej., `open <=> closed`).

Otro error es esperar que los estilos definidos en `state()` se animen implícitamente
sin un `animate()`. Los estilos en `state()` son los estilos finales del estado.
La animación real de un estado a otro se define dentro de un `transition()` usando `animate()`.
Si no especificas `animate()`, los estilos se aplicarán instantáneamente sin transición.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Animaciones en Angular',
    'subtopic': 'Animaciones personalizadas',
    'definition': r'''
A veces, las animaciones básicas de entrada/salida o de cambio de estado no son suficientes. Si necesitas un movimiento más complejo, secuencias de animaciones o control más fino sobre los estilos intermedios, aquí es donde entran en juego las "animaciones personalizadas". Te permiten coreografiar movimientos complejos, casi como un director de orquesta controlando cada instrumento.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un personaje de videojuego. No solo aparece o desaparece; tiene animaciones específicas para caminar, saltar, atacar, cada una con un movimiento único y transiciones suaves. Las animaciones personalizadas en Angular te permiten crear ese tipo de fluidez y complejidad visual, para que tu UI no solo sea funcional, sino también memorable y disfrutable. Es lo que permite que tu aplicación no solo trabaje, sino que "baile".

Las animaciones personalizadas en Angular te dan más control sobre la línea de tiempo de la animación, permitiéndote encadenar múltiples pasos de estilo, usar keyframes, y agrupar animaciones.

Aquí te explico las herramientas para crear animaciones personalizadas:

* **`keyframes()`**: Te permiten definir una secuencia de estilos por los que pasará la animación en diferentes puntos de su progreso. Puedes especificar qué porcentaje del tiempo total de la animación debe aplicarse cada estilo. Esto es como definir puntos intermedios en el camino de la animación, no solo el inicio y el fin.
* **`group()`**: Puedes agrupar múltiples animaciones para que se ejecuten en paralelo. Esto es útil si quieres animar varias propiedades al mismo tiempo (ej., `opacity` y `transform`) o animar elementos diferentes simultáneamente.
* **`sequence()`**: Permite ejecutar animaciones una tras otra. Una animación comienza solo después de que la anterior ha terminado. Esto es ideal para coreografías de movimiento escalonadas.
* **`query()`**: Te permite seleccionar elementos dentro de tu plantilla y aplicarles animaciones. Puedes usar selectores CSS para elegir qué elementos animar, lo que es muy potente para animaciones de lista o animaciones anidadas.
* **`stagger()`**: Especialmente útil con `query()`, `stagger()` aplica un retraso a cada animación de un grupo de elementos, creando un efecto de "cascada" o "escalonado". Es perfecto para animar listas donde los ítems aparecen o desaparecen uno a uno.

Con estas herramientas, puedes construir animaciones muy sofisticadas, desde la carga progresiva de una lista de elementos, hasta transiciones de página complejas, o efectos de "hero" en el que un elemento parece volar de una vista a otra. Por ejemplo, muchas aplicaciones móviles utilizan secuencias de animaciones y staggers para dar una sensación de fluidez y modernidad al mostrar contenido.
''',
    'code_example': r'''
// --- EJEMPLO: ANIMACIONES PERSONALIZADAS ---

// 1. Componente con animaciones de keyframes, group, sequence y query (src/app/custom-animation/custom-animation.component.ts)
import { Component } from '@angular/core';
import {
  trigger,
  state,
  style,
  animate,
  transition,
  keyframes, // Para animaciones por puntos intermedios
  group,     // Para animaciones en paralelo
  sequence,  // Para animaciones en serie
  query,     // Para seleccionar elementos dentro del DOM
  stagger    // Para animar elementos en secuencia con retraso
} from '@angular/animations';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-custom-animation',
  template: `
    <div class="animation-container">
      <h2>Animaciones Personalizadas</h2>

      <h3>Animación con Keyframes (Rebote)</h3>
      <button (click)="bounceBox()">Rebotar Caja</button>
      <div class="box" [@bounce]="bounceState"></div>

      <h3>Animación de Lista (Staggered)</h3>
      <button (click)="addStaggerItem()">Añadir Ítem (Stagger)</button>
      <button (click)="removeStaggerItem()">Eliminar Último</button>
      <ul class="stagger-list">
        <li *ngFor="let item of staggerItems" [@staggerListItem]="'in'">
          {{ item }}
        </li>
      </ul>

      <h3>Animación de Botón (Group/Sequence)</h3>
      <button [@buttonClick]="clickState" (click)="clickButton()">Hazme clic</button>
      <p *ngIf="clickMessage" class="click-message">{{ clickMessage }}</p>

      <p class="note">
        Observa los diferentes efectos de animación.
      </p>
    </div>
  `,
  styles: [`
    .animation-container { border: 1px solid #009688; padding: 20px; margin: 20px; text-align: center; }
    h2 { color: #00796B; }
    .box {
      width: 100px;
      height: 100px;
      background-color: #4CAF50;
      margin: 20px auto;
      border-radius: 8px;
    }
    .stagger-list { list-style: none; padding: 0; margin-top: 20px; }
    .stagger-list li {
      background-color: #A5D6A7;
      border: 1px solid #66BB6A;
      margin: 5px auto;
      padding: 10px;
      width: 200px;
      text-align: center;
      border-radius: 4px;
    }
    .click-message { margin-top: 10px; font-weight: bold; color: #3F51B5; }
    button { margin: 5px; padding: 10px 15px; background-color: #009688; color: white; border: none; border-radius: 5px; cursor: pointer; }
    .note { font-size: 0.9em; color: #555; margin-top: 20px; }
  `],
  standalone: true,
  imports: [CommonModule],
  animations: [
    trigger('bounce', [
      state('start', style({ transform: 'translateY(0)' })),
      state('end', style({ transform: 'translateY(0)' })),
      transition('start => end', [
        animate('1000ms ease-in-out', keyframes([
          style({ transform: 'translateY(0)', offset: 0 }),       // Inicio
          style({ transform: 'translateY(-20px)', offset: 0.2 }), // Salto
          style({ transform: 'translateY(0)', offset: 0.4 }),     // Caída
          style({ transform: 'translateY(-10px)', offset: 0.6 }), // Rebote pequeño
          style({ transform: 'translateY(0)', offset: 0.8 }),     // Termina
          style({ transform: 'translateY(-5px)', offset: 0.9 }),  // Último rebote
          style({ transform: 'translateY(0)', offset: 1.0 })      // Descanso
        ]))
      ])
    ]),
    trigger('staggerListItem', [
      // Animación de entrada para los ítems de la lista
      transition(':enter', [ // Usamos :enter como alias para void => *
        query(':enter', [
          style({ opacity: 0, transform: 'translateY(20px)' }),
          stagger('100ms', [ // Cada ítem se anima con un retraso de 100ms
            animate('300ms ease-out', style({ opacity: 1, transform: 'translateY(0)' }))
          ])
        ], { optional: true }) // optional: true es crucial para evitar errores si no hay elementos
      ]),
      // Animación de salida para los ítems de la lista (no escalonada aquí, pero podría serlo)
      transition(':leave', [ // Usamos :leave como alias para * => void
        query(':leave', [
          style({ position: 'absolute', left: 0, right: 0 }), // Para que los ítems salgan del flujo
          animate('200ms ease-in', style({ opacity: 0, transform: 'translateX(100px)' }))
        ], { optional: true })
      ])
    ]),
    trigger('buttonClick', [
      state('rest', style({ transform: 'scale(1)', backgroundColor: '#009688' })),
      state('clicked', style({ transform: 'scale(1)', backgroundColor: '#00796B' })),
      transition('rest => clicked', [
        group([ // Grupo de animaciones en paralelo
          animate('100ms ease-out', style({ transform: 'scale(1.1)' })), // Escala al hacer clic
          animate('300ms ease-in', style({ backgroundColor: '#4CAF50' })) // Cambia color
        ]),
        // Luego, en secuencia, vuelve al estado inicial
        animate('200ms ease-out', style({ transform: 'scale(1)', backgroundColor: '#009688' }))
      ])
    ])
  ]
})
export class CustomAnimationComponent {
  bounceState: string = 'start';
  staggerItems: string[] = ['Ítem A', 'Ítem B', 'Ítem C'];
  nextStaggerId: number = 4;
  clickState: string = 'rest';
  clickMessage: string = '';

  bounceBox(): void {
    this.bounceState = this.bounceState === 'start' ? 'end' : 'start';
    // Después de la animación, lo reseteamos para que pueda rebotar de nuevo
    setTimeout(() => this.bounceState = 'start', 1000);
  }

  addStaggerItem(): void {
    this.staggerItems.push(`Ítem ${this.nextStaggerId++}`);
  }

  removeStaggerItem(): void {
    if (this.staggerItems.length > 0) {
      this.staggerItems.pop();
    }
  }

  clickButton(): void {
    this.clickState = 'clicked';
    this.clickMessage = '¡Haz clic! Animación ejecutada.';
    setTimeout(() => {
      this.clickState = 'rest';
      this.clickMessage = '';
    }, 500); // Duración total de la animación del botón
  }
}

// 2. Integración en AppModule (src/app/app.module.ts)
// Asegúrate de que BrowserAnimationsModule esté importado (como en el ejemplo anterior).
// No se requiere ninguna importación adicional en AppModule para este componente standalone.

// src/app/app.component.html (ejemplo de uso)
/*
<app-custom-animation></app-custom-animation>
*/

/*
Un error común al usar `query()` para animaciones de lista es olvidar `optional: true`.
Si tu `query` no encuentra ningún elemento (ej., la lista está vacía), Angular lanzará un error.
`{ optional: true }` le dice a Angular que no hay problema si la consulta no devuelve resultados.

Otro error es usar `group()` o `sequence()` sin un entendimiento claro de cómo se encadenan.
`group()` ejecuta animaciones al mismo tiempo, mientras que `sequence()` las ejecuta una tras otra.
Confundir estos puede llevar a animaciones que no se ven como esperas o que no se sincronizan correctamente.
Practica con ambos para entender su comportamiento.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Angular Material',
    'subtopic': 'Instalación y configuración',
    'definition': r'''
Cuando construyes aplicaciones con Angular, a menudo te encuentras creando los mismos elementos de interfaz de usuario una y otra vez: botones, campos de formulario, tarjetas, menús de navegación, etc. Aquí es donde "Angular Material" entra en juego. Es un conjunto de componentes de UI preconstruidos y de alta calidad que siguen las directrices de Material Design de Google, lo que te permite crear interfaces de usuario atractivas y responsivas de forma rápida y eficiente.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Pensemos por un momento en construir una casa. Puedes empezar desde cero, cortando la madera, mezclando el cemento, y construyendo cada ladrillo. O, puedes usar elementos prefabricados, como ventanas o puertas que ya están hechas y solo necesitas instalar. Angular Material es como usar esos elementos prefabricados para tu interfaz de usuario: te ahorra un montón de tiempo y esfuerzo, y el resultado es consistente y profesional.

Instalar y configurar Angular Material en tu proyecto es relativamente sencillo gracias a Angular CLI. El proceso te guía a través de la adición de los paquetes necesarios, la configuración de temas y tipografía, y la inclusión de animaciones si aún no las tienes.

Los pasos principales para la instalación y configuración son:

* **Usar Angular CLI**: El comando `ng add @angular/material` es la forma más fácil y recomendada. Este comando no solo instala los paquetes NPM, sino que también configura tu proyecto, añadiendo las dependencias necesarias y preguntándote por las opciones iniciales como el tema, la tipografía y el soporte para gestos.
* **Importar módulos de componentes**: Una vez instalado, cada componente de Angular Material (como un botón, un `input` o una tabla) tiene su propio módulo. Debes importar solo los módulos de los componentes que vayas a usar en el módulo donde los necesites (ej., en tu `AppModule` o en un módulo de característica). Esto es importante para mantener tu bundle de aplicación lo más pequeño posible, evitando cargar código que no usarás.
* **Configuración global (opcional)**: Puedes configurar un tema global, la tipografía y si deseas incluir las funcionalidades de los gestos de HammerJS (aunque HammerJS está en desuso en las últimas versiones de Angular Material y se recomienda usar `@angular/cdk/a11y` y `@angular/cdk/overlay` directamente para interacciones).

Usar Angular Material acelera enormemente el desarrollo de la UI, ya que no tienes que preocuparte por escribir CSS y JavaScript desde cero para cada elemento interactivo. Además, al seguir las directrices de Material Design, tus aplicaciones tendrán una apariencia moderna y consistente, lo cual es valorado por empresas como Google, que lo utilizan extensivamente en sus propios productos.
''',
    'code_example': r'''
// --- EJEMPLO: INSTALACIÓN Y CONFIGURACIÓN DE ANGULAR MATERIAL ---

// La instalación se realiza principalmente a través de Angular CLI.

// 1. **Comando de Instalación (Ejecutar en la terminal de tu proyecto Angular)**
// Este comando es interactivo y te hará preguntas sobre el tema, tipografía y animaciones.
/*
ng add @angular/material
*/
// Durante la instalación, Angular CLI hará lo siguiente:
// - Instalará el paquete `@angular/material` y sus dependencias (como `@angular/cdk`).
// - Añadirá `BrowserAnimationsModule` a tu `AppModule` si aún no está.
// - Configurará un tema global en `styles.scss` (o `styles.css`).
// - Configurará la tipografía en `styles.scss`.
// - Opcionalmente, configurará el soporte para gestos (HammerJS).

// 2. Importar módulos de componentes en tu `AppModule` (src/app/app.module.ts)
// Solo importa los módulos de los componentes de Material que vayas a usar.
// En este ejemplo, importamos `MatButtonModule` y `MatCardModule`.

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'; // Asegúrate de que esté aquí
import { AppComponent } from './app.component';

// Importa los módulos de Angular Material que necesites
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar'; // Un ejemplo adicional
import { MaterialDemoComponent } from './material-demo/material-demo.component'; // Tu componente de demo

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    // Importa los módulos de Material Design aquí
    MatButtonModule,
    MatCardModule,
    MatToolbarModule,
    MaterialDemoComponent // Importa tu componente standalone
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 3. Uso de componentes de Material en tu HTML (src/app/material-demo/material-demo.component.ts)
// Una vez que los módulos están importados, puedes usar los componentes de Material
// en tus plantillas como cualquier otro componente de Angular.

import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from '@angular/material/icon'; // Para un icono de ejemplo

@Component({
  selector: 'app-material-demo',
  template: `
    <mat-toolbar color="primary">
      <span>Mi Aplicación Material</span>
      <span class="spacer"></span>
      <button mat-icon-button aria-label="Example icon-button with share icon">
        <mat-icon>share</mat-icon>
      </button>
    </mat-toolbar>

    <div class="material-container">
      <h2>Demostración de Angular Material</h2>

      <mat-card class="example-card">
        <mat-card-header>
          <mat-card-title>Título de la Tarjeta</mat-card-title>
          <mat-card-subtitle>Subtítulo de la Tarjeta</mat-card-subtitle>
        </mat-card-header>
        <mat-card-content>
          <p>
            Este es un ejemplo de una tarjeta de Angular Material.
            Contiene texto y botones.
          </p>
        </mat-card-content>
        <mat-card-actions>
          <button mat-button color="primary">ACCION 1</button>
          <button mat-button color="accent">ACCION 2</button>
        </mat-card-actions>
      </mat-card>

      <div class="button-section">
        <button mat-raised-button color="primary">Botón Primario Elevado</button>
        <button mat-flat-button color="accent">Botón Accent Plano</button>
        <button mat-stroked-button color="warn">Botón Advertencia Bordeado</button>
        <button mat-icon-button aria-label="Example icon-button with a heart icon">
          <mat-icon>favorite</mat-icon>
        </button>
      </div>
    </div>
  `,
  styles: [`
    .material-container { padding: 20px; margin: 20px; text-align: center; }
    .example-card {
      max-width: 400px;
      margin: 20px auto;
    }
    .button-section button {
      margin: 10px;
    }
    .spacer {
      flex: 1 1 auto;
    }
  `],
  standalone: true,
  imports: [
    CommonModule,
    MatButtonModule,
    MatCardModule,
    MatToolbarModule,
    MatIconModule // Asegúrate de importar MatIconModule si usas mat-icon
  ]
})
export class MaterialDemoComponent { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-material-demo></app-material-demo>
*/

/*
Un error común es intentar usar un componente de Angular Material sin haber
importado su módulo correspondiente. Por ejemplo, si intentas usar `<button mat-button>`
sin `MatButtonModule` importado en tu `NgModule`, obtendrás un error de plantilla
diciendo que `mat-button` no es una propiedad conocida de `<button>`. Siempre
verifica la documentación de Angular Material para el componente que quieres usar
y asegúrate de importar su módulo.

Otro error es olvidar ejecutar `ng add @angular/material`. Aunque puedes instalar
los paquetes manualmente, `ng add` se encarga de la configuración inicial
(BrowserAnimationsModule, estilos globales), que es crucial para que los componentes
se vean y funcionen correctamente. Saltar este paso puede llevar a componentes sin estilos
o sin animaciones.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Angular Material',
    'subtopic': 'Componentes preconstruidos',
    'definition': r'''
Una de las mayores ventajas de usar Angular Material es su vasta colección de "componentes preconstruidos". Estos no son solo elementos HTML con algunos estilos; son componentes completamente funcionales, accesibles y optimizados para el rendimiento, que ya implementan los patrones de interfaz de usuario más comunes y complejos.

Pensemos por un momento en un kit de Lego avanzado. No recibes solo piezas básicas, sino también ruedas, figuras, y elementos especializados que te permiten construir modelos complejos mucho más rápido. Los componentes preconstruidos de Angular Material son como esas piezas especializadas: te ahorran el trabajo de construir desde cero elementos como selectores de fecha, tablas de datos, diálogos modales o barras de progreso, los cuales son notoriamente difíciles de implementar correctamente desde el punto de vista de la usabilidad y accesibilidad.

La variedad de componentes que ofrece Angular Material es extensa y cubre casi todas las necesidades de UI que puedas tener en una aplicación web:

* **Controles de Formulario**: `mat-form-field` (para envolver inputs), `mat-input`, `mat-select`, `mat-checkbox`, `mat-radio-button`, `mat-slider`, `mat-slide-toggle`, `mat-datepicker`. Estos vienen con validación, mensajes de error y etiquetas flotantes ya integradas.
* **Botones e Indicadores**: `mat-button`, `mat-fab` (Floating Action Button), `mat-icon-button`, `mat-progress-spinner`, `mat-progress-bar`. Para acciones y retroalimentación visual.
* **Navegación**: `mat-toolbar`, `mat-sidenav` (barra lateral), `mat-menu`, `mat-tab-group` (pestañas). Elementos esenciales para la estructura de tu aplicación.
* **Layout y Estructura**: `mat-card`, `mat-divider`, `mat-expansion-panel`, `mat-grid-list`. Para organizar el contenido de manera efectiva.
* **Data Table**: `mat-table` es un componente muy potente que te permite mostrar datos tabulares con funcionalidades como paginación, ordenación, filtrado y selección, todo listo para usar.
* **Popups y Modales**: `mat-dialog` (cuadros de diálogo), `mat-tooltip` (consejos de herramientas), `mat-snackbar` (mensajes temporales).

Cada uno de estos componentes no solo se adhiere a las directrices de Material Design, sino que también tiene soporte integrado para la accesibilidad (ARIA) y las animaciones, lo que reduce drásticamente el tiempo de desarrollo y los errores. Por ejemplo, el equipo de Gmail utiliza componentes que siguen estas directrices para asegurar una experiencia de usuario consistente y accesible en todos sus productos.
''',
    'code_example': r'''
// --- EJEMPLO: COMPONENTES PRECONSTRUIDOS DE ANGULAR MATERIAL ---

// Para usar estos componentes, recuerda importar sus módulos correspondientes
// en tu `NgModule` (generalmente en `AppModule` o un módulo de característica).

// 1. Componente de demostración (src/app/material-components-demo/material-components-demo.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

// Importa los módulos de los componentes de Material que vas a usar
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatRadioModule } from '@angular/material/radio';
import { MatSelectModule } from '@angular/material/select';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core'; // Necesario para MatDatepicker
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDialog, MatDialogModule } from '@angular/material/dialog'; // Para el diálogo
import { MatIconModule } from '@angular/material/icon'; // Para iconos


// Ejemplo de un diálogo que se abre
@Component({
  selector: 'app-dialog-content',
  template: `
    <h2 mat-dialog-title>¡Hola desde el Diálogo!</h2>
    <mat-dialog-content>
      <p>Este es un ejemplo de un diálogo de Angular Material.</p>
    </mat-dialog-content>
    <mat-dialog-actions align="end">
      <button mat-button mat-dialog-close>Cerrar</button>
    </mat-dialog-actions>
  `,
  standalone: true,
  imports: [MatDialogModule, MatButtonModule] // Importa aquí también si es standalone
})
export class DialogContentComponent {}


// Datos de ejemplo para la tabla
export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
  {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He'},
  {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li'},
  {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be'},
  {position: 5, name: 'Boron', weight: 10.811, symbol: 'B'},
];


@Component({
  selector: 'app-material-components-demo',
  template: `
    <div class="components-container">
      <h2>Demostración de Componentes Preconstruidos</h2>

      <h3>Formularios:</h3>
      <mat-form-field appearance="fill">
        <mat-label>Nombre</mat-label>
        <input matInput placeholder="Ej. Juan Pérez">
      </mat-form-field>

      <mat-form-field appearance="outline">
        <mat-label>Email</mat-label>
        <input matInput type="email" placeholder="ejemplo@dominio.com">
        <mat-icon matSuffix>email</mat-icon>
        <mat-hint>Ingrese su correo electrónico</mat-hint>
      </mat-form-field>

      <mat-checkbox>Acepto términos y condiciones</mat-checkbox>

      <mat-radio-group aria-label="Seleccionar opción">
        <mat-radio-button value="1">Opción A</mat-radio-button>
        <mat-radio-button value="2">Opción B</mat-radio-button>
      </mat-radio-group>

      <mat-form-field>
        <mat-label>Fruta favorita</mat-label>
        <mat-select>
          <mat-option value="apple">Manzana</mat-option>
          <mat-option value="banana">Plátano</mat-option>
          <mat-option value="orange">Naranja</mat-option>
        </mat-select>
      </mat-form-field>

      <mat-form-field appearance="fill">
        <mat-label>Elegir una fecha</mat-label>
        <input matInput [matDatepicker]="picker">
        <mat-hint>MM/DD/YYYY</mat-hint>
        <mat-datepicker-toggle matIconSuffix [for]="picker"></mat-datepicker-toggle>
        <mat-datepicker #picker></mat-datepicker>
      </mat-form-field>

      <h3>Data Table:</h3>
      <table mat-table [dataSource]="dataSource" matSort class="mat-elevation-z8">

        <ng-container matColumnDef="position">
          <th mat-header-cell *matHeaderCellDef mat-sort-header> No. </th>
          <td mat-cell *matCellDef="let element"> {{element.position}} </td>
        </ng-container>

        <ng-container matColumnDef="name">
          <th mat-header-cell *matHeaderCellDef mat-sort-header> Nombre </th>
          <td mat-cell *matCellDef="let element"> {{element.name}} </td>
        </ng-container>

        <ng-container matColumnDef="weight">
          <th mat-header-cell *matHeaderCellDef mat-sort-header> Peso </th>
          <td mat-cell *matCellDef="let element"> {{element.weight}} </td>
        </ng-container>

        <ng-container matColumnDef="symbol">
          <th mat-header-cell *matHeaderCellDef mat-sort-header> Símbolo </th>
          <td mat-cell *matCellDef="let element"> {{element.symbol}} </td>
        </ng-container>

        <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>
        <tr mat-row *matRowDef="let row; columns: displayedColumns;"></tr>
      </table>

      <mat-paginator [pageSizeOptions]="[5, 10, 20]" showFirstLastButtons></mat-paginator>

      <h3>Diálogos y Notificaciones:</h3>
      <button mat-raised-button (click)="openDialog()">Abrir Diálogo</button>
      <button mat-raised-button (click)="openSnackBar()">Mostrar Snackbar</button>

    </div>
  `,
  styles: [`
    .components-container {
      padding: 20px;
      margin: 20px;
      border: 1px solid #1A237E;
      text-align: center;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    mat-form-field, mat-checkbox, mat-radio-group, mat-select {
      margin: 10px;
      width: 300px;
    }
    .mat-radio-button {
      margin-right: 15px;
    }
    table {
      width: 80%;
      margin: 20px 0;
    }
    button {
      margin: 10px;
    }
  `],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatCheckboxModule,
    MatRadioModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule, // Importar para que el datepicker funcione
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatSnackBarModule,
    MatDialogModule,
    MatIconModule,
  ]
})
export class MaterialComponentsDemoComponent implements OnInit {
  displayedColumns: string[] = ['position', 'name', 'weight', 'symbol'];
  dataSource = ELEMENT_DATA; // En un caso real, esto sería de un servicio o input

  constructor(private _snackBar: MatSnackBar, private dialog: MatDialog) { }

  ngOnInit(): void {
    // Aquí podrías configurar el paginador y el sort para la tabla
    // Para un ejemplo completo, necesitarías @ViewChild para MatPaginator y MatSort
  }

  openSnackBar(): void {
    this._snackBar.open('¡Mensaje de Snackbar!', 'Cerrar', {
      duration: 3000,
      horizontalPosition: 'end',
      verticalPosition: 'top',
    });
  }

  openDialog(): void {
    this.dialog.open(DialogContentComponent);
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-material-components-demo></app-material-components-demo>
*/

/*
Un error común es importar `MatDatepickerModule` sin `MatNativeDateModule` (o un adaptador similar).
`MatDatepickerModule` proporciona el componente visual del selector de fechas, pero necesita
un módulo adaptador para saber cómo interpretar y formatear las fechas nativas de JavaScript.
Si olvidas `MatNativeDateModule`, tu datepicker no funcionará o mostrará errores en la consola.

Otro error, al usar `mat-table`, es no configurar `matSort` o `matPaginator` programáticamente
en el componente TypeScript. Aunque los atributos se añaden al HTML, necesitas enlazar
la tabla con instancias de `MatPaginator` y `MatSort` obtenidas con `@ViewChild` en tu
componente para que la funcionalidad de ordenación y paginación funcione realmente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Angular Material',
    'subtopic': 'Temas y personalización',
    'definition': r'''
Aunque los componentes preconstruidos de Angular Material son excelentes, rara vez querrás que tu aplicación se vea exactamente igual que todas las demás. Aquí es donde la capacidad de "temas y personalización" se vuelve fundamental. Te permite adaptar la apariencia de los componentes de Material Design para que coincidan con la identidad visual de tu marca o los requisitos de diseño de tu proyecto.

Pensemos por un momento en una tienda de ropa que vende camisetas básicas. Son buenas, pero si quieres algo con tu propio estilo, necesitas personalizarlas con un estampado, un color específico o un tipo de cuello diferente. Angular Material te da esas "camisetas básicas" (los componentes), y las herramientas de tematización son las que te permiten estamparles tu propio diseño, cambiar los colores y hacerlas únicas.

La tematización en Angular Material se basa en la idea de definir un tema completo que se aplica a todos los componentes de tu aplicación. Este tema se define principalmente a través de un archivo SCSS (Sass), lo que te da un control muy granular sobre los colores, la tipografía y la densidad de los componentes.

Los aspectos clave de temas y personalización son:

* **Temas Prediseñados**: Angular Material viene con varios temas predefinidos (como `deeppurple-amber`, `indigo-pink`, `pink-bluegrey`, `purple-green`). Puedes elegir uno de estos durante la instalación con `ng add @angular/material`.
* **Creación de Temas Personalizados**: Lo más común es crear tu propio tema. Esto se hace definiendo un mapa de Sass que incluye:
    * **Paletas de Colores**: Una paleta `primary` (color principal de tu marca), una `accent` (color secundario para acciones), y una `warn` (para errores o advertencias). Cada paleta se genera a partir de un color base y crea un rango de tonos más claros y oscuros.
    * **Tipografía**: Define las fuentes, tamaños y pesos para diferentes elementos de texto (encabezados, cuerpo, botones, etc.).
    * **Densidad**: Permite ajustar el espaciado y el tamaño de los componentes para hacerlos más compactos o más grandes.
* **Inclusión del Tema**: Una vez que has definido tu tema SCSS, debes importarlo en tu archivo global de estilos (`styles.scss`) de Angular.
* **Anulación de Estilos de Componentes**: Si necesitas cambiar un estilo específico de un componente que no está cubierto por el sistema de temas (por ejemplo, el padding interno de un `mat-card`), puedes usar el `::ng-deep` (aunque es menos recomendado y su uso está desaconsejado en favor de `::part` o `:host-context` o estilos basados en clases) o simplemente aplicar estilos más específicos en tu CSS/SCSS. Angular Material también expone variables CSS que puedes sobreescribir.

La personalización de temas es esencial para que tu aplicación se sienta como una extensión de tu marca, en lugar de una plantilla genérica. Permite que, por ejemplo, una empresa como Airbnb adapte los componentes de UI a su identidad visual única, aunque internamente puedan estar utilizando un framework de componentes similar.
''',
    'code_example': r'''
// --- EJEMPLO: TEMAS Y PERSONALIZACIÓN EN ANGULAR MATERIAL ---

// La tematización se realiza principalmente en archivos SCSS.

// 1. **Archivo global de estilos (src/styles.scss)**
// Este es el archivo principal donde se define y se importa tu tema de Angular Material.

@use '@angular/material' as mat;

// Define tu esquema de color (opcional, pero buena práctica)
// Puedes crear múltiples esquemas y cambiar entre ellos si tienes modo claro/oscuro.
$my-app-light-theme-primary: mat.define-palette(mat.$indigo-palette, 500, 700, 900);
$my-app-light-theme-accent: mat.define-palette(mat.$pink-palette, A200, A100, A400);
$my-app-light-theme-warn: mat.define-palette(mat.$red-palette);

// Crea el objeto del tema claro
$my-app-light-theme: mat.define-light-theme((
  color: (
    primary: $my-app-light-theme-primary,
    accent: $my-app-light-theme-accent,
    warn: $my-app-light-theme-warn,
  ),
  typography: mat.define-typography-config(), // Usa la tipografía por defecto o define la tuya
  density: 0, // 0 es la densidad por defecto. Puedes usar -1, -2, -3 para más compacto, o 1, 2, 3 para más espaciado.
));

// Incluye los estilos de Material para el tema claro
@include mat.all-component-themes($my-app-light-theme);

// --- OPCIONAL: Tema oscuro ---
$my-app-dark-theme-primary: mat.define-palette(mat.$blue-grey-palette, 700, 500, 900);
$my-app-dark-theme-accent: mat.define-palette(mat.$amber-palette, A200, A100, A400);
$my-app-dark-theme-warn: mat.define-palette(mat.$red-palette);

$my-app-dark-theme: mat.define-dark-theme((
  color: (
    primary: $my-app-dark-theme-primary,
    accent: $my-app-dark-theme-accent,
    warn: $my-app-dark-theme-warn,
  ),
  typography: mat.define-typography-config(),
  density: 0,
));

// Puedes aplicar el tema oscuro condicionalmente, por ejemplo, si el body tiene una clase 'dark-theme'
.dark-theme {
  @include mat.all-component-themes($my-app-dark-theme);
}

// --- Personalización adicional o anulación de estilos (con precaución) ---

// Esto anularía el padding de todas las tarjetas Material.
// Usa `::ng-deep` con precaución, ya que puede tener efectos secundarios globales.
// Es mejor usar `:host-context` o clases CSS si es posible.
/*
:host-context(.my-custom-theme) {
  .mat-card {
    padding: 10px !important;
  }
}
*/

// O directamente con un selector más específico si es posible
// (ej. si el componente tiene una clase CSS personalizada)
/*
.my-custom-card .mat-card-content {
  font-size: 0.9em;
  color: #555;
}
*/


// 2. Componente de demostración de temas (src/app/theme-demo/theme-demo.component.ts)
// No hay mucho código específico de Angular en TypeScript para la tematización,
// ya que es principalmente SCSS. Este componente solo demostrará el efecto.

import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSlideToggleModule } from '@angular/material/slide-toggle'; // Para cambiar de tema

@Component({
  selector: 'app-theme-demo',
  template: `
    <mat-toolbar color="primary">
      <span>Demo de Temas Material</span>
      <span class="spacer"></span>
      <mat-slide-toggle [checked]="isDarkTheme" (change)="toggleTheme()">
        Tema Oscuro
      </mat-slide-toggle>
    </mat-toolbar>

    <div class="theme-container">
      <h2>Mi Aplicación con Tema Personalizado</h2>

      <mat-card class="example-card">
        <mat-card-header>
          <mat-card-title>Tarjeta de Ejemplo</mat-card-title>
          <mat-card-subtitle>Con colores de mi tema</mat-card-subtitle>
        </mat-card-header>
        <mat-card-content>
          <p>
            Esta tarjeta y los botones inferiores deberían reflejar los colores
            definidos en el tema de `styles.scss` (y cambiar si alternas el tema oscuro).
          </p>
        </mat-card-content>
        <mat-card-actions>
          <button mat-raised-button color="primary">Botón Primario</button>
          <button mat-flat-button color="accent">Botón Accent</button>
        </mat-card-actions>
      </mat-card>

      <button mat-stroked-button color="warn">Botón de Advertencia</button>
    </div>
  `,
  styles: [`
    .theme-container { padding: 20px; margin: 20px; text-align: center; }
    .example-card { max-width: 400px; margin: 20px auto; }
    button { margin: 10px; }
    .spacer { flex: 1 1 auto; }
  `],
  standalone: true,
  imports: [
    CommonModule,
    MatButtonModule,
    MatCardModule,
    MatToolbarModule,
    MatSlideToggleModule,
  ]
})
export class ThemeDemoComponent {
  isDarkTheme: boolean = false;

  constructor() {
    // Inicializa el tema basándose en la presencia de la clase 'dark-theme' en el body
    this.isDarkTheme = document.body.classList.contains('dark-theme');
  }

  toggleTheme(): void {
    this.isDarkTheme = !this.isDarkTheme;
    if (this.isDarkTheme) {
      document.body.classList.add('dark-theme');
    } else {
      document.body.classList.remove('dark-theme');
    }
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
// Asegúrate de que BrowserAnimationsModule esté importado.
// Asegúrate de que los módulos de Material usados por ThemeDemoComponent estén importados aquí.

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { ThemeDemoComponent } from './theme-demo/theme-demo.component';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSlideToggleModule } from '@angular/material/slide-toggle'; // Para el toggle de tema

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    ThemeDemoComponent, // Importar componente standalone
    // Módulos de Material que utiliza ThemeDemoComponent
    MatButtonModule,
    MatCardModule,
    MatToolbarModule,
    MatSlideToggleModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-theme-demo></app-theme-demo>
*/

/*
Un error común es intentar cambiar los colores de los componentes de Material
simplemente sobreescribiendo sus estilos CSS directos en un archivo `.css` sin usar Sass
ni las funciones de temas de Material. Esto puede ser muy frágil, ya que Material Design
usa una estructura de clases compleja y variables CSS. La forma recomendada es
siempre definir tus paletas y tu tema usando las funciones de Sass de Material.

Otro error es olvidar importar el archivo `styles.scss` principal en tu `angular.json`
o no incluir `@use '@angular/material' as mat;` al principio de tu archivo de tema.
Sin esto, las funciones de tematización de Material Sass no estarán disponibles
y tu tema personalizado no se aplicará correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Componentes Personalizados',
    'subtopic': 'Creación de componentes reutilizables',
    'definition': r'''
En el mundo del desarrollo de software, y especialmente en frameworks como Angular, el concepto de "componentes reutilizables" es fundamental. Básicamente, se trata de construir piezas de interfaz de usuario (UI) que encapsulan su propia lógica y apariencia, de modo que puedas usarlas en diferentes partes de tu aplicación, e incluso en distintas aplicaciones, sin tener que reescribir el código.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un sistema de construcción con bloques. No querrías tener que fabricar cada ladrillo y ventana para cada casa que construyes. En su lugar, usas bloques prefabricados (ladrillos, ventanas, puertas) que puedes ensamblar de diferentes maneras para crear estructuras únicas. De manera similar, los componentes reutilizables en Angular son esos "bloques prefabricados": te permiten construir interfaces de usuario complejas de forma más rápida, mantener la consistencia visual y de comportamiento, y facilitar el mantenimiento de tu código. Si algo cambia en el diseño de un botón, solo lo actualizas en un lugar y se refleja en toda tu aplicación.

Crear un componente reutilizable implica pensar en él como una unidad independiente con una API bien definida. Esto significa que debe tener:

* **Propósito Claro**: Debe hacer una cosa y hacerla bien. Por ejemplo, un componente para mostrar un perfil de usuario, un botón con icono, o una tarjeta de producto.
* **Encapsulamiento**: Debe contener su propio HTML (plantilla), CSS (estilos) y TypeScript (lógica), aislándose de otros componentes para evitar conflictos.
* **Entradas (`@Input`) y Salidas (`@Output`)**: Estas son las "puertas" a través de las cuales el componente se comunica con su entorno. Las `@Input` permiten que el componente padre le pase datos, y los `@Output` (eventos) permiten que el componente hijo notifique al padre sobre algo que ha sucedido.
* **Independencia de Datos y Lógica del Padre**: Un buen componente reutilizable no debería depender de la estructura de datos específica de un componente padre, sino de un contrato genérico. Por ejemplo, en lugar de esperar un objeto `usuarioComplejo`, podría esperar `nombre: string`, `apellido: string`, `urlImagen: string`.

Un gran ejemplo de esto es cómo las grandes empresas de tecnología, como Facebook o Google, diseñan sus interfaces. Han creado vastas bibliotecas de componentes internos (como el Material Design de Google o el sistema de diseño de Facebook) que sus equipos usan para construir sus productos. Esto asegura que la experiencia del usuario sea consistente en todas sus aplicaciones y acelera enormemente el desarrollo.
''',
    'code_example': r'''
// --- EJEMPLO: CREACIÓN DE COMPONENTES REUTILIZABLES ---

// 1. Crear el componente reutilizable (src/app/shared/user-card/user-card.component.ts)
// Se recomienda crear una carpeta `shared` para componentes que serán usados en múltiples lugares.

import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card'; // Opcional: si usas Material Design
import { MatButtonModule } from '@angular/material/button'; // Opcional: si usas Material Design

@Component({
  selector: 'app-user-card', // El selector es cómo usarás este componente en el HTML
  template: `
    <mat-card class="user-card" [ngClass]="{ 'is-active': isActive }">
      <mat-card-header>
        <div mat-card-avatar class="user-avatar" [style.background-image]="'url(' + user.avatarUrl + ')'"></div>
        <mat-card-title>{{ user.firstName }} {{ user.lastName }}</mat-card-title>
        <mat-card-subtitle>{{ user.email }}</mat-card-subtitle>
      </mat-card-header>
      <mat-card-content>
        <p><strong>Rol:</strong> {{ user.role }}</p>
        <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
      </mat-card-content>
      <mat-card-actions>
        <button mat-button color="primary" (click)="viewDetails()">Ver Detalles</button>
        <button mat-button color="accent" (click)="editUser()">Editar</button>
      </mat-card-actions>
    </mat-card>
  `,
  styles: [`
    .user-card {
      width: 300px;
      margin: 20px;
      display: inline-block;
      vertical-align: top;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: box-shadow 0.3s ease-in-out;
    }
    .user-card:hover {
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .user-avatar {
      background-size: cover;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      margin-right: 16px;
    }
    .is-active {
      border: 2px solid #4CAF50;
    }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule]
})
export class UserCardComponent {
  // @Input para recibir datos del componente padre
  @Input() user: {
    id: number;
    firstName: string;
    lastName: string;
    email: string;
    role: string;
    avatarUrl: string;
    bio?: string; // Opcional
  } = { id: 0, firstName: '', lastName: '', email: '', role: '', avatarUrl: '' };

  @Input() isActive: boolean = false; // Otro input para el estado activo

  // @Output para emitir eventos al componente padre
  @Output() detailsClicked = new EventEmitter<number>();
  @Output() editClicked = new EventEmitter<number>();

  viewDetails(): void {
    this.detailsClicked.emit(this.user.id);
  }

  editUser(): void {
    this.editClicked.emit(this.user.id);
  }
}


// 2. Uso del componente reutilizable en un componente padre (src/app/app.component.ts o un componente de lista)
import { Component } from '@angular/core';
import { UserCardComponent } from './shared/user-card/user-card.component'; // Importar el componente reutilizable
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  template: `
    <div class="app-container">
      <h1>Lista de Usuarios</h1>
      <div class="user-list">
        <app-user-card
          *ngFor="let user of users"
          [user]="user"
          [isActive]="user.id === activeUserId"
          (detailsClicked)="handleDetailsClick($event)"
          (editClicked)="handleEditClick($event)"
        ></app-user-card>
      </div>

      <div *ngIf="selectedUserId" class="selection-info">
        <p>Usuario seleccionado para detalles: ID {{ selectedUserId }}</p>
        <p>Último usuario editado: ID {{ editedUserId || 'Ninguno' }}</p>
      </div>
    </div>
  `,
  styles: [`
    .app-container { text-align: center; padding: 20px; }
    .user-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
    }
    .selection-info {
      margin-top: 30px;
      padding: 15px;
      border: 1px solid #ccc;
      background-color: #f9f9f9;
      border-radius: 8px;
    }
  `],
  standalone: true,
  imports: [CommonModule, UserCardComponent] // Importar el componente reutilizable aquí
})
export class AppComponent {
  title = 'angular-reusable-components-demo';

  users = [
    {
      id: 1,
      firstName: 'Alice',
      lastName: 'Smith',
      email: 'alice@example.com',
      role: 'Administrador',
      avatarUrl: 'https://via.placeholder.com/150/FF5733/FFFFFF?text=A'
    },
    {
      id: 2,
      firstName: 'Bob',
      lastName: 'Johnson',
      email: 'bob@example.com',
      role: 'Editor',
      avatarUrl: 'https://via.placeholder.com/150/33FF57/FFFFFF?text=B',
      bio: 'Entusiasta del desarrollo web y la música.'
    },
    {
      id: 3,
      firstName: 'Charlie',
      lastName: 'Brown',
      email: 'charlie@example.com',
      role: 'Lector',
      avatarUrl: 'https://via.placeholder.com/150/3357FF/FFFFFF?text=C'
    }
  ];

  selectedUserId: number | null = null;
  editedUserId: number | null = null;
  activeUserId: number = 2; // Para demostrar el input isActive

  handleDetailsClick(userId: number): void {
    console.log(`Detalles del usuario con ID: ${userId}`);
    this.selectedUserId = userId;
  }

  handleEditClick(userId: number): void {
    console.log(`Editar usuario con ID: ${userId}`);
    this.editedUserId = userId;
  }
}

// 3. Integración en AppModule (src/app/app.module.ts)
// Si `AppComponent` y `UserCardComponent` son standalone, solo necesitas importarlos en `AppModule`.
// Si no son standalone, UserCardComponent debería ser declarado en un `NgModule` y luego importado donde se use.
/*
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { UserCardComponent } from './shared/user-card/user-card.component'; // No necesario si es standalone e importado en AppComponent

@NgModule({
  declarations: [
    AppComponent,
    // Si UserCardComponent NO es standalone, debería declararse aquí
    // UserCardComponent
  ],
  imports: [
    BrowserModule,
    // Si UserCardComponent NO es standalone, y se usa en otro módulo, ese módulo lo importaría.
    // CommonModule // Necesario para *ngIf, *ngFor
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
*/

/*
Un error común al crear componentes reutilizables es acoplarlo demasiado a la lógica
o estructura de datos de un componente padre específico. Esto reduce drásticamente
su reutilizabilidad. Por ejemplo, si tu `UserCardComponent` esperara un objeto `data`
que solo existe en un tipo de respuesta de API, no podrías usarlo fácilmente en otro
contexto. Intenta que tus `@Input` sean lo más genéricos y atómicos posible (ej., `firstName: string`
en lugar de `user: any` si solo necesitas el nombre).

Otro error es no usar `@Output` para notificar al padre sobre eventos internos.
A veces, se intenta modificar directamente el estado del padre desde el hijo,
lo cual rompe el flujo de datos unidireccional de Angular y es una mala práctica.
Siempre que un componente hijo necesite comunicar un cambio al padre,
debe emitir un evento a través de un `@Output`.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Componentes Personalizados',
    'subtopic': 'Encapsulamiento de estilos',
    'definition': r'''
Cuando trabajamos con componentes en Angular, es vital que los estilos CSS de un componente no afecten accidentalmente a otros componentes. Aquí es donde el "encapsulamiento de estilos" juega un papel crucial. Es una característica que asegura que los estilos que defines para un componente específico solo se apliquen a ese componente, y no "se escapen" e influyan en el resto de la aplicación.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un barrio donde cada casa puede pintar sus paredes sin que el color se esparza a la casa del vecino. El encapsulamiento de estilos es como la valla invisible que asegura que los estilos de tu componente se queden dentro de sus límites. Si no existiera, cambiar el color de un botón en un componente podría, por accidente, cambiar el color de *todos* los botones en tu aplicación, lo cual sería un caos y haría el mantenimiento casi imposible.

Angular logra esto utilizando el concepto de "emulación de Shadow DOM". Cuando defines estilos dentro de un archivo `.scss` o `.css` de un componente (ej., `mi-componente.component.css`), Angular los procesa y los hace específicos para ese componente. Esto lo hace de varias maneras, dependiendo del modo de encapsulamiento que uses:

* **ViewEncapsulation.Emulated (Por defecto)**: Este es el modo más común y el que Angular usa por defecto. Angular añade atributos únicos a las clases CSS y a los elementos HTML de tu componente. Por ejemplo, un estilo `.my-button` en un componente podría convertirse en `.my-button[_ngcontent-c1]` y el elemento HTML tendrá el atributo `_ngcontent-c1`. Esto asegura que el estilo solo coincida con los elementos de ese componente.
* **ViewEncapsulation.ShadowDom**: Si el navegador soporta nativamente Shadow DOM, Angular puede usarlo para encapsular los estilos de forma real. Esto crea un "árbol DOM oculto" dentro del componente, donde los estilos están completamente aislados y no pueden filtrarse ni ser afectados por estilos externos.
* **ViewEncapsulation.None**: Este modo desactiva completamente el encapsulamiento de estilos. Los estilos definidos en el componente se vuelven globales, lo que significa que afectarán a todos los elementos que coincidan con el selector en toda la aplicación. Se usa muy rara vez y con extrema precaución, generalmente para estilos globales que no pueden inyectarse de otra manera.

El encapsulamiento de estilos es una piedra angular de la arquitectura de componentes de Angular, ya que permite a los desarrolladores trabajar en la apariencia de sus componentes sin preocuparse por los efectos secundarios no deseados en otras partes de la aplicación. Esto es crucial en proyectos grandes donde múltiples equipos trabajan en diferentes componentes simultáneamente, manteniendo la coherencia y evitando conflictos.
''',
    'code_example': r'''
// --- EJEMPLO: ENCAPSULAMIENTO DE ESTILOS ---

// El encapsulamiento de estilos es un comportamiento por defecto en Angular,
// pero podemos demostrar cómo funciona y cómo configurarlo.

// 1. Componente con estilos encapsulados (src/app/style-encapsulation-demo/style-encapsulation-demo.component.ts)
import { Component, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-style-encapsulation-demo',
  template: `
    <div class="component-container">
      <h2>Componente con Estilos Encapsulados (Emulated - por defecto)</h2>
      <p class="component-text">Este texto tiene estilos definidos en el CSS de este componente.</p>
      <button class="component-button">Botón del Componente</button>

      <p class="note">
        Inspecciona este componente con las herramientas de desarrollo del navegador.
        Verás atributos como <code>_ngcontent-cX</code> añadidos a los elementos y clases CSS,
        lo que asegura que los estilos son únicos para este componente.
      </p>
    </div>
  `,
  styles: [`
    /* Este estilo solo afecta a este componente */
    .component-container {
      border: 2px solid #3F51B5;
      padding: 20px;
      margin: 20px;
      background-color: #E8EAF6;
    }
    .component-text {
      color: #303F9F;
      font-size: 1.1em;
      font-weight: bold;
    }
    .component-button {
      background-color: #3F51B5;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 15px;
    }
  `],
  // ViewEncapsulation.Emulated es el valor por defecto, no es necesario declararlo explícitamente.
  // Pero lo podemos hacer para que veas que existe:
  // encapsulation: ViewEncapsulation.Emulated,
  standalone: true,
  imports: [CommonModule]
})
export class StyleEncapsulationDemoComponent { }


// 2. Componente con encapsulamiento `None` (usar con EXTREMA precaución)
// (src/app/global-style-demo/global-style-demo.component.ts)
// NO uses esto en producción a menos que sea estrictamente necesario y sepas lo que haces.

import { Component, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-global-style-demo',
  template: `
    <div class="global-container">
      <h2>Componente con Estilos GLOBALES (ViewEncapsulation.None)</h2>
      <p class="global-text">¡ATENCIÓN! Este texto podría afectar a otros componentes con la clase `global-text`.</p>
      <button class="global-button">Botón Global</button>

      <p class="note">
        Los estilos de este componente NO están encapsulados.
        Si otro componente usa <code>.global-text</code> o <code>.global-button</code>,
        será afectado por los estilos definidos aquí.
      </p>
    </div>
  `,
  styles: [`
    /* ¡Estos estilos son globales! Podrían sobrescribir estilos de otros componentes. */
    .global-container {
      border: 2px solid #D32F2F;
      padding: 20px;
      margin: 20px;
      background-color: #FFCDD2;
    }
    .global-text {
      color: #C62828; /* Este color podría aparecer en cualquier `p` con clase `global-text` */
      font-size: 1.2em;
      text-transform: uppercase;
    }
    .global-button {
      background-color: #D32F2F;
      color: white;
      padding: 12px 25px;
      border: 2px dashed #B71C1C;
      border-radius: 8px;
      cursor: pointer;
      margin-top: 15px;
      font-weight: bold;
    }
  `],
  encapsulation: ViewEncapsulation.None, // <-- ¡Aquí se desactiva el encapsulamiento!
  standalone: true,
  imports: [CommonModule]
})
export class GlobalStyleDemoComponent { }


// 3. Componente Padre (src/app/app.component.ts) para demostrar la interacción
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StyleEncapsulationDemoComponent } from './style-encapsulation-demo/style-encapsulation-demo.component';
import { GlobalStyleDemoComponent } from './global-style-demo/global-style-demo.component';

@Component({
  selector: 'app-root',
  template: `
    <div class="app-root-container">
      <h1>Demostración de Encapsulamiento de Estilos</h1>

      <p class="global-text">Este es un texto global que *podría* ser afectado si hay un componente con ViewEncapsulation.None.</p>
      <button class="global-button">Botón Global (Root)</button>

      <app-style-encapsulation-demo></app-style-encapsulation-demo>
      <app-global-style-demo></app-global-style-demo>

      <p class="note">
        Observa cómo el texto y el botón con la clase <code>global-text</code> y <code>global-button</code>
        fuera de los componentes son afectados por el `GlobalStyleDemoComponent` si su encapsulamiento es `None`.
        Los estilos del `StyleEncapsulationDemoComponent` no "salen" de su contenedor.
      </p>
    </div>
  `,
  styles: [`
    .app-root-container { text-align: center; padding: 20px; }
    .global-text {
      color: green; /* Este debería ser sobreescrito por GlobalStyleDemoComponent si encapsulation: None */
      font-size: 1em;
    }
    .global-button {
      background-color: grey;
      color: white;
      padding: 8px 15px;
      border: none;
      border-radius: 3px;
    }
    .note { margin-top: 30px; font-style: italic; color: #666; }
  `],
  standalone: true,
  imports: [
    CommonModule,
    StyleEncapsulationDemoComponent,
    GlobalStyleDemoComponent
  ]
})
export class AppComponent { }

// 4. Integración en AppModule (src/app/app.module.ts)
// Asegúrate de importar los componentes standalone en el módulo que los usa.
/*
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { StyleEncapsulationDemoComponent } from './style-encapsulation-demo/style-encapsulation-demo.component';
import { GlobalStyleDemoComponent } from './global-style-demo/global-style-demo.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    StyleEncapsulationDemoComponent, // Importar componente standalone
    GlobalStyleDemoComponent // Importar componente standalone
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
*/

/*
Un error común es intentar sobreescribir estilos de un componente hijo o de una librería
como Angular Material utilizando selectores CSS estándar desde el componente padre, y
luego frustrarse porque no funcionan. Esto se debe al encapsulamiento.
Para estilos muy específicos que no puedes personalizar con las propiedades de los componentes,
a veces necesitarás usar `::ng-deep` (aunque es desaconsejado) o estilos globales (ViewEncapsulation.None,
que es una mala práctica), o las nuevas funciones de CSS como `:host-context()` o `::part()`.
Siempre es mejor personalizar a través de las APIs de los componentes o el sistema de temas.

Otro error es usar `ViewEncapsulation.None` sin entender completamente sus implicaciones.
Esto esencialmente convierte los estilos de ese componente en estilos globales, lo que puede
llevar a conflictos de CSS muy difíciles de depurar en aplicaciones grandes.
Siempre es preferible confiar en el encapsulamiento por defecto de Angular.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Componentes Personalizados',
    'subtopic': 'Comunicación entre componentes',
    'definition': r'''
Una vez que tienes componentes individuales con sus propios estilos y lógica, surge la necesidad de que interactúen entre sí. La "comunicación entre componentes" es el mecanismo fundamental en Angular que permite que diferentes partes de tu aplicación se hablen, pasen datos y reaccionen a eventos. Es como la red de carreteras y teléfonos que conecta diferentes ciudades (tus componentes) en un país (tu aplicación).

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una línea de montaje en una fábrica. Cada estación (componente) hace una tarea específica, pero necesita información de la estación anterior o necesita enviar un producto a la siguiente. Si no hubiera comunicación, la línea se detendría. De la misma manera, en una aplicación Angular, un componente que muestra una lista de productos necesita saber cuándo se selecciona uno, y un componente que muestra los detalles de un producto necesita recibir el ID de ese producto para mostrar su información. Sin una comunicación clara, tu aplicación no podría funcionar como un todo coherente.

Angular ofrece varias formas de lograr esta comunicación, adecuadas para diferentes escenarios:

1.  **`@Input()` (Comunicación Padre a Hijo)**:
    * Esta es la forma más común de pasar datos de un componente padre a un componente hijo.
    * Un `@Input()` es un decorador que marca una propiedad en el componente hijo como una propiedad de entrada. El componente padre puede entonces enlazar datos a esa propiedad usando la sintaxis de enlace de propiedades (`[propiedadDelHijo]="datoDelPadre"`).
    * Es como darle instrucciones a un robot (componente hijo) sobre qué hacer.

2.  **`@Output()` y `EventEmitter` (Comunicación Hijo a Padre)**:
    * Cuando un componente hijo necesita notificar a su componente padre sobre un evento (ej., un clic de botón, un cambio en un formulario), utiliza `@Output()` junto con `EventEmitter`.
    * El `@Output()` es una propiedad en el componente hijo que emite eventos. El componente padre escucha estos eventos usando la sintaxis de enlace de eventos (`(eventoDelHijo)="manejadorEnElPadre($event)"`).
    * Es como un robot (componente hijo) enviando una señal a su operador (componente padre) de que ha terminado una tarea o necesita algo.

3.  **Servicios Compartidos (Comunicación entre Componentes no relacionados)**:
    * Para componentes que no tienen una relación directa padre-hijo (hermanos, componentes en diferentes ramas del árbol, o componentes que necesitan compartir datos globales), puedes usar un servicio.
    * Un servicio es una clase Singleton (una única instancia para toda la aplicación si se provee en el módulo raíz) que puede contener datos o lógica. Los componentes inyectan este servicio y pueden compartir datos o notificar cambios a través de Observables (como `Subject` o `BehaviorSubject`).
    * Es como una pizarra centralizada o un sistema de radio donde diferentes partes pueden publicar y suscribirse a mensajes o datos.

4.  **`@ViewChild()` / `@ViewChildren()` (Acceso del Padre al Hijo)**:
    * Menos común para pasar datos regulares, pero útil cuando un componente padre necesita acceder directamente a una instancia de un componente hijo o a un elemento DOM para llamar a sus métodos o acceder a sus propiedades públicas.
    * Debe usarse con moderación, ya que puede romper el encapsulamiento y hacer el código más difícil de mantener.

La elección del método de comunicación depende de la relación entre los componentes y la naturaleza de los datos que se comparten. Entender estos mecanismos es clave para construir aplicaciones Angular robustas y bien estructuradas, muy parecido a cómo un equipo de desarrollo software necesita establecer canales de comunicación claros para trabajar de forma efectiva en un proyecto grande.
''',
    'code_example': r'''
// --- EJEMPLO: COMUNICACIÓN ENTRE COMPONENTES ---

// Este ejemplo demostrará las tres formas más comunes de comunicación.

// 1. Componente Hijo (src/app/child-component/child-component.component.ts)
import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { SharedDataService } from '../shared-data.service'; // Importar el servicio compartido

@Component({
  selector: 'app-child-component',
  template: `
    <mat-card class="child-card">
      <mat-card-header>
        <mat-card-title>Componente Hijo</mat-card-title>
        <mat-card-subtitle>
          Mensaje del Padre: <strong>{{ messageFromParent }}</strong>
        </mat-card-subtitle>
      </mat-card-header>
      <mat-card-content>
        <p>Número actual del hijo: {{ childCounter }}</p>
        <button mat-raised-button color="primary" (click)="incrementCounter()">
          Incrementar Contador del Hijo
        </button>
        <button mat-button color="accent" (click)="notifyParent()">
          Notificar al Padre
        </button>
        <p>
          Dato del Servicio Compartido:
          <strong>{{ serviceDataFromChild }}</strong>
        </p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .child-card {
      width: 350px;
      margin: 20px;
      padding: 15px;
      border: 1px dashed #FF9800;
      background-color: #FFF3E0;
    }
    button { margin: 5px; }
  `],
  standalone: true,
  imports: [CommonModule, MatButtonModule, MatCardModule]
})
export class ChildComponent implements OnInit {
  // @Input: para recibir datos del padre
  @Input() messageFromParent: string = 'Ninguno';

  // @Output: para enviar eventos al padre
  @Output() childEvent = new EventEmitter<string>();

  childCounter: number = 0;
  serviceDataFromChild: string = '';

  constructor(private sharedDataService: SharedDataService) {}

  ngOnInit(): void {
    // Suscribirse a los cambios del servicio compartido
    this.sharedDataService.currentData.subscribe(data => {
      this.serviceDataFromChild = data;
    });
  }

  incrementCounter(): void {
    this.childCounter++;
  }

  notifyParent(): void {
    this.childEvent.emit(`¡Hola Padre! El contador del hijo es: ${this.childCounter}`);
  }
}

// 2. Servicio Compartido (src/app/shared-data.service.ts)
// Se provee a nivel de raíz para que sea un singleton en toda la aplicación.
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs'; // BehaviorSubject es útil para datos reactivos

@Injectable({
  providedIn: 'root' // Hace que el servicio sea un singleton en toda la aplicación
})
export class SharedDataService {
  // BehaviorSubject para almacenar y emitir el dato compartido
  private dataSubject = new BehaviorSubject<string>('Dato inicial del servicio');
  currentData = this.dataSubject.asObservable(); // Exponer como Observable para que los componentes se suscriban

  changeData(newData: string): void {
    this.dataSubject.next(newData); // Emitir el nuevo dato
  }
}


// 3. Componente Padre (src/app/parent-component/parent-component.component.ts)
import { Component, ViewChild, ElementRef, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { ChildComponent } from '../child-component/child-component.component'; // Importar el componente hijo
import { SharedDataService } from '../shared-data.service'; // Importar el servicio compartido

@Component({
  selector: 'app-parent-component',
  template: `
    <mat-card class="parent-card">
      <mat-card-header>
        <mat-card-title>Componente Padre</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <mat-form-field appearance="fill">
          <mat-label>Mensaje para el Hijo</mat-label>
          <input matInput [(ngModel)]="parentMessage" (input)="updateChildMessage()">
        </mat-form-field>
        <p>Mensaje recibido del Hijo: <strong>{{ messageFromChild }}</strong></p>

        <button mat-raised-button color="accent" (click)="updateServiceData()">
          Actualizar Dato del Servicio
        </button>

        <p>Dato del Servicio Compartido (desde Padre): <strong>{{ serviceDataFromParent }}</strong></p>

        <hr>

        <app-child-component
          [messageFromParent]="parentMessage"
          (childEvent)="handleChildEvent($event)"
        ></app-child-component>

        <button mat-button (click)="accessChildMethod()">Acceder Método del Hijo (ViewChild)</button>
        <p *ngIf="viewChildMessage">{{ viewChildMessage }}</p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .parent-card {
      width: 500px;
      margin: 40px auto;
      padding: 20px;
      border: 2px solid #1A237E;
      background-color: #E8EAF6;
      text-align: center;
    }
    mat-form-field { width: 80%; margin-bottom: 20px; }
    button { margin: 5px; }
  `],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule, // Necesario para ngModel
    MatButtonModule,
    MatCardModule,
    MatInputModule,
    MatFormFieldModule,
    ChildComponent // Importar el componente hijo aquí
  ]
})
export class ParentComponent implements OnInit {
  parentMessage: string = 'Hola desde el Padre!';
  messageFromChild: string = 'Esperando mensaje del hijo...';
  serviceDataFromParent: string = '';

  // @ViewChild para acceder a la instancia del componente hijo
  @ViewChild(ChildComponent) childComponent!: ChildComponent;

  constructor(private sharedDataService: SharedDataService) {}

  ngOnInit(): void {
    // Suscribirse a los cambios del servicio compartido
    this.sharedDataService.currentData.subscribe(data => {
      this.serviceDataFromParent = data;
    });
  }

  updateChildMessage(): void {
    // No hace falta hacer nada aquí, el binding de input ya lo maneja
  }

  handleChildEvent(event: string): void {
    this.messageFromChild = event;
    console.log('Evento recibido del hijo:', event);
  }

  updateServiceData(): void {
    this.sharedDataService.changeData(`Dato actualizado desde el Padre a las ${new Date().toLocaleTimeString()}`);
  }

  accessChildMethod(): void {
    if (this.childComponent) {
      // Acceder a un método público del componente hijo
      this.childComponent.incrementCounter();
      this.viewChildMessage = `Contador del hijo incrementado a ${this.childComponent.childCounter} usando ViewChild.`;
    } else {
      this.viewChildMessage = 'Componente hijo no disponible aún.';
    }
  }

  viewChildMessage: string = '';
}

// 4. Integración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { ParentComponent } from './parent-component/parent-component.component'; // Importar el componente padre
import { FormsModule } from '@angular/forms'; // Necesario para ngModel en ParentComponent

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    ParentComponent, // Importar componente standalone
    FormsModule // Si tu AppComponent o sus hijos utilizan ngModel
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-parent-component></app-parent-component>
*/

/*
Un error común es intentar mutar (`modificar`) un `@Input()` directamente desde el componente hijo.
Los `@Input()` deben tratarse como propiedades de solo lectura en el componente hijo.
Si el hijo necesita cambiar un valor que vino del padre, debe emitir un `@Output()`
y dejar que el padre actualice ese valor. Mutar directamente el `@Input()` puede
llevar a un estado impredecible y romper el flujo de datos unidireccional de Angular.

Otro error es usar un servicio compartido para pasar datos entre componentes
con relación padre-hijo directa. Aunque funciona, es una forma de comunicación
más pesada y menos explícita que `@Input()` y `@Output()`. Siempre que la
comunicación sea directa entre padre e hijo, prioriza `@Input()` y `@Output()`
para mantener tu código más limpio y fácil de entender. Los servicios son
para comunicación entre componentes no relacionados o para datos de estado global.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Responsive Design',
    'subtopic': 'Uso de Flex Layout',
    'definition': r'''
Hoy en día, las aplicaciones web no se ven solo en computadoras de escritorio. Se acceden desde teléfonos, tabletas, laptops, y pantallas de todo tipo y tamaño. Por eso, el "diseño responsivo" es más que una simple moda, es una necesidad. Y dentro de Angular, una de las herramientas más potentes para lograr este diseño responsivo es "Flex Layout".

No sé tú, pero a mí esto al principio me costó 🤯. La idea es que Pensemos por un momento en un conjunto de muebles que mágicamente se reacomodan y ajustan su tamaño para encajar perfectamente en cualquier habitación, grande o pequeña. Eso es lo que Flex Layout hace por tus elementos de UI. En lugar de escribir un montón de media queries CSS manualmente para cada punto de quiebre (breakpoint), Flex Layout te da un conjunto de directivas de Angular que, bajo el capó, aplican los estilos CSS de Flexbox de forma inteligente, adaptando tu diseño a diferentes tamaños de pantalla con mucha menos fricción.

Flex Layout es una librería de Angular que te proporciona un conjunto de directivas HTML y de TypeScript para crear diseños basados en Flexbox de manera declarativa. Esto significa que en lugar de escribir CSS directamente para flexbox, lo haces a través de atributos en tus elementos HTML, los cuales luego Angular traduce a los estilos CSS apropiados.

Algunas de las directivas clave de Flex Layout son:

* **Contenedor (`fxLayout`)**: Define la dirección de los ítems en un contenedor flex (ej., `row` para horizontal, `column` para vertical). Puedes añadir sufijos para aplicar el layout solo en ciertos breakpoints, como `fxLayout.lt-md="column"` (para layout de columna en pantallas más pequeñas que "medium").
* **Alineación de Contenedor (`fxLayoutAlign`)**: Controla la alineación de los ítems a lo largo de los ejes principal y transversal (ej., `fxLayoutAlign="space-between center"`).
* **Ítem (`fxFlex`)**: Define cómo un ítem individual dentro de un contenedor flexbox debe crecer o encogerse y su base de tamaño. Puedes usar porcentajes (`fxFlex="50%"`), valores fijos (`fxFlex="100px"`), o dejar que ocupe el espacio restante (`fxFlex`). También puedes añadir sufijos de breakpoint.
* **Orden (`fxFlexOrder`)**: Permite cambiar el orden visual de un ítem.
* **Mostrar/Ocultar (`fxShow`, `fxHide`)**: Para mostrar u ocultar elementos solo en ciertos breakpoints (ej., `fxHide.lt-md` para ocultar en pantallas pequeñas).

Lo genial de Flex Layout es que, al estar basado en directivas, se integra muy bien con el ecosistema de Angular y te permite crear layouts complejos y responsivos de forma mucho más rápida y legible que si lo hicieras con CSS puro, especialmente en proyectos grandes. Empresas como Google utilizan Flexbox en sus propios productos, y Flex Layout te brinda una forma "Angular-friendly" de aprovecharlo.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE ANGULAR FLEX LAYOUT ---

// Primero, asegúrate de instalar Flex Layout en tu proyecto:
// ng add @angular/flex-layout

// 1. Importar el módulo de Flex Layout en tu AppModule (src/app/app.module.ts)
// Si usas componentes standalone, puedes importarlo directamente en el componente que lo necesite.

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { FlexLayoutModule } from '@angular/flex-layout'; // Importar FlexLayoutModule
import { ResponsiveDemoComponent } from './responsive-demo/responsive-demo.component'; // Tu componente de demo

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule, // <-- ¡Importante! Habilita Flex Layout
    ResponsiveDemoComponent // Importa tu componente standalone
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 2. Componente de demostración de Flex Layout (src/app/responsive-demo/responsive-demo.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FlexLayoutModule } from '@angular/flex-layout'; // Importar aquí también si es standalone

@Component({
  selector: 'app-responsive-demo',
  template: `
    <div class="flex-container">
      <h2>Demostración de Angular Flex Layout</h2>

      <div fxLayout="row" fxLayout.lt-md="column" fxLayoutAlign="space-around center" class="header-section">
        <div fxFlex="30" fxFlex.lt-md="100">Logo</div>
        <div fxFlex="50" fxFlex.lt-md="100">Título Principal</div>
        <div fxFlex="20" fxFlex.lt-md="100">Menú</div>
      </div>

      <hr>

      <div fxLayout="row wrap" fxLayoutAlign="center center" fxLayoutGap="20px" class="card-grid">
        <div fxFlex="0 1 calc(33.3% - 20px)" fxFlex.lt-md="0 1 calc(50% - 20px)" fxFlex.lt-sm="0 1 calc(100% - 20px)" class="card">
          <h3>Tarjeta 1</h3>
          <p>Este es el contenido de la tarjeta uno.</p>
        </div>
        <div fxFlex="0 1 calc(33.3% - 20px)" fxFlex.lt-md="0 1 calc(50% - 20px)" fxFlex.lt-sm="0 1 calc(100% - 20px)" class="card">
          <h3>Tarjeta 2</h3>
          <p>Este es el contenido de la tarjeta dos.</p>
        </div>
        <div fxFlex="0 1 calc(33.3% - 20px)" fxFlex.lt-md="0 1 calc(50% - 20px)" fxFlex.lt-sm="0 1 calc(100% - 20px)" class="card">
          <h3>Tarjeta 3</h3>
          <p>Este es el contenido de la tarjeta tres.</p>
        </div>
        <div fxFlex="0 1 calc(33.3% - 20px)" fxFlex.lt-md="0 1 calc(50% - 20px)" fxFlex.lt-sm="0 1 calc(100% - 20px)" class="card">
          <h3>Tarjeta 4</h3>
          <p>Este es el contenido de la tarjeta cuatro.</p>
        </div>
      </div>

      <hr>

      <div class="visibility-demo">
        <p fxHide.lt-md>Este texto se oculta en pantallas pequeñas (lt-md).</p>
        <p fxShow.gt-sm>Este texto solo se muestra en pantallas grandes (gt-sm).</p>
      </div>

      <p class="note">
        Redimensiona la ventana del navegador para ver cómo los elementos
        se adaptan a diferentes tamaños de pantalla utilizando Flex Layout.
      </p>
    </div>
  `,
  styles: [`
    .flex-container {
      border: 1px solid #7B1FA2;
      padding: 20px;
      margin: 20px;
      background-color: #EDE7F6;
    }
    .header-section > div {
      background-color: #D1C4E9;
      padding: 10px;
      text-align: center;
      border: 1px solid #9575CD;
      margin: 5px;
    }
    .card-grid {
      margin-top: 20px;
    }
    .card {
      background-color: #B39DDB;
      padding: 20px;
      text-align: center;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .visibility-demo p {
      background-color: #CE93D8;
      padding: 10px;
      margin: 10px auto;
      border-radius: 4px;
      width: fit-content;
    }
    hr { margin: 30px 0; border-color: #7B1FA2; }
    .note { font-size: 0.9em; color: #555; margin-top: 20px; }
  `],
  standalone: true,
  imports: [CommonModule, FlexLayoutModule] // Asegúrate de importar FlexLayoutModule aquí
})
export class ResponsiveDemoComponent { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-responsive-demo></app-responsive-demo>
*/

/*
Un error común es olvidar importar `FlexLayoutModule` en tu `NgModule` o componente
standalone donde lo vayas a usar. Si no lo importas, Angular no reconocerá las directivas
`fxLayout`, `fxFlex`, etc., y tu aplicación mostrará errores en la consola y no aplicará
los estilos de layout.

Otro error es confundir la sintaxis de los breakpoints. Por ejemplo, `fxFlex.gt-md`
significa "mayor que medium", mientras que `fxFlex.lt-md` significa "menor que medium".
Asegúrate de usar los sufijos correctos para lograr el comportamiento responsivo deseado
en cada punto de quiebre.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Responsive Design',
    'subtopic': 'Adaptación a diferentes tamaños de pantalla',
    'definition': r'''
La esencia del diseño responsivo no es solo usar una librería como Flex Layout, sino la filosofía de que tu aplicación web debe ofrecer una experiencia de usuario óptima sin importar el tamaño o tipo de pantalla desde la que se acceda. Esto significa que el diseño no es estático, sino que se "adapta" fluidamente a las dimensiones disponibles.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un diseñador de moda que crea una prenda que se ajusta perfectamente a personas de diferentes estaturas y complexiones. Así debe ser tu aplicación. Si tu sitio web se ve bien en un monitor de escritorio, pero es imposible de usar en un teléfono móvil (botones demasiado pequeños, texto ilegible, elementos superpuestos), entonces estás perdiendo una gran parte de tu audiencia. La adaptación a diferentes tamaños de pantalla es clave para la accesibilidad, la usabilidad y para garantizar que tus usuarios tengan una experiencia positiva sin importar cómo te visiten.

La adaptación se logra mediante una combinación de técnicas:

* **Media Queries CSS**: Son reglas CSS que te permiten aplicar estilos solo cuando se cumplen ciertas condiciones (ej., el ancho de la ventana es menor que 768px). Aunque Flex Layout abstrae mucho de esto, las media queries siguen siendo la base de cómo funciona el diseño responsivo a nivel de CSS. Son el "cerebro" detrás de las adaptaciones de diseño.
* **Unidades Relativas**: Usar unidades como porcentajes (`%`), `vw` (viewport width), `vh` (viewport height), `em`, `rem` en lugar de píxeles fijos para tamaños de texto, anchos y márgenes. Esto permite que los elementos escalen proporcionalmente al tamaño de la pantalla o al tamaño de la fuente base.
* **Imágenes Responsivas**: Asegurarse de que las imágenes no desborden sus contenedores y que carguen versiones optimizadas para el tamaño de pantalla del usuario. El atributo `srcset` en HTML `<img>` y la directiva `picture` son fundamentales aquí.
* **Diseño Fluido o Basado en Grillas**: Utilizar sistemas de columnas (como el de Flex Layout o CSS Grid) que se reajustan dinámicamente. Por ejemplo, en un escritorio podrías tener 3 columnas, pero en un móvil, esas 3 columnas se apilan verticalmente o se convierten en una sola columna.
* **Mobile-First (Diseño primero para móvil)**: Una estrategia recomendada es diseñar y desarrollar primero para la experiencia móvil más pequeña, y luego escalar el diseño para tabletas y escritorios. Esto fuerza a priorizar el contenido y la funcionalidad esenciales, lo que a menudo resulta en una mejor experiencia general.

La adaptación del diseño no es solo cuestión de estética, sino de funcionalidad. Una aplicación que no se adapta bien a diferentes tamaños de pantalla puede frustrar a los usuarios, aumentar las tasas de rebote y dañar la reputación de tu marca. Compañías como Amazon o Netflix invierten mucho en diseño responsivo para garantizar que sus millones de usuarios tengan una experiencia fluida y consistente, ya sea que estén comprando en un teléfono o viendo una película en una televisión inteligente.
''',
    'code_example': r'''
// --- EJEMPLO: ADAPTACIÓN A DIFERENTES TAMAÑOS DE PANTALLA CON MEDIA QUERIES Y UNIDADES RELATIVAS ---

// Aunque Flex Layout hace mucho, entender las bases de CSS es crucial.

// 1. Componente de demostración (src/app/screen-adaptation-demo/screen-adaptation-demo.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-screen-adaptation-demo',
  template: `
    <div class="responsive-layout-container">
      <h2>Adaptación a Diferentes Tamaños de Pantalla</h2>

      <div class="hero-section">
        <h1 class="hero-title">Tu Título Responsivo</h1>
        <p class="hero-subtitle">
          Un subtítulo que se adapta al ancho de la pantalla.
        </p>
      </div>

      <div class="content-grid">
        <div class="grid-item">
          <h3>Artículo 1</h3>
          <p>Este es el contenido del primer artículo. Su tamaño de fuente y márgenes se ajustan.</p>
          <img src="https://via.placeholder.com/200/9FA8DA/FFFFFF?text=IMG1" alt="Imagen 1" class="responsive-image">
        </div>
        <div class="grid-item">
          <h3>Artículo 2</h3>
          <p>Este es el contenido del segundo artículo, diseñado para fluir.</p>
          <img src="https://via.placeholder.com/200/9FA8DA/FFFFFF?text=IMG2" alt="Imagen 2" class="responsive-image">
        </div>
        <div class="grid-item">
          <h3>Artículo 3</h3>
          <p>Este es el contenido del tercer artículo, que se apilará en móvil.</p>
          <img src="https://via.placeholder.com/200/9FA8DA/FFFFFF?text=IMG3" alt="Imagen 3" class="responsive-image">
        </div>
      </div>

      <div class="button-container">
        <button class="responsive-button">Botón Adaptable</button>
      </div>

      <p class="note">
        Redimensiona el navegador para ver cómo el diseño, fuentes e imágenes
        se adaptan usando media queries y unidades relativas.
      </p>
    </div>
  `,
  styles: [`
    /* Base Mobile-First */
    .responsive-layout-container {
      padding: 1rem; /* 1rem = 16px por defecto, se adapta con la fuente base */
      margin: 1rem;
      border: 2px solid #5E35B1;
      background-color: #EDE7F6;
      text-align: center;
      font-size: 16px; /* Tamaño de fuente base */
    }

    .hero-section {
      background-color: #7E57C2;
      color: white;
      padding: 1.5rem 1rem;
      margin-bottom: 1rem;
    }

    .hero-title {
      font-size: 2em; /* 2 veces el tamaño de la fuente base */
      margin-bottom: 0.5em;
    }

    .hero-subtitle {
      font-size: 1.1em;
    }

    .content-grid {
      display: grid;
      grid-template-columns: 1fr; /* Una columna por defecto (móvil) */
      gap: 1.5rem; /* Espaciado entre elementos */
      margin-bottom: 1.5rem;
    }

    .grid-item {
      background-color: #B39DDB;
      padding: 1rem;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-size: 0.9em;
    }

    .grid-item h3 {
      font-size: 1.5em;
      margin-top: 0;
      margin-bottom: 0.8em;
    }

    .responsive-image {
      max-width: 100%; /* La imagen nunca desbordará su contenedor */
      height: auto; /* Mantiene la proporción de la imagen */
      display: block; /* Elimina espacio extra debajo de la imagen */
      margin: 1rem auto 0;
      border-radius: 4px;
    }

    .responsive-button {
      padding: 0.8rem 1.5rem;
      font-size: 1em;
      background-color: #5E35B1;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .responsive-button:hover {
      background-color: #4527A0;
    }

    /* Media Queries para Tabletas (Ej. Ancho > 768px) */
    @media (min-width: 768px) {
      .hero-title {
        font-size: 2.8em;
      }

      .content-grid {
        grid-template-columns: 1fr 1fr; /* Dos columnas en tabletas */
      }

      .grid-item {
        font-size: 1em;
      }
    }

    /* Media Queries para Escritorio (Ej. Ancho > 1024px) */
    @media (min-width: 1024px) {
      .hero-title {
        font-size: 3.5em;
      }

      .content-grid {
        grid-template-columns: 1fr 1fr 1fr; /* Tres columnas en escritorio */
      }

      .responsive-layout-container {
        max-width: 1200px; /* Limita el ancho máximo en pantallas muy grandes */
        margin-left: auto;
        margin-right: auto;
      }
    }
  `],
  standalone: true,
  imports: [CommonModule]
})
export class ScreenAdaptationDemoComponent { }

// src/app/app.component.html (ejemplo de uso)
/*
<app-screen-adaptation-demo></app-screen-adaptation-demo>
*/

/*
Un error común es usar unidades de píxeles fijos (`px`) para tamaños de fuentes,
espaciados y anchos de elementos que deberían ser flexibles. Cuando se usa `px`,
el elemento mantendrá el mismo tamaño sin importar el dispositivo, lo que puede
hacer que se vea demasiado grande en pantallas pequeñas o demasiado pequeño en pantallas grandes.
Prioriza el uso de unidades relativas como `em`, `rem`, `%`, `vw`, `vh` para un diseño más adaptable.

Otro error es aplicar demasiadas `media queries` o hacerlas demasiado específicas.
Esto puede llevar a un CSS inflado y difícil de mantener. Intenta usar las `media queries`
solo para los puntos de quiebre clave donde el diseño realmente necesita un cambio significativo,
y deja que el diseño fluido (unidades relativas y flexbox/grid) se encargue de las adaptaciones
entre esos puntos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Animaciones y UI Avanzada',
    'topic': 'Responsive Design',
    'subtopic': 'Pruebas en dispositivos móviles',
    'definition': r'''
Diseñar para diferentes tamaños de pantalla es solo la mitad de la batalla. La otra mitad, igualmente crucial, es "probar en dispositivos móviles reales o simulados". Una aplicación puede verse perfecta en tu navegador de escritorio, pero funcionar o verse completamente diferente en un teléfono o tableta real debido a diferencias en el motor de renderizado, el rendimiento, la interacción táctil o las capacidades del dispositivo.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un par de zapatos. Se ven bien en el escaparate, pero no sabes si son cómodos o si te ajustan hasta que te los pruebas y caminas con ellos. De la misma manera, no puedes estar seguro de que tu aplicación es realmente responsiva y usable en móvil hasta que la pruebas en un entorno real. Factores como la velocidad de la red, la interacción táctil (en lugar de clics con ratón), y la orientación del dispositivo pueden afectar drásticamente la experiencia del usuario y solo se pueden identificar con pruebas adecuadas.

Las pruebas en dispositivos móviles o simulados son esenciales para:

* **Verificación Visual**: Asegurar que los elementos se posicionan, escalan y se ven correctamente en una variedad de tamaños de pantalla y densidades de píxeles.
* **Pruebas de Usabilidad Táctil**: Confirmar que los botones son lo suficientemente grandes para tocar, que los gestos (scroll, zoom, swipe) funcionan como se espera, y que los formularios son fáciles de rellenar con un teclado en pantalla.
* **Rendimiento**: Evaluar la velocidad de carga, la fluidez de las animaciones y la capacidad de respuesta general en dispositivos con recursos más limitados o conexiones de red más lentas.
* **Compatibilidad con Navegadores**: Asegurar que la aplicación funciona correctamente en diferentes navegadores móviles (Chrome en Android, Safari en iOS, etc.), ya que pueden tener peculiaridades en su implementación de estándares web.
* **Contexto del Usuario**: Considerar cómo se usa la aplicación en un entorno móvil: con una sola mano, bajo la luz del sol, en movimiento, etc.

Las herramientas y técnicas para probar en móvil incluyen:

* **Herramientas de Desarrollador del Navegador**: La mayoría de los navegadores modernos (Chrome, Firefox, Edge) tienen un "modo dispositivo" integrado que te permite simular diferentes tamaños de pantalla, ratios de píxeles, y a veces incluso condiciones de red. Es un buen punto de partida para pruebas rápidas.
* **Emuladores y Simuladores**: Android Studio y Xcode (para iOS) ofrecen emuladores y simuladores que replican el entorno de hardware y software de dispositivos reales, lo que permite pruebas más precisas que el modo dispositivo del navegador.
* **Dispositivos Reales**: Siempre que sea posible, es fundamental probar en un rango de dispositivos físicos reales. Esto revela problemas que los simuladores o el modo dispositivo no pueden replicar, como el tacto real, el rendimiento de la batería, la luz ambiental o la conectividad de red variable.
* **Servicios de Pruebas en la Nube**: Plataformas como BrowserStack, Sauce Labs o LambdaTest ofrecen acceso a una gran variedad de dispositivos reales y configuraciones de navegador para pruebas remotas.

Las empresas de tecnología que dependen en gran medida de las aplicaciones móviles, como bancos, redes sociales o tiendas en línea, invierten considerablemente en pruebas exhaustivas en una amplia gama de dispositivos para asegurar una experiencia impecable a sus usuarios.
''',
    'code_example': r'''
// --- EJEMPLO: ENFOQUE PARA PRUEBAS EN DISPOSITIVOS MÓVILES ---

// No hay código Angular específico para "probar" en dispositivos móviles,
// ya que las pruebas se realizan con herramientas externas o configuraciones.
// Sin embargo, podemos incluir comentarios sobre cómo se abordaría.

// 1. **Recomendaciones y Flujo de Trabajo para Pruebas**

/*
// En tu archivo `package.json`, puedes tener scripts para levantar tu app en modo desarrollo.
// Esto es el punto de partida para todas tus pruebas en diferentes entornos.
{
  "name": "angular-responsive-app",
  "version": "0.0.1",
  "scripts": {
    "ng": "ng",
    "start": "ng serve --host 0.0.0.0 --disable-host-check", // <-- Asegúrate de que tu app sea accesible en la red local
    "build": "ng build",
    "watch": "ng build --watch --configuration development",
    "test": "ng test"
  },
  "private": true,
  "dependencies": { /* ... */ /*},
  "devDependencies": { /* ... */ /*}
}

// 2. **Ejemplo de configuración de estilo para visualización adaptable (ya visto en subtopic anterior)**
// Asegúrate de que tus estilos CSS usen media queries y unidades relativas.

// src/app/some-component/some-component.component.css (o .scss)
/*
.main-container {
  padding: 15px;
  /* Utiliza vw para el ancho de la fuente para que se adapte */
  font-size: 3.5vw; /* Esto es solo un ejemplo; em/rem son a menudo mejores para fuentes */
}

/* Diseño por defecto para móvil */
.card-layout {
  display: flex;
  flex-direction: column; /* Apilado en móvil */
  align-items: center;
}

.card {
  width: 90%; /* Ocupa casi todo el ancho en móvil */
  margin-bottom: 20px;
}

/* Media Query para tabletas y superiores */
@media (min-width: 768px) {
  .main-container {
    font-size: 2vw;
  }
  .card-layout {
    flex-direction: row; /* En fila en tabletas y escritorio */
    justify-content: space-around;
  }
  .card {
    width: 45%; /* Dos columnas en tabletas */
  }
}

/* Media Query para escritorio y superiores */
@media (min-width: 1024px) {
  .main-container {
    font-size: 1.2vw;
    max-width: 1200px; /* Limitar ancho máximo */
    margin: 0 auto;
  }
  .card {
    width: 30%; /* Tres columnas en escritorio */
  }
}
*/

// 3. **Pasos para Probar en Dispositivos Móviles**

// a) **Usando las Herramientas de Desarrollo del Navegador (Chrome DevTools)**
//    - Abre Chrome DevTools (F12 o Ctrl+Shift+I).
//    - Haz clic en el icono "Toggle device toolbar" (el que parece un teléfono y una tableta).
//    - Selecciona diferentes dispositivos preestablecidos (iPhone, Pixel, iPad) o arrastra los bordes para un tamaño personalizado.
//    - Puedes simular la red (offline, 3G lenta) y la aceleración (throttling de CPU).

// b) **Accediendo a tu Aplicación en un Dispositivo Físico en la Red Local**
//    - Asegúrate de que tu computadora y tu dispositivo móvil estén en la MISMA red Wi-Fi.
//    - Cuando ejecutas `ng serve`, Angular CLI te mostrará la dirección IP de tu red local (ej., `http://192.168.1.XX:4200/`).
//    - Abre el navegador en tu dispositivo móvil y navega a esa dirección IP.
//    - Si tienes problemas, asegúrate de que tu firewall no esté bloqueando el puerto 4200.
//    - Para Android, puedes usar "USB debugging" y la función "Port forwarding" de Chrome DevTools para acceder al localhost de tu computadora desde el dispositivo.

// c) **Usando Emuladores/Simuladores (Android Studio AVD, Xcode iOS Simulator)**
//    - Instala Android Studio o Xcode.
//    - Crea un dispositivo virtual (AVD para Android, Simulator para iOS).
//    - Inicia tu aplicación Angular con `ng serve`.
//    - Abre el navegador dentro del emulador/simulador y navega a `http://localhost:4200` (el emulador/simulador tiene su propio localhost que mapea a tu máquina).
//    - Esto te da una experiencia de navegación más cercana a un dispositivo real.

// d) **Plataformas de Pruebas en la Nube (BrowserStack, Sauce Labs)**
//    - Son servicios de pago. Subes tu aplicación (o la expones vía un túnel seguro)
//      y puedes ejecutar pruebas en una gran variedad de dispositivos reales o virtuales
//      en la nube, con diferentes sistemas operativos, navegadores y ubicaciones geográficas.
//    - Son ideales para pruebas de compatibilidad a gran escala.

/*
Errores comunes en las pruebas móviles:

1.  **Fiarse solo del modo dispositivo del navegador**: Aunque es útil para la verificación visual rápida,
    no replica con precisión el rendimiento real del dispositivo, la interacción táctil,
    o las peculiaridades de los navegadores específicos de móviles (ej. Safari en iOS).
    Siempre complementa con pruebas en dispositivos reales o emuladores.

2.  **No considerar el rendimiento**: Una animación fluida en un escritorio potente puede
    ser un desastre a 30fps en un teléfono antiguo. Usa las herramientas de perfilado
    del navegador o de los emuladores para identificar cuellos de botella de rendimiento
    en entornos móviles.

3.  **Ignorar la accesibilidad táctil**: Botones demasiado pequeños, áreas de clic diminutas,
    o elementos interactivos muy juntos hacen que la aplicación sea frustrante de usar
    con los dedos. Asegúrate de que los elementos interactivos tengan un tamaño de al menos
    48x48 píxeles.

4.  **No probar la orientación**: Asegúrate de que tu aplicación se vea bien tanto en
    modo vertical como horizontal, ya que los usuarios pueden rotar sus dispositivos.
*/
'''
  });
}

Future<void> insertAngularMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Seguridad en Angular',
    'subtopic': 'Prevención de XSS y CSRF',
    'definition': r'''
Cuando construyes aplicaciones web con Angular, la seguridad es un tema que no se puede tomar a la ligera. Dos de los ataques más comunes y peligrosos en el panorama web son el Cross-Site Scripting (XSS) y el Cross-Site Request Forgery (CSRF). Prevenerlos es crucial para proteger tanto a tus usuarios como la integridad de tu aplicación.

Seguramente pensarás de qué va todo esto y por qué es tan importante. No sé tú, pero a mí esto al principio me costó. 

La idea es que, a grandes rasgos, el XSS permite a los atacantes inyectar scripts maliciosos en tu página web que se ejecutan en el navegador de tus usuarios, mientras que el CSRF engaña a los usuarios para que realicen acciones no deseadas en tu aplicación. Es como si un atacante pudiera enviar un paquete con un virus a tu casa (XSS) o convencer a tu vecino de que firme un contrato sin saberlo (CSRF).

Angular viene con mecanismos de seguridad integrados que te ayudan a mitigar estos riesgos de forma significativa.

* **Prevención de XSS (Cross-Site Scripting)**:
    Angular trata por defecto cualquier valor como no seguro cuando lo inserta en el DOM (Document Object Model) y automáticamente lo sanitiza. Esto significa que elimina cualquier código potencialmente malicioso (scripts) antes de que se renderice. Por ejemplo, si un usuario introduce `<script>alert('¡Soy un atacante!');</script>` en un campo de texto que luego se muestra en tu aplicación, Angular eliminará la etiqueta `<script>` para evitar que el script se ejecute. Esta característica de sanitización automática es una de las principales defensas de Angular contra XSS y cubre HTML, estilos y URL. La mayoría de las veces, no necesitas hacer nada, simplemente enlaza tus datos y Angular se encargará. Sin embargo, hay escenarios donde necesitas mostrar contenido "seguro" de una fuente de confianza (ej., HTML enriquecido de un editor WYSIWYG) y para eso, Angular te ofrece `DomSanitizer`, que veremos en el siguiente subtema.

* **Prevención de CSRF (Cross-Site Request Forgery)**:
    Los ataques CSRF explotan el hecho de que el navegador envía automáticamente las cookies de sesión con cada solicitud a un dominio. Si un usuario tiene una sesión activa en tu aplicación y visita una página maliciosa, esa página podría enviar una solicitud a tu backend en nombre del usuario, ejecutando una acción que el usuario no pretendía (ej., cambiar una contraseña, hacer una compra). Para mitigar esto, Angular utiliza una técnica común llamada "token de sincronización de doble envío". El backend de tu aplicación debe enviar un token CSRF al cliente (ej., en una cookie), y luego el cliente (Angular) lo lee y lo envía de vuelta en un encabezado HTTP personalizado (`X-XSRF-TOKEN`) con cada solicitud. El backend verifica que el token en el encabezado coincida con el token en la cookie. Si no coinciden, la solicitud se rechaza. Esto asegura que la solicitud provenga de tu aplicación legítima y no de un sitio externo malicioso. Es importante que tanto tu frontend (Angular) como tu backend (API) estén configurados para trabajar con este mecanismo.

Estos mecanismos son parte fundamental de la seguridad en aplicaciones web modernas y son el pan de cada día en empresas como Google, que manejan información sensible de miles de millones de usuarios. Asegurarse de que estos ataques no puedan prosperar es un paso crítico para construir aplicaciones confiables.
''',
    'code_example': r'''
// --- EJEMPLO: PREVENCIÓN DE XSS Y CSRF EN ANGULAR ---

// --- Parte 1: Prevención de XSS (Sanitización automática de Angular) ---

// src/app/xss-demo/xss-demo.component.ts
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser'; // Necesario para sanitización manual (siguiente subtema)

@Component({
  selector: 'app-xss-demo',
  template: `
    <div class="xss-container">
      <h2>Prevención de XSS (Sanitización Automática)</h2>

      <mat-form-field appearance="fill">
        <mat-label>Introduce contenido (intenta con un script)</mat-label>
        <input matInput [(ngModel)]="userInput">
      </mat-form-field>
      <button mat-raised-button color="primary" (click)="displayContent()">Mostrar Contenido</button>

      <h3>Contenido sin sanitizar (solo para DEMOSTRACIÓN - ¡NO HACER ESTO!)</h3>
      <div [innerHTML]="userInput"></div> 

      <h3>Contenido enlazado por Angular (AUTOMÁTICAMENTE SANITIZADO)</h3>
      <div [textContent]="userInput" class="sanitized-output"></div>
      <div [innerHTML]="autoSanitizedHtml"></div>
      
      <p class="warning">
        **¡Importante!** La línea `[innerHTML]="userInput"` **es peligrosa** si `userInput`
        no ha sido sanitizado. Angular solo sanitiza automáticamente cuando el valor
        es directamente enlazado al DOM (como en `[innerHTML]="autoSanitizedHtml"`
        después de un `DomSanitizer.bypassSecurityTrustHtml`).
        Para texto simple, `[textContent]` es seguro.
      </p>
    </div>
  `,
  styles: [`
    .xss-container {
      padding: 20px;
      margin: 20px;
      border: 1px solid #0D47A1;
      background-color: #E3F2FD;
      text-align: center;
    }
    mat-form-field { width: 80%; margin-bottom: 15px; }
    .sanitized-output {
      border: 1px dashed #4CAF50;
      padding: 10px;
      margin-top: 15px;
      background-color: #E8F5E9;
    }
    .warning {
      color: #D32F2F;
      font-weight: bold;
      margin-top: 20px;
    }
  `],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule
  ]
})
export class XssDemoComponent {
  userInput: string = '<img src="x" onerror="alert(\'¡XSS Inyectado!\')"/><p>Hola</p>';
  autoSanitizedHtml: SafeHtml = '';

  constructor(private sanitizer: DomSanitizer) {} // Inyectar DomSanitizer para el bypass del siguiente subtema

  displayContent(): void {
    // Cuando el usuario ingresa algo, y luego se enlaza a [innerHTML],
    // Angular lo sanitizará automáticamente.
    // Solo para demostrar, aquí podríamos hacer un bypass explícito (PELIGROSO sin validación).
    // Para este subtema, demostramos la sanitización automática.
    // Simula una fuente "segura" si usaras bypass (pero no lo hagas sin validación)
    this.autoSanitizedHtml = this.sanitizer.bypassSecurityTrustHtml(this.userInput);
  }
}


// --- Parte 2: Prevención de CSRF (Conceptual - Requiere configuración de Backend) ---

// La prevención de CSRF en Angular se maneja principalmente a través de la configuración de HttpClient
// para enviar un token XSRF, y el backend para generar y validar ese token.

// 1. **Configuración en Angular (src/app/app.module.ts o donde uses HttpClient)**
//    Angular HttpClient está configurado por defecto para manejar tokens XSRF
//    si el backend los provee en una cookie llamada `XSRF-TOKEN` y espera un
//    encabezado `X-XSRF-TOKEN`.

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { XssDemoComponent } from './xss-demo/xss-demo.component';
import { HttpClientModule, provideHttpClient, withXsrfConfiguration } from '@angular/common/http'; // Importar HttpClientModule y provideHttpClient

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    XssDemoComponent, // Componente de demostración XSS
    HttpClientModule // Necesario para la configuración XSRF por defecto
  ],
  providers: [
    // Usando provideHttpClient para configurar XSRF en Angular 15+
    provideHttpClient(
      withXsrfConfiguration({
        cookieName: 'XSRF-TOKEN', // Nombre de la cookie que el backend envía
        headerName: 'X-XSRF-TOKEN' // Nombre del encabezado que Angular enviará al backend
      })
    )
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 2. **Configuración en el Backend (EJEMPLO CONCEPTUAL - Java Spring Boot)**
//    Esto es un ejemplo muy simplificado de cómo un backend en Spring Boot
//    podría manejar los tokens CSRF. Otros frameworks tendrían configuraciones similares.

/*
// En tu configuración de seguridad de Spring Boot (ej., SecurityConfig.java)
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // Habilitar protección CSRF y configurar la estrategia de tokens
        http
            .csrf(csrf -> csrf
                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()) // Token en cookie
                .csrfTokenRequestHandler(new CsrfTokenRequestAttributeHandler()) // Para que el token esté disponible en el request
            )
            .authorizeHttpRequests(auth -> auth
                .anyRequest().authenticated()
            )
            // ... otras configuraciones de seguridad
            ;
        return http.build();
    }
    
    // Esto es solo para propósitos de demostración para obtener el token.
    // En una aplicación real, el token se leería automáticamente desde la cookie por Angular.
    @GetMapping("/csrf-token")
    public CsrfToken csrfToken(CsrfToken token) {
        return token;
    }
}

// Ejemplo de controlador backend para una operación que requiere CSRF (ej. POST)
@RestController
@RequestMapping("/api")
public class MyController {

    @PostMapping("/secure-action")
    public String performSecureAction() {
        // Lógica para realizar una acción segura
        return "Acción segura realizada con éxito!";
    }
}
*/

/*
Errores comunes y consideraciones:

1.  **Desactivar la sanitización de Angular (`DomSanitizer.bypassSecurityTrust...`) sin entender los riesgos**:
    Esto es un agujero de seguridad GIGANTE. Solo se debe usar si el contenido
    proviene de una fuente COMPLETAMENTE CONFIABLE (ej., tu propio backend que ya
    sanitiza el contenido) y después de haberlo validado exhaustivamente.

2.  **No configurar el backend para CSRF**:
    Angular enviará el encabezado `X-XSRF-TOKEN`, pero si tu backend no lo
    espera o no lo valida, el ataque CSRF seguirá siendo posible. La protección
    CSRF es un esfuerzo conjunto entre frontend y backend.

3.  **Manejar datos sensibles en el cliente sin cifrado**:
    Aunque la prevención de XSS y CSRF es crucial, no es suficiente para
    proteger datos sensibles (contraseñas, información financiera). Estos datos
    nunca deben almacenarse en el cliente (LocalStorage, SessionStorage) sin cifrado
    adecuado, y siempre deben transmitirse a través de HTTPS.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Seguridad en Angular',
    'subtopic': 'Sanitización de contenido',
    'definition': r'''
Continuando con la seguridad, la "sanitización de contenido" es un proceso fundamental en Angular que protege tu aplicación de la inyección de código malicioso, especialmente a través de ataques Cross-Site Scripting (XSS). Es el acto de "limpiar" los datos antes de que se muestren en tu interfaz de usuario, eliminando cualquier fragmento que pueda ser peligroso.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un filtro de agua. No querrías beber agua sin filtrar si sospechas que contiene impurezas, ¿verdad? La sanitización es ese filtro para tu contenido. Si tu aplicación permite a los usuarios introducir texto (como comentarios en un blog o descripciones de productos) y luego muestras ese texto sin filtrar, un atacante podría introducir código JavaScript malicioso. Cuando otro usuario vea ese contenido, el script se ejecutaría en su navegador, permitiendo al atacante robar cookies, redirigir al usuario a sitios fraudulentos o incluso modificar el contenido de tu página. La sanitización es tu primera línea de defensa para evitar que esto suceda.

Angular tiene una filosofía de "seguridad por defecto", lo que significa que, en la mayoría de los casos, la sanitización ocurre automáticamente cuando enlazas valores a la plantilla HTML. Por ejemplo, al usar `{{ variable }}` o `[property]="variable"`, Angular aplica el filtro de seguridad adecuado para el contexto.

Sin embargo, hay situaciones específicas donde Angular no puede determinar si un fragmento de HTML, una URL o un estilo es seguro por sí mismo, o cuando necesitas renderizar explícitamente HTML que sabes que es seguro. Para estos casos, Angular proporciona el servicio `DomSanitizer`.

El `DomSanitizer` te permite "confiar" explícitamente en un valor, indicándole a Angular que has verificado manualmente su seguridad y que puede ser insertado en el DOM sin sanitización adicional. Esto se hace a través de métodos como:

* `bypassSecurityTrustHtml()`: Para insertar HTML dinámico.
* `bypassSecurityTrustStyle()`: Para insertar estilos CSS.
* `bypassSecurityTrustScript()`: Para insertar código JavaScript.
* `bypassSecurityTrustUrl()`: Para URLs en enlaces (`<a>`, `<iframe>`, `<img>`).
* `bypassSecurityTrustResourceUrl()`: Para URLs de recursos cargados desde otras fuentes (ej., `<iframe>`, `script src`).

**¡Advertencia Importante!** Usar `bypassSecurityTrust...` debe hacerse con extrema precaución. Solo debes usar estos métodos cuando estés **absolutamente seguro** de que el contenido proviene de una fuente confiable y ha sido validado contra inyecciones. Un ejemplo común es cuando tu backend te envía HTML enriquecido (ej., desde un editor WYSIWYG) que ya ha sido limpiado en el servidor. Si no estás seguro de la fuente o la validación, nunca uses estos métodos directamente con datos generados por el usuario.

El uso de `DomSanitizer` es una herramienta poderosa pero peligrosa, como darle a un constructor acceso a explosivos. Es útil cuando se necesita, pero si se usa incorrectamente, puede causar un gran daño. Empresas como Wikipedia o plataformas de blogs deben ser extremadamente diligentes con la sanitización de contenido generado por el usuario para proteger a sus millones de visitantes de contenido malicioso.
''',
    'code_example': r'''
// --- EJEMPLO: SANITIZACIÓN DE CONTENIDO CON DomSanitizer ---

// src/app/sanitization-demo/sanitization-demo.component.ts
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { DomSanitizer, SafeHtml, SafeStyle, SafeUrl, SafeScript, SafeResourceUrl } from '@angular/platform-browser';

@Component({
  selector: 'app-sanitization-demo',
  template: `
    <div class="sanitization-container">
      <h2>Sanitización de Contenido con DomSanitizer</h2>

      <h3>Ejemplo de HTML Dinámico</h3>
      <mat-form-field appearance="fill" class="input-full-width">
        <mat-label>HTML Peligroso</mat-label>
        <input matInput [(ngModel)]="dangerousHtml" placeholder="Ej: <script>alert('xss');</script>">
      </mat-form-field>
      <button mat-raised-button color="primary" (click)="sanitizeHtml()">Sanitizar HTML</button>
      <div class="output-box">
        <h4>HTML Renderizado (sanitizado por DomSanitizer):</h4>
        <div [innerHTML]="safeHtml"></div>
      </div>
      <p class="warning">
        **¡Advertencia!** El contenido introducido se considera seguro después de `bypassSecurityTrustHtml()`.
        Solo haz esto si confías plenamente en la fuente del HTML.
      </p>

      <h3>Ejemplo de URL Peligrosa</h3>
      <mat-form-field appearance="fill" class="input-full-width">
        <mat-label>URL Peligrosa</mat-label>
        <input matInput [(ngModel)]="dangerousUrl" placeholder="Ej: javascript:alert('malicioso')">
      </mat-form-field>
      <button mat-raised-button color="primary" (click)="sanitizeUrl()">Sanitizar URL</button>
      <div class="output-box">
        <h4>Enlace de URL (sanitizado):</h4>
        <a [href]="safeUrl" target="_blank">Haz clic aquí (si es seguro)</a>
      </div>
      <p class="warning">
        Las URLs con `javascript:` son peligrosas. El `DomSanitizer` previene su ejecución.
      </p>
    </div>
  `,
  styles: [`
    .sanitization-container {
      padding: 20px;
      margin: 20px;
      border: 1px solid #FF6F00;
      background-color: #FFFDE7;
      text-align: center;
    }
    .input-full-width {
      width: 80%;
      margin-bottom: 15px;
    }
    .output-box {
      border: 1px dashed #FFA000;
      padding: 15px;
      margin-top: 20px;
      background-color: #FFF8E1;
      text-align: left;
    }
    .warning {
      color: #D32F2F;
      font-weight: bold;
      margin-top: 20px;
      font-size: 0.9em;
    }
  `],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule
  ]
})
export class SanitizationDemoComponent {
  dangerousHtml: string = '<img src="x" onerror="alert(\'Inyección HTML!\')"/><b>Texto en negrita.</b>';
  safeHtml: SafeHtml = '';

  dangerousUrl: string = 'javascript:alert(\'URL Maliciosa\')';
  safeUrl: SafeUrl = '';

  constructor(private sanitizer: DomSanitizer) {
    // Inicializar con valores seguros por defecto (o vacíos)
    this.safeHtml = this.sanitizer.bypassSecurityTrustHtml(this.dangerousHtml); // Mostrar cómo se renderizaría al inicio
    this.safeUrl = this.sanitizer.bypassSecurityTrustUrl(this.dangerousUrl); // Mostrar cómo se comportaría la URL al inicio
  }

  sanitizeHtml(): void {
    // ESTO ES PARA DEMOSTRAR EL CONCEPTO. EN UN CASO REAL, NUNCA HARÍAS ESTO DIRECTAMENTE CON user input.
    // Solo si el HTML ya está validado y es de confianza.
    this.safeHtml = this.sanitizer.bypassSecurityTrustHtml(this.dangerousHtml);
    console.log('HTML sanitizado (o bypass):', this.safeHtml);
  }

  sanitizeUrl(): void {
    // Similar al HTML, bypass solo si la URL es de confianza.
    this.safeUrl = this.sanitizer.bypassSecurityTrustUrl(this.dangerousUrl);
    console.log('URL sanitizada (o bypass):', this.safeUrl);
  }
}

// src/app/app.component.html (ejemplo de uso)
/*
<app-sanitization-demo></app-sanitization-demo>
*/

/*
Errores comunes y consideraciones:

1.  **Uso indiscriminado de `bypassSecurityTrust...`**:
    Este es el error más grave. Nunca debes usar `bypassSecurityTrustHtml()` o métodos similares
    con contenido que no ha sido validado y "limpiado" por una fuente de confianza (ej., tu backend).
    Si lo haces con entrada de usuario directa, abres la puerta a ataques XSS.
    Angular te fuerza a hacer este bypass porque asume que es una operación peligrosa y que sabes lo que haces.

2.  **Confundir la sanitización con la validación**:
    La sanitización es la eliminación de elementos peligrosos. La validación es asegurar que el contenido
    cumple con las reglas de negocio (ej., una URL es realmente una URL válida, no solo un string).
    Ambos son necesarios, pero la sanitización en Angular se enfoca en la seguridad.

3.  **Depender únicamente de la sanitización del frontend**:
    Siempre que sea posible, el contenido generado por el usuario que se almacena y se muestra
    a otros usuarios debe ser sanitizado también en el servidor (backend). Esto proporciona
    una capa adicional de seguridad y protección contra ataques si el frontend es omitido
    o comprometido.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Seguridad en Angular',
    'subtopic': 'Manejo seguro de datos sensibles',
    'definition': r'''
Cuando tu aplicación Angular maneja información confidencial, como contraseñas, tokens de autenticación o datos personales de usuarios, el "manejo seguro de datos sensibles" se convierte en una prioridad absoluta. Esto implica adoptar prácticas que minimicen el riesgo de que esta información sea interceptada, almacenada de forma insegura o expuesta accidentalmente.

Seguramente pensarás de qué va todo esto. Pensemos por un momento en un banco que guarda tus ahorros. No los dejarían en una caja fuerte abierta a la vista de todos, ¿verdad? Utilizarían múltiples capas de seguridad: cámaras, alarmas, cajas fuertes robustas y acceso restringido. De manera similar, los datos sensibles en tu aplicación necesitan un "tratamiento especial" para protegerlos de ciberdelincuentes y brechas de seguridad.

El manejo seguro de datos sensibles en Angular abarca varias áreas clave:

* **No almacenar datos sensibles en LocalStorage o SessionStorage**:
    Aunque es conveniente, `localStorage` y `sessionStorage` son vulnerables a ataques XSS. Si un atacante logra inyectar código malicioso en tu página (a pesar de las defensas de Angular), ese script podría acceder fácilmente a cualquier dato almacenado allí. Esto incluye tokens de autenticación (JWT, OAuth), credenciales o cualquier información personal. La regla de oro es: si un atacante puede ejecutar JavaScript en tu sitio, puede leer cualquier cosa en `localStorage`.

* **Uso de cookies `HttpOnly` para tokens de autenticación**:
    Para tokens de sesión o JWTs, la mejor práctica es que el backend los envíe en cookies con el atributo `HttpOnly`. Esto significa que el navegador no permitirá que JavaScript acceda a esas cookies, mitigando significativamente el riesgo de robo de tokens a través de ataques XSS. El backend también debe configurar el atributo `Secure` (para que la cookie solo se envíe sobre HTTPS) y `SameSite` (para prevenir CSRF).

* **Comunicación siempre a través de HTTPS**:
    Todo el tráfico entre tu aplicación Angular (cliente) y tu backend (servidor) debe realizarse exclusivamente a través de HTTPS. HTTPS (HTTP Secure) cifra la comunicación, lo que previene que los atacantes intercepten y lean datos sensibles mientras viajan por la red (ataques "man-in-the-middle"). Si usas HTTP simple, cualquier persona en la misma red podría ver la información que envías, incluyendo contraseñas y otros datos privados.

* **Validación de entrada y salida**:
    Valida rigurosamente toda la entrada de usuario tanto en el frontend (Angular) como en el backend. Nunca confíes en los datos que vienen del cliente. Además, asegúrate de sanitizar y escapar correctamente cualquier dato que se muestre en el frontend para evitar inyecciones. Esto se relaciona directamente con el subtema anterior de sanitización de contenido.

* **Evitar registrar datos sensibles**:
    Nunca registres datos sensibles (contraseñas, números de tarjetas de crédito) en la consola del navegador o en los logs del servidor. Si necesitas depurar, usa herramientas seguras de depuración que no persistan la información.

* **Minimizar la vida útil de los tokens**:
    Los tokens de autenticación deben tener una vida útil corta. Esto reduce el riesgo de que un token robado pueda ser utilizado por un atacante durante mucho tiempo. Combina esto con tokens de actualización (refresh tokens) para permitir que los usuarios permanezcan conectados sin tener que volver a iniciar sesión constantemente.

* **Uso de Content Security Policy (CSP)**:
    Una CSP es una capa adicional de seguridad que ayuda a mitigar XSS y otras inyecciones de código. Permite a los desarrolladores especificar qué recursos externos (scripts, hojas de estilo, imágenes) pueden ser cargados por el navegador y desde dónde. Esto limita significativamente lo que un atacante puede hacer incluso si logra inyectar código.

El manejo seguro de datos sensibles es una responsabilidad compartida entre el desarrollo frontend (Angular), el desarrollo backend y la infraestructura. Empresas como Stripe (procesamiento de pagos) son un claro ejemplo de cómo la seguridad de los datos es el corazón de su negocio y por qué invierten tanto en ello.
''',
    'code_example': r'''
// --- EJEMPLO: MANEJO SEGURO DE DATOS SENSIBLES ---

// No hay código Angular directo para "proteger" datos sensibles de forma mágica,
// ya que la seguridad es una combinación de buenas prácticas en frontend, backend e infraestructura.
// Sin embargo, podemos ilustrar algunas prácticas.

// 1. **No almacenar datos sensibles en LocalStorage (Mala Práctica)**
// EJEMPLO DE CÓDIGO MALO (NO RECOMENDADO PARA DATOS SENSIBLES):
/*
// src/app/login/login.component.ts (NO HACER ESTO PARA TOKENS SENSIBLES)
import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  template: `<button (click)="login()">Login</button>`
})
export class LoginComponent {
  login(): void {
    // ¡NUNCA ALMACENES UN JWT ASÍ!
    localStorage.setItem('jwt_token', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c');
    console.log('Token JWT almacenado en LocalStorage (¡MALA PRÁCTICA!)');
  }
}
*/

// 2. **Comunicación siempre vía HTTPS (Configuración de Servidor Web)**
// Esto no es código Angular, es una configuración de tu servidor web (Nginx, Apache) o proveedor de hosting.
// DEBES ASEGURARTE DE QUE TU APLICACIÓN SE SIRVA SIEMPRE A TRAVÉS DE HTTPS.
/*
// Ejemplo conceptual de configuración de Nginx para forzar HTTPS
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name yourdomain.com;

    ssl_certificate /etc/nginx/ssl/yourdomain.com.crt;
    ssl_certificate_key /etc/nginx/ssl/yourdomain.com.key;

    location / {
        proxy_pass http://localhost:4200; # Tu aplicación Angular
        # ... otras configuraciones para Angular
    }
}
*/

// 3. **Uso de HttpInterceptor para añadir tokens desde cookies HttpOnly (si el backend los envía)**
// Si el backend envía el token JWT en una cookie HttpOnly, Angular HttpClient lo enviará automáticamente.
// Si necesitas un token de otra fuente (ej. un servicio que lo gestiona de forma segura),
// usarías un interceptor.
// Aquí un ejemplo de interceptor que podría añadir un token de un servicio (imaginario `AuthService`)

// src/app/auth/token.interceptor.ts
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
// import { AuthService } from './auth.service'; // Asume que tienes un AuthService

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  // constructor(private authService: AuthService) {} // Si usas un AuthService para obtener el token

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    // Si tienes un token gestionado de forma segura (ej. desde un servicio de autenticación
    // que lo obtuvo de una cookie HttpOnly o un sistema de almacenamiento seguro)
    // const authToken = this.authService.getAuthToken(); // Ejemplo
    const authToken = 'MY_SECURE_AUTH_TOKEN_FROM_SECURE_STORAGE'; // Placeholder

    if (authToken) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${authToken}`
        }
      });
    }
    return next.handle(request);
  }
}

// Para usar el interceptor, debes proveerlo en tu `app.module.ts`:
// src/app/app.module.ts
import { HTTP_INTERCEPTORS } from '@angular/common/http';

/*
@NgModule({
  // ...
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true // Es importante si tienes múltiples interceptores
    }
  ],
  // ...
})
export class AppModule { }
*/

// 4. **Implementación de Content Security Policy (CSP)**
// Esto se configura en el encabezado HTTP de la respuesta de tu servidor web, o en la etiqueta <meta> de tu index.html.
// Ejemplo en `index.html` (menos preferido para una seguridad estricta, pero funcional):
/*
<head>
  <meta http-equiv="Content-Security-Policy" content="
    default-src 'self';
    script-src 'self' 'unsafe-eval';
    style-src 'self' 'unsafe-inline';
    img-src 'self' data: https://via.placeholder.com;
    font-src 'self' https://fonts.gstatic.com;
    connect-src 'self' https://your-backend-api.com;
    object-src 'none';
    frame-ancestors 'none';
    base-uri 'self';
    form-action 'self';
  ">
</head>

// NOTA: 'unsafe-eval' y 'unsafe-inline' en script-src/style-src son a menudo necesarios
// para Angular en modo de desarrollo o para ciertas librerías, pero deben ser eliminados
// o minimizados en producción. Usar un servidor web para configurar CSP en el encabezado
// `Content-Security-Policy` es más robusto.
*/


/*
Errores comunes en el manejo de datos sensibles:

1.  **Almacenar JWT o tokens de sesión en `localStorage`**:
    Es un error muy común y expone tu aplicación a robo de tokens vía XSS.
    Prefiere cookies `HttpOnly` manejadas por el backend.

2.  **Enviar credenciales o tokens a través de HTTP sin cifrar**:
    Un grave fallo de seguridad. Siempre usa HTTPS.

3.  **No validar la entrada de usuario en el backend**:
    Aunque Angular ayuda en el frontend, la validación del lado del servidor es crucial
    para la seguridad de la base de datos y la lógica de negocio, ya que el cliente
    puede ser manipulado.

4.  **Registrar datos sensibles en la consola o en archivos de log**:
    Esto es una mina de oro para los atacantes que obtengan acceso a tus logs o al navegador del usuario.
    Evita a toda costa registrar contraseñas, PII (Información Personal Identificable),
    o tokens en texto plano.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Implementación de JWT',
    'definition': r'''
En el mundo de las aplicaciones web modernas, la "autenticación" es el proceso de verificar la identidad de un usuario (¿quién eres?), mientras que la "autorización" es el proceso de determinar qué permisos tiene ese usuario (¿qué puedes hacer?). Una de las formas más populares y eficientes de manejar la autenticación y autorización en aplicaciones de una sola página (SPA) como las construidas con Angular es mediante la "Implementación de JWT", o JSON Web Tokens.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una tarjeta de embarque para un vuelo. Contiene tu nombre, tu destino y tu asiento. No necesitas volver a identificarte en cada control de seguridad o en la puerta de embarque; solo muestras tu tarjeta y la información relevante ya está ahí. Un JWT funciona de manera similar para tu aplicación. Una vez que un usuario inicia sesión, el servidor le emite un JWT, que es como esa tarjeta de embarque digital. Este token encapsula la información del usuario de forma segura y firmada, permitiendo que el cliente lo presente en cada solicitud posterior al servidor para demostrar su identidad sin tener que enviar credenciales repetidamente.

Un JWT es un estándar abierto (RFC 7519) que define una forma compacta y autocontenida de transmitir información de forma segura entre partes como un objeto JSON. Se compone de tres partes, separadas por puntos, que están codificadas en Base64url:

1.  **Header (Cabecera)**: Contiene el tipo de token (JWT) y el algoritmo de firmado (ej., HMAC SHA256 o RSA).
2.  **Payload (Carga Útil)**: Aquí es donde se almacena la información (claims o declaraciones) sobre el usuario y el token. Puede incluir:
    * **Claims Registrados**: Nombres predefinidos como `iss` (emisor), `exp` (tiempo de expiración), `sub` (sujeto/ID de usuario).
    * **Claims Públicos**: Nombres definidos por los usuarios de JWTs.
    * **Claims Privados**: Acuerdos entre dos partes para compartir información.
3.  **Signature (Firma)**: Es la parte crucial que asegura la integridad del token. Se crea codificando el header y el payload, y luego firmando la cadena resultante con una clave secreta (conocida solo por el servidor) usando el algoritmo especificado en el header. Esto permite al servidor verificar que el token no ha sido alterado y que fue emitido por un servidor de confianza.

**¿Cómo funciona la implementación de JWT en Angular?**

1.  **Inicio de Sesión**: El usuario envía sus credenciales (nombre de usuario/contraseña) a tu backend.
2.  **Generación del JWT**: Si las credenciales son válidas, el backend genera un JWT, lo firma con su clave secreta y se lo envía al cliente.
3.  **Almacenamiento del JWT (¡con cuidado!)**: El cliente Angular recibe el JWT. Aquí es donde el manejo seguro de datos sensibles entra en juego: **lo ideal es que el backend envíe este JWT en una cookie HttpOnly** para mitigar ataques XSS. Si se almacena en `localStorage` o `sessionStorage`, es vulnerable.
4.  **Envío en solicitudes posteriores**: Para cada solicitud a recursos protegidos en el backend, Angular debe adjuntar el JWT en el encabezado `Authorization` como un token Bearer (ej., `Authorization: Bearer <tu_jwt_aqui>`). Esto se suele hacer con un `HttpInterceptor`.
5.  **Verificación en el Backend**: El backend recibe la solicitud, extrae el JWT del encabezado `Authorization`, verifica la firma (para asegurar que es válido y no ha sido alterado), y si es válido, procede con la solicitud.

La implementación de JWT es una solución escalable y sin estado, ideal para microservicios, ya que el servidor no necesita mantener el estado de la sesión. Es el método preferido por muchas empresas tecnológicas para sus APIs RESTful, como la forma en que Facebook y Google manejan la autenticación para muchas de sus aplicaciones.
''',
    'code_example': r'''
// --- EJEMPLO: IMPLEMENTACIÓN DE JWT EN ANGULAR ---

// Este ejemplo asume que tu backend ya está emitiendo JWTs.

// 1. Servicio de Autenticación (src/app/auth/auth.service.ts)
// Este servicio se encarga de manejar el inicio de sesión y el almacenamiento/recuperación del token.
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, tap } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  token: string;
  expiresIn: number; // En segundos
  // Otros datos del usuario si es necesario
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api'; // URL de tu backend
  private tokenSubject = new BehaviorSubject<string | null>(null);
  public currentToken = this.tokenSubject.asObservable();

  constructor(private http: HttpClient, private router: Router) {
    this.loadToken(); // Cargar el token al iniciar la aplicación
  }

  // Carga el token (idealmente de una cookie HttpOnly, aquí simulamos de LocalStorage para demostración)
  private loadToken(): void {
    const token = localStorage.getItem('jwt_token'); // ¡RECORDATORIO: LocalStorage NO es seguro para JWTs!
    if (token) {
      this.tokenSubject.next(token);
    }
  }

  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        // Almacenar el token. Idealmente, el backend configuraría una cookie HttpOnly.
        // Para demostración, usamos LocalStorage.
        localStorage.setItem('jwt_token', response.token); // ¡VULNERABLE A XSS!
        this.tokenSubject.next(response.token);
        // Opcional: configurar un temporizador para logout automático basado en expiresIn
      })
    );
  }

  logout(): void {
    localStorage.removeItem('jwt_token'); // Eliminar token
    this.tokenSubject.next(null);
    this.router.navigate(['/login']); // Redirigir al login
  }

  getToken(): string | null {
    return this.tokenSubject.value;
  }

  isLoggedIn(): boolean {
    // Comprobar si hay un token y si no ha expirado (validación más profunda requiere JWT-decode o backend)
    return !!this.getToken();
  }
}

// 2. Interceptor HTTP para adjuntar el JWT (src/app/auth/jwt.interceptor.ts)
// Esto es CRÍTICO para enviar el token en cada solicitud protegida.
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable()
export class JwtInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const token = this.authService.getToken();

    // Solo añade el token si existe y la URL no es la de login
    if (token && !request.url.includes('/login')) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${token}` // Estándar para JWT
        }
      });
    }
    return next.handle(request);
  }
}

// 3. Configuración en AppModule (src/app/app.module.ts)
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router'; // Para enrutamiento
import { JwtInterceptor } from './auth/jwt.interceptor';
import { LoginComponent } from './auth/login/login.component'; // Tu componente de login
import { DashboardComponent } from './dashboard/dashboard.component'; // Un componente protegido
import { AppRoutingModule } from './app-routing.module'; // Para organizar las rutas

@NgModule({
  declarations: [
    AppComponent,
    // Aquí van los componentes si no son standalone
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule, // Importa tu módulo de rutas
    LoginComponent, // Si es standalone
    DashboardComponent // Si es standalone
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: JwtInterceptor,
      multi: true // Es importante si tienes múltiples interceptores
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 4. Componente de Login (src/app/auth/login/login.component.ts)
import { Component } from '@angular/core';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-login',
  template: `
    <mat-card class="login-card">
      <mat-card-header>
        <mat-card-title>Iniciar Sesión</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <mat-form-field appearance="fill" class="full-width-input">
          <mat-label>Usuario</mat-label>
          <input matInput [(ngModel)]="username" name="username" required>
        </mat-form-field>
        <mat-form-field appearance="fill" class="full-width-input">
          <mat-label>Contraseña</mat-label>
          <input matInput type="password" [(ngModel)]="password" name="password" required>
        </mat-form-field>
      </mat-card-content>
      <mat-card-actions>
        <button mat-raised-button color="primary" (click)="onLogin()">Login</button>
      </mat-card-actions>
      <p *ngIf="errorMessage" class="error-message">{{ errorMessage }}</p>
    </mat-card>
  `,
  styles: [`
    .login-card {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    .full-width-input {
      width: 100%;
    }
    .error-message {
      color: red;
      margin-top: 10px;
    }
  `],
  standalone: true,
  imports: [
    CommonModule, FormsModule, MatInputModule, MatFormFieldModule, MatButtonModule, MatCardModule
  ]
})
export class LoginComponent {
  username = '';
  password = '';
  errorMessage: string | null = null;

  constructor(private authService: AuthService, private router: Router) {}

  onLogin(): void {
    this.authService.login({ username: this.username, password: this.password }).subscribe({
      next: () => {
        this.router.navigate(['/dashboard']);
      },
      error: (err) => {
        this.errorMessage = 'Credenciales inválidas o error de red.';
        console.error('Error de login:', err);
      }
    });
  }
}

// 5. Un Componente Protegido (src/app/dashboard/dashboard.component.ts)
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-dashboard',
  template: `
    <mat-card class="dashboard-card">
      <mat-card-header>
        <mat-card-title>Dashboard Seguro</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>¡Bienvenido! Has accedido a un recurso protegido.</p>
        <p *ngIf="data">Datos protegidos: {{ data }}</p>
        <button mat-raised-button color="accent" (click)="fetchProtectedData()">
          Obtener Datos Protegidos
        </button>
        <button mat-raised-button color="warn" (click)="authService.logout()">
          Cerrar Sesión
        </button>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .dashboard-card {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    button { margin: 10px; }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule]
})
export class DashboardComponent implements OnInit {
  data: string | null = null;
  private apiUrl = 'http://localhost:3000/api'; // URL de tu backend

  constructor(private http: HttpClient, public authService: AuthService) {}

  ngOnInit(): void {
    // Al cargar el dashboard, podríamos intentar obtener datos protegidos
    this.fetchProtectedData();
  }

  fetchProtectedData(): void {
    this.http.get(`${this.apiUrl}/protected-data`).subscribe({
      next: (response: any) => {
        this.data = JSON.stringify(response);
      },
      error: (err) => {
        this.data = 'Error al cargar datos protegidos: ' + err.message;
        console.error('Error fetching protected data:', err);
      }
    });
  }
}

// 6. Configuración de Rutas (src/app/app-routing.module.ts)
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AuthGuard } from './auth/auth.guard'; // Para el siguiente subtema

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] }, // Proteger con Guard
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: '**', redirectTo: '/dashboard' } // Ruta comodín
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }


/*
Errores comunes en la implementación de JWT:

1.  **Almacenar el JWT en `localStorage` o `sessionStorage`**:
    Como se mencionó, esto es una vulnerabilidad grave. Si tu aplicación es
    susceptible a XSS, un atacante puede robar fácilmente el token.
    La mejor práctica es usar cookies `HttpOnly` y `Secure` manejadas por el backend.

2.  **No configurar el interceptor HTTP**:
    Olvidar configurar el `JwtInterceptor` significa que tu aplicación no enviará
    el token en las solicitudes protegidas, y el backend denegará el acceso.

3.  **No validar la expiración del token en el cliente (solo confiar en el backend)**:
    Aunque el backend es el lugar principal para validar la expiración, es una buena práctica
    que el cliente sepa cuándo el token ha expirado para redirigir al usuario o refrescarlo.
    Librerías como `jwt-decode` (con precaución) pueden ayudar, pero la validación final
    siempre la debe hacer el servidor.

4.  **No implementar un mecanismo de refresco de token**:
    Si usas tokens de corta duración (recomendado por seguridad), necesitarás un
    mecanismo para obtener nuevos tokens sin que el usuario tenga que iniciar sesión
    repetidamente, generalmente con tokens de refresco (refresh tokens) manejados
    de forma segura en el backend.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Guards para rutas protegidas',
    'definition': r'''
Una vez que has implementado la autenticación en tu aplicación Angular, el siguiente paso lógico es la "autorización". ¿Cómo te aseguras de que solo los usuarios autenticados, o aquellos con roles específicos, puedan acceder a ciertas partes de tu aplicación? Aquí es donde entran en juego los "Guards para rutas protegidas", que son una característica fundamental del enrutador de Angular para controlar la navegación.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un club nocturno con diferentes áreas VIP. No todo el mundo puede entrar a esas áreas. Necesitas un portero o un sistema de seguridad que verifique tu identificación y tus permisos antes de dejarte pasar. Los Guards de rutas en Angular son esos "porteros". Antes de que un usuario pueda acceder a una ruta, un Guard puede intervenir para verificar si está autenticado, si tiene los roles necesarios o si cumple con alguna otra condición. Si no cumple, el Guard puede redirigirlo a otra página (como la de inicio de sesión) o simplemente bloquear el acceso.

Angular proporciona varios tipos de Guards, siendo los más comunes:

* **`CanActivate`**: Este Guard es el más utilizado. Determina si una ruta puede ser activada. Es ideal para verificar si un usuario está autenticado o tiene un rol específico antes de cargar el componente de la ruta. Por ejemplo, antes de ir al "Dashboard", verifica si el usuario ha iniciado sesión.
* **`CanActivateChild`**: Similar a `CanActivate`, pero se aplica a rutas hijas. Si tienes rutas anidadas, puedes usar este Guard para proteger todas las rutas hijas con una sola verificación.
* **`CanLoad`**: Este Guard determina si un módulo completo puede ser cargado (útil con Lazy Loading). Es aún más eficiente que `CanActivate` porque evita la descarga del módulo completo si el usuario no tiene permisos, ahorrando ancho de banda.
* **`CanDeactivate`**: Permite controlar si un usuario puede abandonar una ruta. Es útil para confirmar si un usuario quiere salir de un formulario sin guardar los cambios, o para realizar alguna limpieza antes de la navegación.
* **`CanMatch`**: Introducido en Angular 15, es una alternativa más flexible a `CanLoad` y `CanActivate` para decidir si una ruta debe coincidir con una URL. Permite una lógica de coincidencia más compleja que puede depender de la autenticación, los permisos, el tamaño de la pantalla, etc., antes de siquiera considerar el componente.

**¿Cómo funcionan?**

Los Guards son servicios inyectables que implementan una de estas interfaces. La interfaz requiere que el Guard tenga un método (ej., `canActivate()`) que devuelve un `boolean`, un `UrlTree` (para redirigir), un `Observable<boolean | UrlTree>` o una `Promise<boolean | UrlTree>`.

Si el método devuelve `true`, la navegación continúa. Si devuelve `false`, la navegación se cancela. Si devuelve un `UrlTree`, la navegación se redirige a la URL especificada por el `UrlTree`. Esto permite un control muy granular sobre el flujo de navegación de tu aplicación basado en la lógica de autenticación y autorización.

La implementación de Guards es una práctica estándar en cualquier aplicación Angular que necesite controlar el acceso a sus recursos. Empresas como Netflix utilizan Guards para asegurarse de que solo los suscriptores activos puedan ver contenido, y solo los administradores puedan acceder a paneles de gestión.
''',
    'code_example': r'''
// --- EJEMPLO: GUARDS PARA RUTAS PROTEGIDAS ---

// 1. Crear un Guard de Autenticación (src/app/auth/auth.guard.ts)
// Este guard verificará si el usuario está logueado.

import { Injectable } from '@angular/core';
import { CanActivate, Router, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    if (this.authService.isLoggedIn()) {
      return true; // El usuario está autenticado, permitir acceso a la ruta
    } else {
      // El usuario NO está autenticado, redirigir a la página de login
      alert('Debes iniciar sesión para acceder a esta página.');
      return this.router.createUrlTree(['/login']); // Redirigir usando UrlTree
    }
  }
}

// 2. Aplicar el Guard a las Rutas (src/app/app-routing.module.ts)
// Ya lo habíamos configurado en el subtema anterior, pero aquí está el detalle.

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AuthGuard } from './auth/auth.guard'; // Importar el Guard

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  // Proteger la ruta '/dashboard' con AuthGuard
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: '**', redirectTo: '/dashboard' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// 3. Ejemplo de Componente de Panel de Administración (protegido por un Guard de Roles)
// src/app/admin/admin-dashboard.component.ts (un componente nuevo)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-admin-dashboard',
  template: `
    <mat-card class="admin-card">
      <mat-card-header>
        <mat-card-title>Panel de Administración</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>¡Bienvenido, Administrador! Aquí puedes gestionar todo.</p>
        <p>Este es un recurso solo para usuarios con rol de administrador.</p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .admin-card {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
      background-color: #FBE9E7;
      border: 1px solid #FF5722;
    }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule]
})
export class AdminDashboardComponent { }

// 4. Guard de Roles (src/app/auth/role.guard.ts)
// Este guard verificará si el usuario tiene un rol específico.
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class RoleGuard implements CanActivate {

  constructor(private authService: AuthService, private router: Router) {}

  canActivate(
    route: ActivatedRouteSnapshot, // Para obtener parámetros de la ruta, como el rol requerido
    state: RouterStateSnapshot
  ): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    const requiredRole = route.data['role']; // Obtener el rol requerido de la data de la ruta

    if (!requiredRole) {
      // Si no se especifica un rol requerido, permitir acceso (o manejar como error)
      return true;
    }

    const userRoles = this.authService.getUserRoles(); // Asume que AuthService tiene este método

    if (this.authService.isLoggedIn() && userRoles.includes(requiredRole)) {
      return true; // Usuario logueado y con el rol necesario
    } else {
      alert('No tienes los permisos necesarios para acceder a esta página.');
      return this.router.createUrlTree(['/dashboard']); // Redirigir a una página menos restringida
    }
  }
}

// 5. Modificación del AuthService para incluir roles (src/app/auth/auth.service.ts)
// (Solo la parte relevante modificada)
/*
// ... otras importaciones y código
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, tap } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  token: string;
  expiresIn: number;
  roles: string[]; // <-- Añadimos roles a la respuesta de autenticación
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';
  private tokenSubject = new BehaviorSubject<string | null>(null);
  public currentToken = this.tokenSubject.asObservable();
  private userRolesSubject = new BehaviorSubject<string[]>([]); // Para almacenar los roles
  public currentUserRoles = this.userRolesSubject.asObservable();

  constructor(private http: HttpClient, private router: Router) {
    this.loadToken();
    this.loadUserRoles(); // Cargar roles al inicio
  }

  private loadToken(): void {
    const token = localStorage.getItem('jwt_token');
    if (token) {
      this.tokenSubject.next(token);
    }
  }

  private loadUserRoles(): void {
    const rolesJson = localStorage.getItem('user_roles'); // ¡Igualmente vulnerable a XSS si se usa LocalStorage!
    if (rolesJson) {
      this.userRolesSubject.next(JSON.parse(rolesJson));
    }
  }

  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        localStorage.setItem('jwt_token', response.token);
        localStorage.setItem('user_roles', JSON.stringify(response.roles)); // Almacenar roles
        this.tokenSubject.next(response.token);
        this.userRolesSubject.next(response.roles);
      })
    );
  }

  logout(): void {
    localStorage.removeItem('jwt_token');
    localStorage.removeItem('user_roles');
    this.tokenSubject.next(null);
    this.userRolesSubject.next([]);
    this.router.navigate(['/login']);
  }

  getToken(): string | null {
    return this.tokenSubject.value;
  }

  isLoggedIn(): boolean {
    return !!this.getToken();
  }

  getUserRoles(): string[] {
    return this.userRolesSubject.value;
  }

  // Opcional: verificar si el usuario tiene un rol específico
  hasRole(role: string): boolean {
    return this.getUserRoles().includes(role);
  }
}
*/

// 6. Actualizar AppRoutingModule para incluir el nuevo Guard de Roles
// src/app/app-routing.module.ts
/*
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AdminDashboardComponent } from './admin/admin-dashboard.component'; // Nuevo componente
import { AuthGuard } from './auth/auth.guard';
import { RoleGuard } from './auth/role.guard'; // Importar el nuevo Guard de Roles

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthGuard] // Solo necesita estar autenticado
  },
  {
    path: 'admin',
    component: AdminDashboardComponent,
    canActivate: [AuthGuard, RoleGuard], // Necesita estar autenticado Y tener el rol
    data: { role: 'admin' } // Pasa el rol requerido al Guard
  },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: '**', redirectTo: '/dashboard' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
*/

/*
Errores comunes al usar Guards:

1.  **Olvidar registrar el Guard en `providers`**:
    Si tu Guard no tiene `providedIn: 'root'`, debes asegurarte de que esté
    registrado en el array `providers` de tu `AppModule` o un módulo relevante.
    Si es standalone, `providedIn: 'root'` es el enfoque más limpio.

2.  **No manejar la redirección o el bloqueo**:
    Un Guard debe retornar `true` para permitir, `false` para bloquear, o un
    `UrlTree` para redirigir. Olvidar redirigir en caso de acceso denegado
    puede dejar al usuario en una página en blanco o mostrar un error de ruta.

3.  **Lógica compleja dentro del Guard**:
    Los Guards deben ser lo más ligeros posible. La lógica pesada, como
    llamadas a API, debe ser manejada por Resolvers (`CanResolve`) si se trata
    de precargar datos, o por servicios inyectados en el Guard si es una verificación
    compleja.

4.  **No considerar la experiencia del usuario**:
    Cuando se niega el acceso, es importante notificar al usuario (ej., con un `alert()`
    o un mensaje en la UI) por qué no puede acceder a una página.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Integración con servicios de autenticación externos',
    'definition': r'''
Mientras que implementar tu propia autenticación con JWT es una opción, muchas aplicaciones modernas optan por la "integración con servicios de autenticación externos". Esto significa delegar la complejidad del inicio de sesión, la gestión de usuarios y a menudo la seguridad a un tercero especializado.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en una tienda online que ofrece múltiples opciones de pago: tarjeta de crédito, PayPal, Google Pay. La tienda no desarrolla su propio sistema de procesamiento de pagos desde cero; en su lugar, se integra con servicios externos de confianza que ya manejan la seguridad, la normativa y la complejidad de las transacciones. De manera similar, los servicios de autenticación externos como Auth0, Okta, Firebase Authentication o Amazon Cognito son como esos procesadores de pagos, pero para la identidad de los usuarios. Te permiten centrarte en la lógica de tu aplicación en lugar de reinventar la rueda de la autenticación, que es un campo muy delicado y propenso a errores de seguridad si no se hace bien.

Estos servicios de autenticación externos ofrecen varias ventajas:

* **Seguridad Mejorada**: Están construidos por expertos en seguridad y siguen las mejores prácticas para la gestión de contraseñas, cifrado, multifactor authentication (MFA) y prevención de ataques.
* **Cumplimiento Normativo**: Ayudan a cumplir con regulaciones de privacidad y seguridad de datos (GDPR, HIPAA, etc.).
* **Múltiples Opciones de Inicio de Sesión**: Permiten ofrecer inicio de sesión con redes sociales (Google, Facebook), inicio de sesión sin contraseña (magic links, OTP), y otras opciones.
* **Escalabilidad**: Pueden manejar millones de usuarios sin problemas de rendimiento.
* **Reducción de Carga de Desarrollo**: Ahorran un tiempo considerable al no tener que desarrollar y mantener un sistema de autenticación propio.
* **Funcionalidades Adicionales**: A menudo incluyen gestión de usuarios, restablecimiento de contraseñas, verificación de correo electrónico, autorización basada en roles y mucho más.

**¿Cómo funciona la integración?**

La mayoría de estos servicios utilizan protocolos estándar de la industria como:

* **OAuth 2.0**: Es un marco de autorización que permite a una aplicación (cliente) obtener acceso limitado a los recursos de un usuario en un servidor de recursos, en nombre del usuario y con su aprobación. No es un protocolo de autenticación en sí mismo, pero es la base sobre la mayoría de los flujos de autenticación modernos.
* **OpenID Connect (OIDC)**: Construido sobre OAuth 2.0, OIDC añade una capa de autenticación. Permite a los clientes verificar la identidad del usuario basándose en la autenticación realizada por un servidor de autorización, así como obtener información básica del perfil del usuario de una manera interoperable y basada en REST. Cuando un usuario inicia sesión con "Iniciar sesión con Google", suele ser un flujo OIDC/OAuth 2.0.

En Angular, la integración generalmente implica:

1.  **Redirección a la Plataforma de Autenticación**: Cuando un usuario hace clic en "Iniciar sesión", tu aplicación Angular lo redirige al servicio de autenticación externo.
2.  **Autenticación del Usuario**: El usuario inicia sesión en la plataforma externa (con su correo/contraseña, Google, etc.).
3.  **Redirección con Tokens**: Una vez autenticado, el servicio externo redirige al usuario de vuelta a tu aplicación Angular, incluyendo tokens (JWTs) en la URL (parámetros de consulta o hash) o a través de una cookie.
4.  **Procesamiento de Tokens**: Tu aplicación Angular procesa estos tokens (ID Token para identidad, Access Token para autorización) y los utiliza para autenticar al usuario en tu propia API o para acceder a recursos protegidos.
5.  **Gestión de Sesiones**: El estado de autenticación del usuario se gestiona en el cliente, a menudo usando un servicio de autenticación en Angular que envuelve la lógica del proveedor externo.

La integración con estos servicios es una decisión inteligente para la mayoría de las aplicaciones, ya que la seguridad es una carrera de armamentos constante, y delegar esta parte a proveedores especializados te libera para concentrarte en el valor central de tu producto. Empresas como Airbnb o Spotify no gestionan su propia autenticación de usuarios; se apoyan en estos proveedores para asegurar que millones de usuarios inicien sesión de forma segura.
''',
    'code_example': r'''
// --- EJEMPLO: INTEGRACIÓN CON SERVICIOS DE AUTENTICACIÓN EXTERNOS (Conceptual con Auth0) ---

// Este ejemplo es conceptual y requiere un setup real con un proveedor de autenticación
// como Auth0, Okta, Firebase Authentication, etc.
// Los pasos exactos varían según el proveedor, pero la lógica general es similar.

// 1. **Instalar la librería del proveedor (ej., Auth0 Angular SDK)**
// ng add @auth0/auth0-angular

// 2. **Configuración en AppModule (src/app/app.module.ts)**
// Se configura el SDK del proveedor con tus credenciales.

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { AuthModule } from '@auth0/auth0-angular'; // Importar el módulo de Auth0
import { environment } from '../environments/environment'; // Para tus credenciales
import { AppRoutingModule } from './app-routing.module';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthHttpInterceptor } from '@auth0/auth0-angular'; // Interceptor de Auth0

// Componentes de ejemplo para demostrar flujos
import { Auth0LoginComponent } from './auth0-login/auth0-login.component';
import { Auth0ProfileComponent } from './auth0-profile/auth0-profile.component';
import { Auth0ProtectedComponent } from './auth0-protected/auth0-protected.component';

@NgModule({
  declarations: [
    AppComponent,
    // Componentes si no son standalone
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AppRoutingModule,
    // Configura Auth0Module con tus credenciales
    AuthModule.forRoot({
      domain: environment.auth0.domain, // Tu dominio de Auth0
      clientId: environment.auth0.clientId, // Tu ID de cliente de Auth0
      authorizationParams: {
        redirect_uri: window.location.origin, // La URL a la que Auth0 redirigirá después del login
        audience: environment.auth0.audience, // Si usas una API protegida con Auth0
      }
    }),
    Auth0LoginComponent, // Si es standalone
    Auth0ProfileComponent, // Si es standalone
    Auth0ProtectedComponent // Si es standalone
  ],
  providers: [
    // El interceptor de Auth0 adjunta automáticamente el Access Token a las peticiones
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthHttpInterceptor,
      multi: true,
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// src/environments/environment.ts
export const environment = {
  production: false,
  auth0: {
    domain: 'YOUR_AUTH0_DOMAIN.us.auth0.com', // Reemplaza con tu dominio de Auth0
    clientId: 'YOUR_AUTH0_CLIENT_ID', // Reemplaza con tu ID de Cliente de Auth0
    audience: 'https://your-api-identifier', // Reemplaza con el identificador de tu API si tienes
  }
};


// 3. **Componente de Login/Logout (src/app/auth0-login/auth0-login.component.ts)**
// Utiliza el servicio `AuthService` de Auth0 para gestionar el login/logout.

import { Component, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { AuthService } from '@auth0/auth0-angular';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-auth0-login',
  template: `
    <mat-card class="auth-card">
      <mat-card-header>
        <mat-card-title>Autenticación con Auth0</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <ng-container *ngIf="auth.isAuthenticated$ | async; else loggedOut">
          <button mat-raised-button color="warn" (click)="auth.logout({ logoutParams: { returnTo: document.location.origin } })">
            Cerrar Sesión
          </button>
        </ng-container>

        <ng-template #loggedOut>
          <button mat-raised-button color="primary" (click)="auth.loginWithRedirect()">
            Iniciar Sesión
          </button>
        </ng-template>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .auth-card {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
  `],
  standalone: true,
  imports: [CommonModule, MatButtonModule, MatCardModule]
})
export class Auth0LoginComponent {
  constructor(public auth: AuthService, @Inject(DOCUMENT) public document: Document) {}
}


// 4. **Componente de Perfil (src/app/auth0-profile/auth0-profile.component.ts)**
// Para mostrar información del usuario autenticado.

import { Component, OnInit } from '@angular/core';
import { AuthService } from '@auth0/auth0-angular';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-auth0-profile',
  template: `
    <mat-card class="profile-card">
      <mat-card-header>
        <mat-card-title>Perfil de Usuario</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <div *ngIf="auth.user$ | async as profile">
          <img [src]="profile.picture" alt="Avatar" class="profile-avatar">
          <h2>{{ profile.name }}</h2>
          <p>{{ profile.email }}</p>
          <pre>{{ profile | json }}</pre>
        </div>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .profile-card {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    .profile-avatar {
      border-radius: 50%;
      width: 100px;
      height: 100px;
      margin-bottom: 15px;
    }
    pre {
      background-color: #f5f5f5;
      padding: 10px;
      border-radius: 5px;
      text-align: left;
      overflow-x: auto;
    }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule]
})
export class Auth0ProfileComponent implements OnInit {
  constructor(public auth: AuthService) {}
  ngOnInit(): void {}
}


// 5. **Componente Protegido con Acceso a API (src/app/auth0-protected/auth0-protected.component.ts)**
// Demuestra cómo el interceptor de Auth0 añade automáticamente el token a las llamadas HTTP.

import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-auth0-protected',
  template: `
    <mat-card class="protected-card">
      <mat-card-header>
        <mat-card-title>Recurso Protegido por API</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>Este contenido requiere autenticación para acceder a la API.</p>
        <button mat-raised-button color="primary" (click)="callProtectedApi()">
          Llamar API Protegida
        </button>
        <p *ngIf="apiResponse">Respuesta de la API: {{ apiResponse }}</p>
        <p *ngIf="apiError" class="error-message">Error de API: {{ apiError }}</p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .protected-card {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    .error-message { color: red; margin-top: 10px; }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule]
})
export class Auth0ProtectedComponent {
  apiResponse: string | null = null;
  apiError: string | null = null;
  private protectedApiUrl = 'http://localhost:3000/api/protected-resource'; // Tu API protegida

  constructor(private http: HttpClient) {}

  callProtectedApi(): void {
    this.apiResponse = null;
    this.apiError = null;
    this.http.get(this.protectedApiUrl).subscribe({
      next: (data: any) => {
        this.apiResponse = JSON.stringify(data);
      },
      error: (err) => {
        this.apiError = err.message;
        console.error('Error calling protected API:', err);
      }
    });
  }
}

// 6. Configuración de Rutas (src/app/app-routing.module.ts)
// Usar un Guard de Auth0 (AuthGuard) para proteger rutas.
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Auth0LoginComponent } from './auth0-login/auth0-login.component';
import { Auth0ProfileComponent } from './auth0-profile/auth0-profile.component';
import { Auth0ProtectedComponent } from './auth0-protected/auth0-protected.component';
import { AuthGuard } from '@auth0/auth0-angular'; // Guard proporcionado por Auth0 SDK

const routes: Routes = [
  { path: 'login', component: Auth0LoginComponent },
  { path: 'profile', component: Auth0ProfileComponent, canActivate: [AuthGuard] },
  { path: 'protected', component: Auth0ProtectedComponent, canActivate: [AuthGuard] },
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', redirectTo: '/login' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// src/app/app.component.html (ejemplo de uso)
/*
<nav>
  <a routerLink="/login">Login/Logout</a> |
  <a routerLink="/profile">Perfil</a> |
  <a routerLink="/protected">Recurso Protegido</a>
</nav>
<router-outlet></router-outlet>
*/


/*
Errores comunes al integrar servicios de autenticación externos:

1.  **Configuración incorrecta del SDK**:
    Errores en el `domain`, `clientId`, `redirect_uri` o `audience` pueden causar que el
    flujo de autenticación falle o que la aplicación no reciba los tokens correctamente.
    Revisa siempre la documentación del proveedor.

2.  **No usar el interceptor del proveedor**:
    Si el proveedor ofrece un interceptor HTTP (como `@auth0/auth0-angular` lo hace),
    es crucial usarlo. Este interceptor se encarga de adjuntar automáticamente el
    Access Token a las solicitudes a tus APIs protegidas, lo cual es un paso clave
    en la autorización.

3.  **Manejo incorrecto de los callbacks de redirección**:
    Después de la autenticación, el proveedor redirige de nuevo a tu aplicación.
    Asegúrate de que tu aplicación Angular esté configurada para manejar esta redirección
    y procesar los tokens adecuadamente. Los SDKs generalmente se encargan de esto.

4.  **Olvidar proteger las APIs del backend**:
    Aunque el frontend se integra con el servicio externo, tus propias APIs de backend
    también deben validar los tokens (JWTs) que el frontend les envía. El servicio
    de autenticación externo solo maneja el inicio de sesión; la autorización de tus
    recursos sigue siendo responsabilidad de tu backend.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Manejo de Sesiones',
    'subtopic': 'Almacenamiento de tokens',
    'definition': r'''
El "almacenamiento de tokens" es una decisión crítica en el desarrollo de aplicaciones Angular que utilizan JWTs o cualquier otro tipo de token para la autenticación y autorización. La forma en que guardas estos tokens puede tener un impacto masivo en la seguridad de tu aplicación.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en las llaves de tu casa o tu tarjeta de crédito. No las dejarías a la vista en la calle, ¿verdad? Las guardarías en un lugar seguro. De la misma manera, los tokens de autenticación son como las llaves de acceso a los recursos de tu usuario. Si un atacante logra robar estos tokens, podría suplantar la identidad del usuario y realizar acciones no autorizadas en su nombre. Por eso, el lugar y la forma en que almacenas tus tokens son fundamentales para la seguridad.

Existen varias opciones para almacenar tokens en el lado del cliente, cada una con sus pros y sus contras en términos de seguridad:

* **`localStorage` y `sessionStorage`**:
    * **Pros**: Fáciles de usar, persistentes (localStorage), accesibles vía JavaScript.
    * **Contras (MUY IMPORTANTES)**: **Vulnerables a ataques XSS (Cross-Site Scripting)**. Si un atacante inyecta un script malicioso en tu página, puede acceder fácilmente a cualquier dato almacenado en `localStorage` o `sessionStorage`. Esto los hace una opción insegura para almacenar JWTs o cualquier dato sensible si no estás seguro de la protección XSS en cada rincón de tu aplicación. La mayoría de los expertos en seguridad web desaconsejan su uso para tokens de sesión.

* **Cookies (especialmente con el flag `HttpOnly`)**:
    * **Pros**:
        * **`HttpOnly`**: Las cookies marcadas con `HttpOnly` no pueden ser accedidas por JavaScript. Esto significa que incluso si un atacante logra inyectar un script XSS, no podrá robar el token de la cookie. Esta es la principal ventaja de seguridad.
        * **`Secure`**: Asegura que la cookie solo se envíe a través de conexiones HTTPS (cifradas), protegiendo contra ataques "man-in-the-middle".
        * **`SameSite`**: Ayuda a mitigar ataques CSRF (Cross-Site Request Forgery) controlando cuándo la cookie se envía con solicitudes de origen cruzado.
        * Las cookies se envían automáticamente con cada solicitud HTTP al mismo dominio, simplificando la gestión en el frontend (no necesitas un interceptor para añadir el token, aunque sí para otras cosas).
    * **Contras**: Requiere que el backend configure la cookie con los flags correctos. Puede ser un poco más complejo de manejar en el frontend si necesitas leer información del token (tendrías que decodificar el JWT en el backend o enviar claims adicionales no sensibles). Las cookies tienen un límite de tamaño más pequeño que `localStorage`.

* **Memoria de la aplicación (en un servicio, variables de TypeScript)**:
    * **Pros**: Es la opción más segura contra XSS, ya que el token nunca se persiste en el disco del cliente y solo existe en la memoria mientras la aplicación está abierta.
    * **Contras**: El token se pierde cada vez que el usuario cierra la pestaña, el navegador o refresca la página, lo que significa que el usuario tendrá que volver a iniciar sesión constantemente. Esto no es ideal para la experiencia de usuario en la mayoría de las aplicaciones.

**Recomendación general**: Para tokens de autenticación (como JWTs que se usan para autorizar llamadas a la API), la opción preferida por la comunidad de seguridad es que el **backend los envíe en cookies `HttpOnly` y `Secure`**. Esto significa que Angular no "ve" el token directamente, pero el navegador lo adjunta automáticamente a las solicitudes. Si necesitas acceder a datos del token en el cliente (ej., ID de usuario o rol), el backend debería enviar esta información por separado (y de forma no sensible) o el token se podría decodificar en el backend y los claims pasarse al frontend.

Aunque `localStorage` es conveniente, su uso para tokens de autenticación es un riesgo que muchas empresas no están dispuestas a asumir, especialmente aquellas que manejan datos sensibles de usuarios, como bancos o plataformas de salud.
''',
    'code_example': r'''
// --- EJEMPLO: ALMACENAMIENTO DE TOKENS (Ilustrando opciones) ---

// Este ejemplo NO pretende que uses LocalStorage para tokens sensibles,
// sino que ilustra las diferentes formas de almacenar y acceder a tokens,
// y enfatiza las mejores prácticas.

// 1. Servicio de Autenticación Modificado (src/app/auth/auth.service.ts)
// Se centra en cómo se obtendría y "almacenaría" el token.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, tap } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  accessToken: string; // Renombrado a accessToken para claridad
  refreshToken?: string; // Para renovación (siguiente subtema)
  expiresIn: number;
  roles?: string[];
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';
  private accessTokenSubject = new BehaviorSubject<string | null>(null);
  public currentAccessToken = this.accessTokenSubject.asObservable();

  // Opción 1: Almacenar en memoria (más seguro contra XSS, pero no persistente)
  private inMemoryToken: string | null = null;

  constructor(private http: HttpClient, private router: Router) {
    // Si usaras LocalStorage (NO RECOMENDADO para tokens sensibles), lo cargarías aquí
    // this.loadTokenFromLocalStorage();
  }

  // --- Método para simular el inicio de sesión y el "almacenamiento" del token ---
  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        // Opción A: Almacenamiento en LocalStorage (¡MALA PRÁCTICA PARA TOKENS SENSIBLES!)
        // localStorage.setItem('jwt_access_token', response.accessToken);
        // this.accessTokenSubject.next(response.accessToken);
        // console.warn('Advertencia: Token almacenado en LocalStorage. Considera HttpOnly cookies.');

        // Opción B: Almacenamiento en memoria (más seguro contra XSS, pero volátil)
        this.inMemoryToken = response.accessToken;
        this.accessTokenSubject.next(response.accessToken);
        console.log('Token almacenado en memoria. Se perderá al recargar.');

        // Opción C (IDEAL): El backend configura una cookie HttpOnly.
        // En este caso, no hay código aquí para "almacenar" el token en el cliente.
        // El navegador lo gestiona automáticamente y lo envía con cada petición.
        // El `AuthService` solo necesitaría un método para verificar si el usuario está
        // autenticado, quizás consultando al backend o verificando el estado de la sesión.
      })
    );
  }

  logout(): void {
    // Si usaras LocalStorage:
    // localStorage.removeItem('jwt_access_token');

    // Si usaras memoria:
    this.inMemoryToken = null;

    this.accessTokenSubject.next(null);
    this.router.navigate(['/login']);
    console.log('Sesión cerrada. Token eliminado del almacenamiento.');
  }

  getAccessToken(): string | null {
    // Prioridad: memoria (si existe) > LocalStorage (si se usara) > null
    return this.inMemoryToken; // || localStorage.getItem('jwt_access_token');
  }

  isLoggedIn(): boolean {
    // Para cookies HttpOnly, esta verificación podría implicar una llamada al backend
    // o depender del estado de la sesión del servidor (si el backend lo expone).
    // Para memoria/LocalStorage, simplemente verifica la existencia del token.
    return !!this.getAccessToken();
  }

  // --- Métodos de demostración para LocalStorage (NO USAR EN PRODUCCIÓN CON DATOS SENSIBLES) ---
  private loadTokenFromLocalStorage(): void {
    const token = localStorage.getItem('jwt_access_token');
    if (token) {
      this.accessTokenSubject.next(token);
      this.inMemoryToken = token; // Sincroniza si decides usar ambas, aunque no es ideal
      console.warn('Token JWT cargado de LocalStorage. ¡VULNERABLE A XSS!');
    }
  }

  saveTokenToLocalStorage(token: string): void {
    localStorage.setItem('jwt_access_token', token);
    this.accessTokenSubject.next(token);
    this.inMemoryToken = token;
    console.warn('Token JWT guardado en LocalStorage. ¡VULNERABLE A XSS!');
  }

  // Para ilustrar cómo un atacante XSS podría robar un token de LocalStorage:
  // Este código se ejecutaría si un atacante inyectara un script en tu página:
  simulateXssAttack(): void {
    const stolenToken = localStorage.getItem('jwt_access_token');
    if (stolenToken) {
      alert(`¡ATENCIÓN! Token JWT robado por XSS: ${stolenToken.substring(0, 30)}...`);
      console.error('Simulación de ataque XSS: Token robado de LocalStorage!', stolenToken);
      // Aquí el atacante lo enviaría a su servidor
    } else {
      alert('No hay token en LocalStorage para robar.');
    }
  }
}

// 2. Componente de Demostración (src/app/token-storage-demo/token-storage-demo.component.ts)
import { Component } from '@angular/core';
import { AuthService } from '../auth/auth.service';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-token-storage-demo',
  template: `
    <mat-card class="token-storage-card">
      <mat-card-header>
        <mat-card-title>Demostración de Almacenamiento de Tokens</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>Estado del Login:
          <span [ngClass]="{'logged-in': authService.isLoggedIn(), 'logged-out': !authService.isLoggedIn()}">
            {{ authService.isLoggedIn() ? 'Logueado' : 'Deslogueado' }}
          </span>
        </p>
        <p>Token actual (en memoria): {{ authService.getAccessToken() ? 'Sí' : 'No' }}</p>

        <button mat-raised-button color="primary" (click)="loginDemo()">Simular Login</button>
        <button mat-raised-button color="warn" (click)="authService.logout()">Cerrar Sesión</button>
        <button mat-raised-button color="accent" (click)="authService.simulateXssAttack()">Simular Ataque XSS</button>

        <div class="note-box">
          <p>
            **Nota Importante:** Este ejemplo usa almacenamiento en memoria para el token.
            Si la página se refresca o se cierra, el token se pierde y la sesión termina,
            requiriendo un nuevo login. Esto es más seguro contra XSS, pero menos conveniente para el usuario.
          </p>
          <p>
            **Para almacenamiento persistente y seguro (recomendado):**
            Tu backend debe enviar el token JWT en una **cookie HttpOnly** y **Secure**.
            Angular no necesitará acceder directamente a ella, el navegador la enviará automáticamente.
          </p>
        </div>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .token-storage-card {
      max-width: 700px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    button { margin: 10px; }
    .logged-in { color: green; font-weight: bold; }
    .logged-out { color: red; font-weight: bold; }
    .note-box {
      margin-top: 30px;
      padding: 15px;
      border: 1px dashed #424242;
      background-color: #f0f0f0;
      text-align: left;
    }
  `],
  standalone: true,
  imports: [CommonModule, MatButtonModule, MatCardModule]
})
export class TokenStorageDemoComponent {
  constructor(public authService: AuthService) {}

  loginDemo(): void {
    // Simular un login exitoso
    this.authService.login({ username: 'testuser', password: 'password' }).subscribe({
      next: () => alert('Login simulado exitoso! Token almacenado en memoria.'),
      error: (err) => alert('Error simulado en login: ' + err.message)
    });
  }
}

// src/app/app.component.html
/*
<app-token-storage-demo></app-token-storage-demo>
*/

/*
Errores comunes en el almacenamiento de tokens:

1.  **Almacenar JWT directamente en `localStorage` o `sessionStorage`**:
    Este es el error más frecuente y significativo en seguridad.
    Hace que tu aplicación sea vulnerable a robo de tokens vía XSS.
    Evita esta práctica para tokens de autenticación sensibles.

2.  **No usar flags de seguridad en cookies (`HttpOnly`, `Secure`, `SameSite`)**:
    Si decides usar cookies para tokens, pero tu backend no las configura
    con estos flags, pierdes las ventajas de seguridad que ofrecen sobre
    `localStorage`.

3.  **No tener un mecanismo de invalidación de tokens**:
    Si un token es comprometido, necesitas una forma de invalidarlo en el backend
    antes de que expire su tiempo de vida natural. Esto a menudo implica mantener
    una lista negra de tokens revocados en el servidor.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Manejo de Sesiones',
    'subtopic': 'Renovación de sesiones',
    'definition': r'''
Las sesiones de usuario no pueden durar para siempre. Por razones de seguridad, los tokens de autenticación (como los JWTs) suelen tener una vida útil limitada (caducan). Sin embargo, pedirle a un usuario que inicie sesión cada 15 o 30 minutos es una experiencia horrible. Aquí es donde entra la "renovación de sesiones", un mecanismo crucial para mantener la sesión del usuario activa de forma segura sin sacrificar la comodidad.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en una suscripción a un servicio de streaming. No esperas que te pidan tu contraseña cada vez que abres la aplicación, ¿verdad? Pero la suscripción tampoco dura para siempre. Hay un proceso de renovación automático que te permite seguir disfrutando del contenido sin interrupciones, a menos que tu tarjeta expire o decidas cancelar. La renovación de sesiones en tu aplicación funciona de manera similar: mantiene al usuario conectado sin que tenga que volver a introducir sus credenciales, pero con la seguridad de que los tokens de acceso no están activos indefinidamente.

La renovación de sesiones generalmente se logra mediante el uso de **"Refresh Tokens"** (tokens de refresco) junto con los **"Access Tokens"** (tokens de acceso).

* **Access Token (Token de Acceso)**: Es el JWT de corta duración que se usa para autorizar las solicitudes a los recursos protegidos de la API. Tiene una expiración corta (minutos u horas) para limitar el daño en caso de ser robado.
* **Refresh Token (Token de Refresco)**: Es un token de larga duración (días, semanas o incluso meses) que se utiliza para obtener un nuevo Access Token cuando el actual ha expirado. El Refresh Token en sí mismo no se usa para acceder a recursos protegidos directamente, sino solo para el proceso de renovación.

**¿Cómo funciona el flujo de renovación de sesiones?**

1.  **Inicio de Sesión**: El usuario inicia sesión. El backend devuelve tanto un Access Token (de corta duración) como un Refresh Token (de larga duración).
2.  **Almacenamiento**:
    * El Access Token se almacena de forma segura (idealmente en memoria o en una cookie `HttpOnly` para XSS).
    * El Refresh Token es muy sensible y **DEBE ser almacenado de forma aún más segura**, generalmente en una **cookie `HttpOnly` y `Secure`**, para protegerlo del robo por XSS.
3.  **Uso del Access Token**: La aplicación Angular usa el Access Token para realizar solicitudes a la API.
4.  **Expiración del Access Token**: Cuando el Access Token expira, el backend comenzará a devolver errores de autorización (ej., 401 Unauthorized).
5.  **Solicitud de Renovación**: En este punto, la aplicación Angular (típicamente a través de un `HttpInterceptor`) detecta el error 401. En lugar de pedir al usuario que inicie sesión de nuevo, hace una solicitud silenciosa al backend (generalmente a un endpoint específico `/refresh-token`) enviando el Refresh Token.
6.  **Validación del Refresh Token**: El backend valida el Refresh Token. Si es válido y no ha sido revocado, emite un **NUEVO Access Token** (y opcionalmente, un nuevo Refresh Token para mayor seguridad, rotándolos).
7.  **Actualización del Access Token**: La aplicación Angular recibe el nuevo Access Token, lo almacena y reintenta la solicitud original que falló.
8.  **Cierre de Sesión por Expiración del Refresh Token**: Si el Refresh Token también expira o es revocado, entonces el usuario sí que tendrá que iniciar sesión de nuevo.

Este patrón de renovación de sesiones se utiliza ampliamente en aplicaciones como Gmail, que te mantienen logueado durante mucho tiempo sin pedirte la contraseña constantemente, pero que renuevan los tokens de acceso en segundo plano para mantener la seguridad.
''',
    'code_example': r'''
// --- EJEMPLO: RENOVACIÓN DE SESIONES CON ACCESS Y REFRESH TOKENS ---

// Este ejemplo se basa en el AuthService anterior y lo extiende para manejar refresh tokens.
// Se asume un backend que soporte este flujo.

// 1. Servicio de Autenticación con Renovación (src/app/auth/auth.service.ts)
// (Modificaciones al AuthService existente)

import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, BehaviorSubject, tap, catchError, throwError } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  accessToken: string;
  refreshToken: string; // Incluimos el refresh token
  expiresIn: number; // Expiración del access token (en segundos)
  roles?: string[];
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';
  private accessTokenSubject = new BehaviorSubject<string | null>(null);
  public currentAccessToken = this.accessTokenSubject.asObservable();

  private refreshTokenSubject = new BehaviorSubject<string | null>(null); // Para el refresh token

  private isRefreshing = false; // Bandera para evitar múltiples peticiones de refresh concurrentes

  constructor(private http: HttpClient, private router: Router) {
    this.loadTokens(); // Cargar tokens al iniciar la aplicación
  }

  private loadTokens(): void {
    // Idealmente, el refresh token estaría en una cookie HttpOnly,
    // y el access token podría ser en memoria.
    // Para la demostración, usamos LocalStorage (con la advertencia de seguridad).
    const accessToken = localStorage.getItem('access_token');
    const refreshToken = localStorage.getItem('refresh_token');

    if (accessToken) {
      this.accessTokenSubject.next(accessToken);
    }
    if (refreshToken) {
      this.refreshTokenSubject.next(refreshToken);
    }
  }

  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        // Almacenar tokens (¡Precaución con LocalStorage para Refresh Token!)
        localStorage.setItem('access_token', response.accessToken);
        localStorage.setItem('refresh_token', response.refreshToken); // ALTO RIESGO SI NO ES HTTPONLY
        this.accessTokenSubject.next(response.accessToken);
        this.refreshTokenSubject.next(response.refreshToken);
        console.log('Tokens almacenados. Access Token:', response.accessToken.substring(0,20), '...');
        console.log('Refresh Token:', response.refreshToken.substring(0,20), '...');
      })
    );
  }

  logout(): void {
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    this.accessTokenSubject.next(null);
    this.refreshTokenSubject.next(null);
    this.router.navigate(['/login']);
    console.log('Sesión cerrada. Tokens eliminados.');
  }

  getAccessToken(): string | null {
    return this.accessTokenSubject.value;
  }

  getRefreshToken(): string | null {
    return this.refreshTokenSubject.value;
  }

  isLoggedIn(): boolean {
    return !!this.getAccessToken();
  }

  // Método para renovar el Access Token usando el Refresh Token
  refreshToken(): Observable<AuthResponse> {
    if (this.isRefreshing) {
      // Si ya hay una petición de refresh en curso, no iniciar otra
      return new Observable(observer => {
        // Esperar a que la petición actual termine y luego emitir el nuevo token
        this.accessTokenSubject.subscribe(token => {
          if (token) {
            observer.next({ accessToken: token, refreshToken: this.getRefreshToken() || '', expiresIn: 3600 }); // Dummy expiresIn
            observer.complete();
          }
        });
      });
    }

    this.isRefreshing = true;
    const refreshToken = this.getRefreshToken();

    if (!refreshToken) {
      this.isRefreshing = false;
      this.logout();
      return throwError(() => new Error('No refresh token available.'));
    }

    console.log('Intentando renovar Access Token con Refresh Token...');
    return this.http.post<AuthResponse>(`${this.apiUrl}/refresh-token`, { refreshToken }).pipe(
      tap(response => {
        localStorage.setItem('access_token', response.accessToken);
        localStorage.setItem('refresh_token', response.refreshToken); // Actualizar refresh token si el backend lo rota
        this.accessTokenSubject.next(response.accessToken);
        this.refreshTokenSubject.next(response.refreshToken); // Asegurarse de actualizarlo
        this.isRefreshing = false;
        console.log('Access Token renovado exitosamente.');
      }),
      catchError((error: HttpErrorResponse) => {
        this.isRefreshing = false;
        console.error('Error al renovar token:', error);
        this.logout(); // Si el refresh token falla, la sesión ha terminado
        return throwError(() => error);
      })
    );
  }
}

// 2. Interceptor HTTP para manejar la expiración del Access Token (src/app/auth/token.interceptor.ts)
// Este interceptor detecta 401s y usa el refreshToken para obtener uno nuevo.
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, throwError, BehaviorSubject, EMPTY } from 'rxjs';
import { catchError, filter, take, switchMap } from 'rxjs/operators';
import { AuthService } from './auth.service';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {
  private isRefreshingToken = false;
  private tokenSubject: BehaviorSubject<string | null> = new BehaviorSubject<string | null>(null);

  constructor(public authService: AuthService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // Añadir el Access Token actual
    request = this.addToken(request, this.authService.getAccessToken());

    return next.handle(request).pipe(
      catchError(error => {
        if (error instanceof HttpErrorResponse && error.status === 401) {
          // Si es 401 y no es la petición de login (para no entrar en bucle)
          // Y la URL de la petición no es la de refresh-token (para no entrar en bucle)
          if (request.url.includes('/login') || request.url.includes('/refresh-token')) {
            return throwError(() => error);
          }
          return this.handle401Error(request, next);
        } else {
          return throwError(() => error);
        }
      })
    );
  }

  private addToken(request: HttpRequest<any>, token: string | null): HttpRequest<any> {
    if (token) {
      return request.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
    }
    return request;
  }

  private handle401Error(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (!this.isRefreshingToken) {
      this.isRefreshingToken = true;
      this.tokenSubject.next(null); // Borrar el token viejo del subject

      return this.authService.refreshToken().pipe(
        switchMap((authResponse) => {
          this.isRefreshingToken = false;
          this.tokenSubject.next(authResponse.accessToken); // Emitir el nuevo access token
          return next.handle(this.addToken(request, authResponse.accessToken)); // Reintentar la petición original
        }),
        catchError((err: any) => {
          this.isRefreshingToken = false;
          this.authService.logout(); // Si el refresh también falla, cerrar sesión
          return throwError(() => err);
        })
      );
    } else {
      // Si ya hay una petición de refresh en curso, esperar a que termine y luego reintentar
      return this.tokenSubject.pipe(
        filter(token => token != null),
        take(1),
        switchMap(token => {
          return next.handle(this.addToken(request, token));
        })
      );
    }
  }
}

// Asegúrate de que el interceptor esté provisto en app.module.ts como en el subtema anterior.

/*
Errores comunes en la renovación de sesiones:

1.  **Exponer el Refresh Token a XSS**:
    Almacenar el Refresh Token en `localStorage` o `sessionStorage` es un grave riesgo.
    Si un atacante lo roba, puede obtener nuevos Access Tokens indefinidamente.
    **Siempre almacena el Refresh Token en una cookie `HttpOnly` y `Secure`** gestionada por el backend.

2.  **Bucle infinito de peticiones de renovación**:
    Si tu interceptor no maneja correctamente las peticiones concurrentes de refresh token,
    podrías terminar con múltiples llamadas al endpoint `/refresh-token` o un bucle.
    Usa una bandera (`isRefreshingToken`) y un `BehaviorSubject` para asegurar que
    solo se haga una petición de refresh a la vez y que otras peticiones esperen el nuevo token.

3.  **No revocar Refresh Tokens comprometidos**:
    Si un Refresh Token es robado, el backend debe tener un mecanismo para revocarlo
    inmediatamente para que el atacante no pueda seguir obteniendo nuevos Access Tokens.
    Esto suele implicar una base de datos de tokens revocados.

4.  **No manejar el fallo de la renovación del Refresh Token**:
    Si la llamada al endpoint `/refresh-token` falla (ej., el refresh token ha expirado
    o ha sido revocado), la aplicación debe cerrar la sesión del usuario y redirigirlo
    al login. No intentes reintentar la renovación si el Refresh Token no es válido.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Manejo de Sesiones',
    'subtopic': 'Cierre de sesión seguro',
    'definition': r'''
El "cierre de sesión seguro" no es simplemente "ocultar los botones de la interfaz" o "limpiar algunas variables". Es un paso fundamental para garantizar que, una vez que un usuario decide salir de tu aplicación, su sesión termine realmente, y los tokens o credenciales ya no puedan ser utilizados por nadie más.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en dejar la puerta de tu casa abierta después de salir. No lo harías, ¿verdad? Un cierre de sesión efectivo es como cerrar y asegurar la puerta. Si un usuario simplemente cierra la pestaña del navegador sin cerrar sesión correctamente, o si el proceso de cierre de sesión es defectuoso, los tokens de autenticación podrían seguir siendo válidos y un atacante podría secuestrar esa sesión más tarde, especialmente en equipos compartidos o si el token es robado.

Un cierre de sesión seguro implica varias acciones coordinadas entre el frontend (Angular) y el backend:

1.  **Eliminación del Access Token en el cliente**:
    * Si el Access Token se almacenó en `localStorage` o `sessionStorage`, debe ser eliminado explícitamente (`localStorage.removeItem('access_token')`).
    * Si se usó almacenamiento en memoria, simplemente se restablece la variable a `null`.
    * Si el Access Token se gestionó solo a través de cookies `HttpOnly`, no hay acción directa en el cliente, ya que JavaScript no puede acceder a ellas.

2.  **Invalidación del Refresh Token en el backend**:
    * Este es el paso más crítico. Si estás utilizando Refresh Tokens, la aplicación Angular debe enviar una solicitud al backend (a un endpoint de "logout" o "revoke token") para que el servidor invalide (revoque) el Refresh Token. Esto evita que el Refresh Token pueda ser usado nuevamente para generar nuevos Access Tokens. La revocación del Refresh Token es vital, ya que es de larga duración y su compromiso es muy peligroso.
    * Si el Refresh Token se almacenó en una cookie `HttpOnly`, el backend también debe enviar una respuesta que borre esa cookie del navegador del cliente.

3.  **Redirección a una página pública (ej., login)**:
    Una vez que la sesión ha sido terminada con éxito en el cliente y en el servidor, el usuario debe ser redirigido a una página pública, como la página de inicio de sesión. Esto da una indicación visual clara de que la sesión ha terminado.

4.  **Limpieza de estado del usuario**:
    Cualquier dato de usuario, permisos o información de sesión almacenada en el estado de la aplicación Angular (ej., en servicios, NgRx store, NGRX SignalStore) debe ser limpiado para evitar que información sensible permanezca disponible.

**¿Por qué no es suficiente borrar el token en el cliente?**

Si solo borras el token del cliente (por ejemplo, de `localStorage`) pero el token sigue siendo válido en el servidor (especialmente un Refresh Token), un atacante que haya interceptado ese token en algún momento anterior, o que lo encuentre en la caché del navegador de un equipo compartido, podría seguir utilizándolo para acceder a tu aplicación. La revocación del token en el servidor es la garantía definitiva de que ya no será aceptado.

El cierre de sesión seguro es una parte esencial de la experiencia de seguridad del usuario. No se trata solo de la funcionalidad, sino también de la tranquilidad. Plataformas bancarias o de salud, por ejemplo, tienen procesos de cierre de sesión muy rigurosos que a menudo incluyen la invalidación de tokens en el servidor para proteger la información más sensible de sus usuarios.
''',
    'code_example': r'''
// --- EJEMPLO: CIERRE DE SESIÓN SEGURO EN ANGULAR ---

// Este ejemplo extiende el AuthService para incluir la revocación del Refresh Token en el backend.

// 1. Servicio de Autenticación con Cierre de Sesión Seguro (src/app/auth/auth.service.ts)
// (Modificaciones al AuthService existente)

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, tap, catchError, throwError } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  roles?: string[];
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';
  private accessTokenSubject = new BehaviorSubject<string | null>(null);
  public currentAccessToken = this.accessTokenSubject.asObservable();
  private refreshTokenSubject = new BehaviorSubject<string | null>(null);

  constructor(private http: HttpClient, private router: Router) {
    this.loadTokens();
  }

  private loadTokens(): void {
    const accessToken = localStorage.getItem('access_token');
    const refreshToken = localStorage.getItem('refresh_token');

    if (accessToken) {
      this.accessTokenSubject.next(accessToken);
    }
    if (refreshToken) {
      this.refreshTokenSubject.next(refreshToken);
    }
  }

  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        localStorage.setItem('access_token', response.accessToken);
        localStorage.setItem('refresh_token', response.refreshToken);
        this.accessTokenSubject.next(response.accessToken);
        this.refreshTokenSubject.next(response.refreshToken);
        console.log('Login exitoso. Tokens guardados.');
      })
    );
  }

  // --- Método de cierre de sesión seguro ---
  logout(): void {
    const refreshToken = this.refreshTokenSubject.value; // Obtener el refresh token actual

    // 1. Enviar petición al backend para revocar el refresh token (CRÍTICO)
    if (refreshToken) {
      this.http.post(`${this.apiUrl}/logout`, { refreshToken }).pipe(
        tap(() => console.log('Refresh token revocado en el backend.')),
        catchError(err => {
          console.error('Error al revocar refresh token en el backend:', err);
          // A pesar del error en el backend, continuar con la limpieza en el cliente
          return throwError(() => err);
        })
      ).subscribe({
        complete: () => this.performClientLogout() // Continuar con la limpieza del cliente después de la revocación
      });
    } else {
      this.performClientLogout(); // Si no hay refresh token, solo limpiar el cliente
    }
  }

  private performClientLogout(): void {
    // 2. Limpiar el almacenamiento local del cliente
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');

    // 3. Limpiar los BehaviorSubjects (estado reactivo)
    this.accessTokenSubject.next(null);
    this.refreshTokenSubject.next(null);

    // 4. Limpiar cualquier otro estado de usuario en la aplicación (ej. datos de perfil)
    // this.userProfileSubject.next(null); // Si tuvieras un BehaviorSubject para el perfil

    // 5. Redirigir al usuario a la página de login o inicio
    this.router.navigate(['/login']);
    console.log('Sesión cerrada y estado del cliente limpiado.');
  }

  getAccessToken(): string | null {
    return this.accessTokenSubject.value;
  }

  getRefreshToken(): string | null {
    return this.refreshTokenSubject.value;
  }

  isLoggedIn(): boolean {
    return !!this.getAccessToken();
  }

  refreshToken(): Observable<AuthResponse> {
    // ... (El mismo código de renovación de token que en el subtema anterior)
    // Asegúrate de que, si el refresh token falla, también llama a `logout()`
    // para limpiar completamente la sesión.
    // ...
    return this.http.post<AuthResponse>(`${this.apiUrl}/refresh-token`, { refreshToken: this.getRefreshToken() }).pipe(
      tap(response => {
        localStorage.setItem('access_token', response.accessToken);
        localStorage.setItem('refresh_token', response.refreshToken);
        this.accessTokenSubject.next(response.accessToken);
        this.refreshTokenSubject.next(response.refreshToken);
        console.log('Access Token renovado.');
      }),
      catchError(err => {
        console.error('Error al renovar token, cerrando sesión:', err);
        this.performClientLogout(); // Llama a la función de limpieza de logout si la renovación falla
        return throwError(() => err);
      })
    );
  }
}

// 2. Componente con botón de Logout (src/app/dashboard/dashboard.component.ts)
// (Modificaciones al DashboardComponent existente)

import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-dashboard',
  template: `
    <mat-card class="dashboard-card">
      <mat-card-header>
        <mat-card-title>Dashboard Seguro</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>¡Bienvenido! Has accedido a un recurso protegido.</p>
        <p *ngIf="data">Datos protegidos: {{ data }}</p>
        <button mat-raised-button color="accent" (click)="fetchProtectedData()">
          Obtener Datos Protegidos
        </button>
        <button mat-raised-button color="warn" (click)="onLogout()">
          Cerrar Sesión Segura
        </button>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .dashboard-card {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    button { margin: 10px; }
  `],
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule]
})
export class DashboardComponent implements OnInit {
  data: string | null = null;
  private apiUrl = 'http://localhost:3000/api';

  constructor(private http: HttpClient, public authService: AuthService) {}

  ngOnInit(): void {
    this.fetchProtectedData();
  }

  fetchProtectedData(): void {
    this.http.get(`${this.apiUrl}/protected-data`).subscribe({
      next: (response: any) => {
        this.data = JSON.stringify(response);
      },
      error: (err) => {
        this.data = 'Error al cargar datos protegidos: ' + err.message;
        console.error('Error fetching protected data:', err);
      }
    });
  }

  onLogout(): void {
    console.log('Iniciando proceso de cierre de sesión seguro...');
    this.authService.logout();
  }
}


/*
Errores comunes en el cierre de sesión seguro:

1.  **Solo borrar el token del cliente sin invalidarlo en el servidor**:
    Esto deja el token (especialmente el Refresh Token de larga duración) válido
    en el servidor, lo que permitiría a un atacante con acceso al token secuestrar la sesión.
    Siempre revoca el Refresh Token en el backend.

2.  **No limpiar el estado de la aplicación**:
    Si dejas datos de usuario o permisos en variables de servicio o en un store (ej., NgRx)
    después del logout, podrías mostrar información sensible o autorizar acciones
    erróneamente a un usuario "deslogueado" en la interfaz.

3.  **Redirigir a una página protegida después del logout**:
    Asegúrate de que la redirección final sea a una ruta pública (como `/login` o `/`).
    Esto previene que la aplicación intente cargar contenido protegido sin un token válido,
    lo que podría llevar a errores o a una experiencia de usuario confusa.

4.  **No manejar errores en la revocación del token**:
    Aunque el cierre de sesión debe continuar en el cliente incluso si la revocación del token
    en el backend falla (para no bloquear al usuario), es crucial registrar estos errores
    y tener un sistema para investigarlos, ya que indican un problema de seguridad.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Control de Acceso',
    'subtopic': 'Definición de roles y permisos',
    'definition': r'''
El "control de acceso" es el sistema que decide quién puede hacer qué en tu aplicación. Dentro de este control, la "definición de roles y permisos" es la base. Un rol es una categoría o título que se le asigna a un usuario (ej., "Administrador", "Editor", " "Visitante"), y los permisos son las acciones específicas que un usuario con ese rol puede realizar (ej., "crear_post", "editar_usuario", "ver_reportes").

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un equipo de fútbol. Cada jugador tiene un rol (delantero, defensa, portero), y ese rol viene con una serie de permisos o acciones permitidas en el campo (el delantero puede disparar a gol, el portero puede usar las manos en su área). Sería un caos si todos pudieran hacer cualquier cosa. De manera similar, en tu aplicación, asignar roles y permisos te permite organizar y gestionar el acceso a funcionalidades de forma estructurada, asegurando que cada usuario solo vea y haga lo que le corresponde.

La definición de roles y permisos es crucial para:

* **Seguridad**: Evitar que usuarios no autorizados accedan a información sensible o realicen acciones destructivas.
* **Organización**: Simplificar la gestión de usuarios, ya que no necesitas asignar permisos individualmente a cada usuario, sino que asignas un rol que ya tiene un conjunto predefinido de permisos.
* **Experiencia de Usuario**: Personalizar la interfaz de usuario para mostrar solo las opciones y la información relevante para cada usuario, evitando la sobrecarga de información y opciones irrelevantes.

**Conceptos clave:**

* **RBAC (Role-Based Access Control)**: Es el modelo más común para el control de acceso. Los permisos se agrupan en roles, y los usuarios son asignados a uno o más roles. Es el modelo más sencillo de implementar y mantener para la mayoría de las aplicaciones.
* **ABAC (Attribute-Based Access Control)**: Un modelo más granular donde el acceso se concede basándose en atributos del usuario, del recurso, del entorno, etc. Es más flexible pero también mucho más complejo de implementar. Para la mayoría de los casos, RBAC es suficiente.

**Implementación en Angular (y Backend):**

La definición de roles y permisos es fundamentalmente una responsabilidad del **backend**. Es el servidor el que debe almacenar qué roles tiene un usuario y qué permisos están asociados a cada rol. Cuando el usuario inicia sesión y obtiene su JWT, este token puede incluir los roles del usuario (en el payload) o una referencia a ellos, para que el frontend pueda usarlos para decisiones de la UI (ej., mostrar/ocultar botones).

**En el backend:**

* Se define una tabla de `Roles` (ej., `id`, `nombre_rol`).
* Se define una tabla de `Permisos` (ej., `id`, `nombre_permiso`, `descripcion`).
* Se establece una relación muchos a muchos entre `Roles` y `Permisos` (`rol_permiso` tabla intermedia).
* La tabla `Usuarios` tiene una relación con la tabla `Roles` (muchos a muchos o uno a muchos).
* Cuando un usuario solicita un recurso protegido, el backend verifica su rol y si ese rol tiene el permiso necesario para acceder a ese recurso.

**En Angular (frontend):**

Angular no impone la seguridad de la autorización; solo la facilita para la interfaz de usuario. El frontend usará la información de roles/permisos recibida del backend (ej., en el JWT del usuario) para:

* **Mostrar/ocultar elementos de la UI**: Si un usuario no tiene permiso para "crear_post", el botón "Nuevo Post" no debería mostrarse.
* **Deshabilitar controles**: Un botón podría estar visible pero deshabilitado si el usuario no tiene los permisos necesarios.
* **Controlar la navegación**: Usando Guards (como vimos en el subtema anterior) para redirigir si un usuario intenta acceder a una ruta para la cual no tiene rol.

Es importante recordar que el frontend solo ofrece una capa visual; la verdadera seguridad de la autorización **siempre debe residir en el backend**. No confíes en que el cliente por sí solo haga cumplir los permisos, ya que el código del cliente puede ser fácilmente manipulado. Empresas como Salesforce, con su compleja estructura de acceso a datos para ventas y marketing, dependen enormemente de una definición robusta de roles y permisos para controlar quién ve y modifica qué información.
''',
    'code_example': r'''
// --- EJEMPLO: DEFINICIÓN DE ROLES Y PERMISOS (Enfoque Frontend/Backend) ---

// La definición REAL de roles y permisos reside en el BACKEND y la base de datos.
// Este ejemplo ilustra cómo el frontend consumiría y usaría esa información.

// 1. **Definición de Roles y Permisos (Conceptual - Lado del Backend/DB)**
// Imagina estas tablas en tu base de datos:

/*
-- Tabla de Roles
CREATE TABLE Roles (
    id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Roles (id, name) VALUES
(1, 'admin'),
(2, 'editor'),
(3, 'viewer');

-- Tabla de Permisos
CREATE TABLE Permissions (
    id INT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

INSERT INTO Permissions (id, name, description) VALUES
(101, 'create_post', 'Permite crear nuevas publicaciones'),
(102, 'edit_any_post', 'Permite editar cualquier publicación'),
(103, 'delete_post', 'Permite eliminar publicaciones'),
(104, 'view_users', 'Permite ver la lista de usuarios'),
(105, 'manage_users', 'Permite crear/editar/eliminar usuarios'),
(106, 'view_dashboard_stats', 'Permite ver estadísticas del panel de control');

-- Tabla intermedia para Roles y Permisos (muchos a muchos)
CREATE TABLE RolePermissions (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES Roles(id),
    FOREIGN KEY (permission_id) REFERENCES Permissions(id)
);

INSERT INTO RolePermissions (role_id, permission_id) VALUES
(1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), -- Admin tiene todos los permisos
(2, 101), (2, 102), (2, 106), -- Editor puede crear/editar posts y ver stats
(3, 106); -- Viewer solo puede ver stats
*/

// 2. **AuthService con Roles y Permisos (src/app/auth/auth.service.ts)**
// Asume que el Access Token (JWT) o una respuesta del backend incluye los roles y permisos del usuario.
// Modificaciones al AuthService para manejar permisos.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, tap } from 'rxjs';
import { Router } from '@angular/router';

interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
  roles: string[]; // <-- Roles del usuario
  permissions: string[]; // <-- Permisos explícitos del usuario (opcional, si el backend los envía)
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';
  private accessTokenSubject = new BehaviorSubject<string | null>(null);
  private refreshTokenSubject = new BehaviorSubject<string | null>(null);
  private userRolesSubject = new BehaviorSubject<string[]>([]);
  private userPermissionsSubject = new BehaviorSubject<string[]>([]); // Nuevo para permisos

  constructor(private http: HttpClient, private router: Router) {
    this.loadTokensAndPermissions();
  }

  private loadTokensAndPermissions(): void {
    const accessToken = localStorage.getItem('access_token');
    const refreshToken = localStorage.getItem('refresh_token');
    const rolesJson = localStorage.getItem('user_roles');
    const permissionsJson = localStorage.getItem('user_permissions'); // Cargar permisos

    if (accessToken) this.accessTokenSubject.next(accessToken);
    if (refreshToken) this.refreshTokenSubject.next(refreshToken);
    if (rolesJson) this.userRolesSubject.next(JSON.parse(rolesJson));
    if (permissionsJson) this.userPermissionsSubject.next(JSON.parse(permissionsJson)); // Cargar permisos
  }

  login(credentials: { username: string, password: string }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, credentials).pipe(
      tap(response => {
        localStorage.setItem('access_token', response.accessToken);
        localStorage.setItem('refresh_token', response.refreshToken);
        localStorage.setItem('user_roles', JSON.stringify(response.roles));
        localStorage.setItem('user_permissions', JSON.stringify(response.permissions)); // Guardar permisos

        this.accessTokenSubject.next(response.accessToken);
        this.refreshTokenSubject.next(response.refreshToken);
        this.userRolesSubject.next(response.roles);
        this.userPermissionsSubject.next(response.permissions); // Actualizar permisos
        console.log('Login exitoso. Roles y permisos cargados.');
      })
    );
  }

  logout(): void {
    // ... (Lógica de revocación de token en backend y limpieza de cliente)
    this.performClientLogout(); // Asume que la revocación se maneja y luego se llama a esto
  }

  private performClientLogout(): void {
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    localStorage.removeItem('user_roles');
    localStorage.removeItem('user_permissions'); // Limpiar permisos

    this.accessTokenSubject.next(null);
    this.refreshTokenSubject.next(null);
    this.userRolesSubject.next([]);
    this.userPermissionsSubject.next([]); // Limpiar permisos

    this.router.navigate(['/login']);
    console.log('Sesión cerrada y estado limpiado.');
  }

  isLoggedIn(): boolean {
    return !!this.accessTokenSubject.value;
  }

  getUserRoles(): string[] {
    return this.userRolesSubject.value;
  }

  getUserPermissions(): string[] {
    return this.userPermissionsSubject.value;
  }

  // Método para verificar si el usuario tiene un rol específico
  hasRole(role: string): boolean {
    return this.getUserRoles().includes(role);
  }

  // Método para verificar si el usuario tiene un permiso específico
  hasPermission(permission: string): boolean {
    return this.getUserPermissions().includes(permission);
  }
}

// 3. Directiva Estructural para Control de Acceso por Roles (src/app/auth/has-role.directive.ts)
// Esta directiva te permite mostrar/ocultar elementos basados en el rol.

import { Directive, Input, TemplateRef, ViewContainerRef, OnInit } from '@angular/core';
import { AuthService } from './auth.service';
import { Subscription } from 'rxjs';

@Directive({
  selector: '[hasRole]', // Usar como *hasRole="'admin'"
  standalone: true,
})
export class HasRoleDirective implements OnInit {
  @Input('hasRole') requiredRole: string | string[] = ''; // Puede ser un solo rol o un array de roles
  private hasView = false;
  private authSubscription!: Subscription;

  constructor(
    private templateRef: TemplateRef<any>,
    private viewContainer: ViewContainerRef,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.authSubscription = this.authService.currentUserRoles.subscribe(roles => {
      this.updateView(roles);
    });
  }

  private updateView(userRoles: string[]): void {
    const rolesToCheck = Array.isArray(this.requiredRole) ? this.requiredRole : [this.requiredRole];
    const hasPermission = rolesToCheck.some(role => userRoles.includes(role));

    if (hasPermission && !this.hasView) {
      this.viewContainer.createEmbeddedView(this.templateRef);
      this.hasView = true;
    } else if (!hasPermission && this.hasView) {
      this.viewContainer.clear();
      this.hasView = false;
    }
  }

  ngOnDestroy(): void {
    if (this.authSubscription) {
      this.authSubscription.unsubscribe();
    }
  }
}

// 4. Directiva Estructural para Control de Acceso por Permisos (src/app/auth/has-permission.directive.ts)
// Similar a hasRole, pero para permisos más granulares.

import { Directive, Input, TemplateRef, ViewContainerRef, OnInit } from '@angular/core';
import { AuthService } from './auth.service';
import { Subscription } from 'rxjs';

@Directive({
  selector: '[hasPermission]', // Usar como *hasPermission="'create_post'"
  standalone: true,
})
export class HasPermissionDirective implements OnInit {
  @Input('hasPermission') requiredPermission: string | string[] = '';
  private hasView = false;
  private authSubscription!: Subscription;

  constructor(
    private templateRef: TemplateRef<any>,
    private viewContainer: ViewContainerRef,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.authSubscription = this.authService.currentUserRoles.subscribe(roles => {
      // Nota: Si el backend envía permisos directamente, deberías usar userPermissionsSubject.
      // Aquí, para simplicidad, asumimos que los roles implican permisos para este ejemplo.
      // En un sistema real, usarías `this.authService.userPermissionsSubject`.
      this.updateView(this.authService.getUserPermissions()); // Usar el método que obtiene los permisos
    });
  }

  private updateView(userPermissions: string[]): void {
    const permissionsToCheck = Array.isArray(this.requiredPermission) ? this.requiredPermission : [this.requiredPermission];
    const hasPermission = permissionsToCheck.some(perm => userPermissions.includes(perm));

    if (hasPermission && !this.hasView) {
      this.viewContainer.createEmbeddedView(this.templateRef);
      this.hasView = true;
    } else if (!hasPermission && this.hasView) {
      this.viewContainer.clear();
      this.hasView = false;
    }
  }

  ngOnDestroy(): void {
    if (this.authSubscription) {
      this.authSubscription.unsubscribe();
    }
  }
}


// 5. Ejemplo de uso en un componente (src/app/content-access-demo/content-access-demo.component.ts)
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HasRoleDirective } from '../auth/has-role.directive';
import { HasPermissionDirective } from '../auth/has-permission.directive';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../auth/auth.service';

@Component({
  selector: 'app-content-access-demo',
  template: `
    <mat-card class="access-control-card">
      <mat-card-header>
        <mat-card-title>Control de Acceso por Roles y Permisos</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>Tu rol actual: {{ (authService.currentUserRoles | async)?.join(', ') || 'N/A' }}</p>
        <p>Tus permisos: {{ (authService.userPermissionsSubject | async)?.join(', ') || 'N/A' }}</p>

        <h3>Contenido Visible según Rol</h3>
        <div class="access-section">
          <div *hasRole="'admin'">
            <p class="admin-content">Bienvenido, Administrador! Tienes acceso completo.</p>
            <button mat-raised-button color="accent">Gestionar Usuarios</button>
          </div>
          <div *hasRole="'editor'">
            <p class="editor-content">Hola Editor! Puedes publicar y editar.</p>
            <button mat-raised-button color="primary">Crear Nuevo Post</button>
          </div>
          <div *hasRole="'viewer'">
            <p class="viewer-content">Solo puedes ver el contenido.</p>
          </div>
        </div>

        <h3>Funcionalidades visibles según Permiso</h3>
        <div class="access-section">
          <button mat-raised-button color="primary" *hasPermission="'create_post'">
            Crear Post
          </button>
          <button mat-raised-button color="warn" *hasPermission="'delete_post'">
            Eliminar Post
          </button>
          <button mat-raised-button color="accent" *hasPermission="'manage_users'">
            Administrar Usuarios
          </button>
          <button mat-raised-button color="basic" *hasPermission="'view_dashboard_stats'">
            Ver Estadísticas del Dashboard
          </button>
        </div>

        <p class="disclaimer">
          **Descargo de responsabilidad:** La lógica de autorización real SIEMPRE debe ser
          validada en el backend. El frontend solo adapta la UI.
        </p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .access-control-card {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    .access-section {
      margin-top: 20px;
      border: 1px dashed #ccc;
      padding: 15px;
      text-align: left;
    }
    .admin-content { color: #D32F2F; font-weight: bold; }
    .editor-content { color: #388E3C; font-weight: bold; }
    .viewer-content { color: #1976D2; font-weight: bold; }
    button { margin: 5px; }
    .disclaimer {
      margin-top: 30px;
      color: #757575;
      font-size: 0.85em;
    }
  `],
  standalone: true,
  imports: [
    CommonModule, HasRoleDirective, HasPermissionDirective,
    MatCardModule, MatButtonModule
  ]
})
export class ContentAccessDemoComponent {
  constructor(public authService: AuthService) {}
}

// src/app/app.module.ts (para añadir los nuevos componentes y directivas si no son standalone)
/*
@NgModule({
  // ...
  imports: [
    // ...
    ContentAccessDemoComponent, // Si es standalone
    // Si no son standalone, tendrías que declararlas aquí y exportarlas desde un SharedModule
    // para que otros módulos las usen.
  ],
  // ...
})
export class AppModule { }
*/

/*
Errores comunes en la definición de roles y permisos:

1.  **Confiar únicamente en la autorización del frontend**:
    Este es el error más grave. Si el frontend oculta un botón, un usuario malicioso
    puede simplemente manipular el DOM o enviar una solicitud HTTP directa al backend.
    **SIEMPRE** valida los permisos en el backend antes de permitir una operación.

2.  **Definición de permisos demasiado granular o demasiado general**:
    Si es demasiado granular, la gestión se vuelve un infierno. Si es demasiado general,
    pierdes control. Encuentra un equilibrio para agrupar permisos lógicos en roles.

3.  **No tener un mecanismo para actualizar roles/permisos del usuario en tiempo real**:
    Si cambias el rol o los permisos de un usuario mientras está logueado, necesitas
    un mecanismo para que esos cambios se reflejen sin que tenga que cerrar sesión
    y volver a iniciarla (ej., refrescando el token o los claims del token periódicamente).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Control de Acceso',
    'subtopic': 'Restricción de funcionalidades según el rol',
    'definition': r'''
Una vez que tienes definidos tus roles y permisos, la siguiente fase en el control de acceso es la "restricción de funcionalidades según el rol". Esto significa que la interfaz de usuario de tu aplicación se adaptará dinámicamente para mostrar u ocultar elementos, habilitar o deshabilitar acciones, o incluso cambiar la navegación, basándose en los roles y permisos del usuario actualmente logueado.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación de gestión de un hospital. Un médico puede ver los historiales de los pacientes y prescribir medicamentos, pero no puede modificar las finanzas del hospital. Un administrador, por otro lado, puede gestionar los usuarios y ver reportes financieros, pero no tiene acceso a los historiales médicos detallados. Restringir funcionalidades según el rol es esencial para mantener la privacidad de los datos, prevenir errores y asegurar que cada usuario tenga una experiencia adaptada a sus responsabilidades.

En Angular, la restricción de funcionalidades se implementa principalmente de las siguientes maneras, utilizando la información de roles/permisos que el usuario obtiene al autenticarse (idealmente, del JWT o de un servicio que la obtenga de forma segura del backend):

1.  **Directivas estructurales (`*ngIf`, `*hasRole`, `*hasPermission`)**:
    * **`*ngIf`**: Es la forma más sencilla. Puedes usarlo para mostrar u ocultar bloques enteros de HTML basándote en una condición booleana, como `*ngIf="authService.hasRole('admin')"`. Esto es excelente para secciones grandes de la interfaz o componentes enteros.
    * **Directivas personalizadas (`*hasRole`, `*hasPermission`)**: Como vimos en el subtema anterior, crear tus propias directivas estructurales (`*hasRole` o `*hasPermission`) es una práctica muy elegante y reutilizable. Te permiten envolver la lógica de verificación de rol/permiso y hacen tu plantilla más legible. Por ejemplo: `<button *hasPermission="'create_post'">Crear Publicación</button>`.

2.  **Enlace de propiedades (`[disabled]`, `[class]`)**:
    * Puedes deshabilitar botones, campos de formulario o enlaces usando el enlace de propiedades, si prefieres que el elemento sea visible pero no interactuable. Por ejemplo: `<button [disabled]="!authService.hasPermission('edit_profile')">Editar Perfil</button>`.
    * También puedes aplicar clases CSS dinámicamente para cambiar la apariencia de un elemento.

3.  **Guards de rutas (`CanActivate`, `CanLoad`)**:
    * Aunque ya lo cubrimos, es crucial mencionarlo aquí. Los Guards son la primera línea de defensa para restringir el acceso a **rutas enteras**. Si un usuario no tiene los permisos para acceder a una ruta (ej., `/admin`), el Guard lo redirigirá antes de que incluso se cargue el componente. Esto no solo mejora la seguridad, sino también el rendimiento al evitar la carga innecesaria de módulos.

4.  **Servicios de autorización**:
    Es una buena práctica encapsular toda la lógica de verificación de roles y permisos en un servicio (ej., `AuthService` o `PermissionService`). Esto mantiene tu código DRY (Don't Repeat Yourself) y te permite centralizar las decisiones de autorización. Otros componentes y directivas simplemente inyectarán este servicio y llamarán a métodos como `hasRole('admin')` o `can('create_user')`.

**Punto crucial**: La restricción de funcionalidades en el frontend es una capa de "experiencia de usuario". Es para que la interfaz se vea y se sienta correctamente para cada usuario. Sin embargo, la **verdadera seguridad de la autorización SIEMPRE debe implementarse y validarse en el backend**. El frontend es susceptible a manipulación, y un usuario malintencionado podría saltarse estas restricciones visuales. El backend debe ser la autoridad final que determina si una solicitud es autorizada, independientemente de lo que el frontend muestre. Empresas como Adobe, con sus complejos modelos de suscripción y acceso a funciones en Creative Cloud, utilizan estas técnicas para asegurar que cada usuario acceda solo a las herramientas y funcionalidades que ha pagado.
''',
    'code_example': r'''
// --- EJEMPLO: RESTRICCIÓN DE FUNCIONALIDADES SEGÚN EL ROL ---

// Este ejemplo se basa en el AuthService y las directivas `hasRole` y `hasPermission`
// de los subtemas anteriores.

// 1. **AuthService (src/app/auth/auth.service.ts)**
// (Ya lo hemos modificado en el subtema anterior para incluir `hasRole` y `hasPermission` métodos)

// 2. **Directivas `hasRole` y `hasPermission` (src/app/auth/has-role.directive.ts y has-permission.directive.ts)**
// (Ya las hemos creado en el subtema anterior)

// 3. **Componente de Panel de Control (src/app/dashboard/dashboard.component.ts)**
// Se extiende para demostrar la restricción de funcionalidades.
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { AuthService } from '../auth/auth.service';
import { HasRoleDirective } from '../auth/has-role.directive'; // Importar directiva
import { HasPermissionDirective } from '../auth/has-permission.directive'; // Importar directiva

@Component({
  selector: 'app-dashboard',
  template: `
    <mat-card class="dashboard-card">
      <mat-card-header>
        <mat-card-title>Dashboard de la Aplicación</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <p>¡Bienvenido! Tu rol actual: <strong>{{ (authService.currentUserRoles | async)?.join(', ') || 'Cargando...' }}</strong></p>
        <p *ngIf="data">Datos protegidos: {{ data }}</p>

        <div class="actions-section">
          <button mat-raised-button color="primary" *hasRole="'admin'">
            Acceder a Panel de Admin
          </button>

          <button mat-raised-button color="primary" *hasRole="['admin', 'editor']">
            Gestionar Contenido
          </button>

          <button mat-raised-button color="accent" (click)="fetchProtectedData()">
            Obtener Datos Comunes (Autenticado)
          </button>
        </div>

        <div class="actions-section">
          <button mat-raised-button color="warn"
                  [disabled]="!(authService.hasPermission('delete_post'))"
                  (click)="deleteItem()">
            Eliminar Item
          </button>

          <button mat-raised-button color="basic"
                  [disabled]="!(authService.hasPermission('create_post'))"
                  (click)="createItem()">
            Crear Nuevo Item
          </button>

          <button mat-raised-button color="info"
                  [disabled]="!(authService.hasPermission('view_reports'))"
                  (click)="viewReports()">
            Ver Reportes
          </button>
        </div>

        <div class="logout-section">
          <button mat-raised-button color="warn" (click)="onLogout()">
            Cerrar Sesión Segura
          </button>
        </div>

        <p class="security-note">
          **Nota de Seguridad:** Las restricciones en el frontend son solo para UX.
          La validación real de los permisos **SIEMPRE ocurre en el backend**.
        </p>
      </mat-card-content>
    </mat-card>
  `,
  styles: [`
    .dashboard-card {
      max-width: 800px;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }
    .actions-section {
      margin: 20px 0;
      border: 1px dashed #ddd;
      padding: 15px;
      background-color: #f9f9f9;
    }
    .logout-section {
      margin-top: 30px;
    }
    button { margin: 8px; }
    .security-note {
      color: #D32F2F;
      font-weight: bold;
      margin-top: 25px;
      font-size: 0.9em;
    }
  `],
  standalone: true,
  imports: [
    CommonModule, MatCardModule, MatButtonModule,
    HasRoleDirective, HasPermissionDirective // Importar las directivas
  ]
})
export class DashboardComponent implements OnInit {
  data: string | null = null;
  private apiUrl = 'http://localhost:3000/api';

  constructor(private http: HttpClient, public authService: AuthService) {}

  ngOnInit(): void {
    // Simular que el usuario tiene ciertos permisos al cargar (en un caso real, esto vendría del JWT)
    // this.authService.userPermissionsSubject.next(['create_post', 'view_reports']); // Ejemplo manual
  }

  fetchProtectedData(): void {
    this.http.get(`${this.apiUrl}/protected-data`).subscribe({
      next: (response: any) => {
        this.data = JSON.stringify(response);
      },
      error: (err) => {
        this.data = 'Error al cargar datos protegidos: ' + err.message;
        console.error('Error fetching protected data:', err);
      }
    });
  }

  onLogout(): void {
    this.authService.logout();
  }

  // Métodos de acción (que también deberían tener validación en el backend)
  deleteItem(): void {
    if (this.authService.hasPermission('delete_post')) {
      alert('Eliminando item... (backend también validaría)');
      // Llamada a la API de eliminación
    } else {
      alert('¡Acceso denegado! No tienes permiso para eliminar.');
    }
  }

  createItem(): void {
    if (this.authService.hasPermission('create_post')) {
      alert('Creando nuevo item... (backend también validaría)');
      // Llamada a la API de creación
    } else {
      alert('¡Acceso denegado! No tienes permiso para crear.');
    }
  }

  viewReports(): void {
    if (this.authService.hasPermission('view_reports')) {
      alert('Accediendo a los reportes... (backend también validaría)');
      // Navegación a la página de reportes
    } else {
      alert('¡Acceso denegado! No tienes permiso para ver reportes.');
    }
  }
}

// src/app/app.module.ts (para añadir el componente si no es standalone y las directivas)
/*
@NgModule({
  // ...
  imports: [
    // ...
    DashboardComponent, // Si es standalone
    // Si tus directivas no son standalone y no están en un SharedModule ya importado:
    // HasRoleDirective,
    // HasPermissionDirective
  ],
  // ...
})
export class AppModule { }
*/

/*
Errores comunes en la restricción de funcionalidades:

1.  **Confiar solo en las restricciones del frontend**:
    Este es el error más crítico. Ocultar un botón no impide que un atacante
    envíe una solicitud HTTP directa a tu backend si conoce el endpoint.
    La **autorización real debe ser siempre validada en el backend** para cada solicitud.

2.  **Lógica de autorización duplicada o inconsistente**:
    Si la lógica para verificar roles y permisos está dispersa por toda la aplicación
    (tanto frontend como backend), es fácil que haya inconsistencias.
    Centraliza esta lógica en servicios (frontend) y middlewares/guards (backend).

3.  **Mala experiencia de usuario**:
    Si un usuario no tiene permisos para algo, en lugar de mostrar un error de acceso
    denegado después de un clic, es mejor ocultar la funcionalidad o deshabilitarla
    preventivamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Control de Acceso',
    'subtopic': 'Auditoría de acciones de usuarios',
    'definition': r'''
Más allá de la autenticación (quién eres) y la autorización (qué puedes hacer), existe una tercera pata de la seguridad: la "auditoría de acciones de usuarios". Se trata de registrar y monitorear las actividades clave que los usuarios realizan dentro de tu aplicación. Es como tener un registro detallado de quién hizo qué, cuándo y dónde.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las cámaras de seguridad en un banco o el registro de transacciones en una cuenta bancaria. Estas medidas no previenen el robo en sí, pero si ocurre, permiten identificar rápidamente qué pasó, quién estuvo involucrado y cuándo. De manera similar, la auditoría de acciones de usuarios es fundamental para:

* **Detección de incidentes**: Identificar actividades sospechosas o no autorizadas que podrían indicar un intento de ataque o un abuso de privilegios.
* **Cumplimiento normativo**: Muchas regulaciones (ej., GDPR, HIPAA, PCI DSS) exigen el registro de actividades sensibles para auditorías.
* **Investigación forense**: Si ocurre una brecha de seguridad o un error, los registros de auditoría son invaluables para reconstruir los eventos.
* **Responsabilidad**: Establecer un rastro claro de las acciones de cada usuario.
* **Resolución de problemas**: Ayudar a depurar por qué algo sucedió (ej., un dato se modificó inesperadamente).

**¿Qué acciones auditar?**

No se trata de registrar cada clic, sino las acciones significativas que tienen un impacto en la seguridad o los datos de la aplicación. Ejemplos incluyen:

* **Autenticación**: Intentos de inicio de sesión (exitosos y fallidos), cambios de contraseña, restablecimiento de contraseña, cierre de sesión.
* **Gestión de usuarios**: Creación, modificación o eliminación de usuarios, cambios de roles o permisos.
* **Gestión de datos sensibles**: Creación, lectura, actualización o eliminación de datos críticos (información personal, financiera).
* **Configuración del sistema**: Cambios en la configuración de seguridad o de la aplicación.
* **Acciones administrativas**: Cualquier acción realizada por un administrador.

**Implementación en Angular (y Backend):**

La auditoría es principalmente una responsabilidad del **backend**, ya que es donde se producen las acciones críticas y donde los registros pueden ser protegidos contra manipulaciones. El frontend (Angular) puede desempeñar un papel en la captura de información contextual y en el envío de eventos al backend.

**En el backend (donde ocurre la magia):**

* **Middleware/Interceptors**: Se implementan capas en tu API que interceptan las solicitudes antes de que lleguen a la lógica de negocio o después de que se ejecuten.
* **Base de datos de auditoría**: Se crea una tabla o un sistema de logging dedicado para almacenar los registros de auditoría. Cada registro debe incluir:
    * `timestamp`: Cuándo ocurrió la acción.
    * `userId` (o `username`): Quién realizó la acción.
    * `actionType`: Tipo de acción (ej., 'LOGIN_SUCCESS', 'USER_CREATED', 'DATA_UPDATED').
    * `resourceAffected`: El recurso o entidad sobre la que se actuó (ej., 'User:123', 'Post:ABC').
    * `details`: Información adicional (ej., IP del usuario, navegador, cambios antes/después).
    * `status`: Éxito o fracaso de la acción.
* **Herramientas de logging**: Integración con soluciones de logging centralizado (ej., ELK Stack - Elasticsearch, Logstash, Kibana, o servicios en la nube como CloudWatch Logs, Splunk).

**En Angular (frontend):**

* **Servicios de Logging/Auditoría**: Puedes tener un servicio en Angular que capture eventos relevantes en el cliente (ej., errores de interfaz, navegación a ciertas páginas) y los envíe al backend para que sean registrados. Esto es útil para entender el contexto completo de las acciones del usuario.
* **Manejo de errores**: Capturar y registrar errores no manejados o fallos de validación en el cliente, y enviarlos al servidor de logs.
* **Información contextual**: Adjuntar metadatos a las solicitudes que van al backend (ej., la versión de la aplicación frontend, ID de la sesión del navegador) para enriquecer los logs del servidor.

**Consideraciones clave**:

* **No registrar contraseñas ni datos sensibles en texto plano**: Los logs deben proteger la privacidad.
* **Protección de los logs**: Los logs de auditoría son valiosos para los atacantes, así que deben estar protegidos contra acceso no autorizado y manipulación.
* **Rotación y archivado**: Gestionar el volumen de logs, rotándolos y archivándolos de forma segura.

Grandes empresas como bancos, con sus estrictas regulaciones y requisitos de seguridad, invierten fuertemente en sistemas de auditoría robustos para rastrear cada movimiento significativo en sus plataformas.
''',
    'code_example': r'''
// --- EJEMPLO: AUDITORÍA DE ACCIONES DE USUARIOS ---

// La auditoría principal ocurre en el BACKEND.
// Este ejemplo ilustra cómo Angular puede enviar eventos de auditoría al backend
// y cómo el backend los registraría (conceptual).

// 1. **Servicio de Auditoría en Angular (src/app/services/audit.service.ts)**
// Este servicio se encargará de enviar eventos de auditoría al backend.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../auth/auth.service'; // Para obtener el ID de usuario

interface AuditEvent {
  action: string; // Ej: 'LOGIN_SUCCESS', 'LOGOUT', 'PASSWORD_CHANGE', 'VIEW_PAGE'
  resource?: string; // Ej: '/dashboard', 'User:123', 'Post:456'
  details?: any; // Cualquier dato adicional relevante
  timestamp?: string;
  userId?: string;
  username?: string;
  ipAddress?: string; // Idealmente capturado en el backend
  userAgent?: string; // Idealmente capturado en el backend
}

@Injectable({
  providedIn: 'root'
})
export class AuditService {
  private auditUrl = 'http://localhost:3000/api/audit'; // Endpoint de auditoría en tu backend

  constructor(private http: HttpClient, private authService: AuthService) {}

  // Envía un evento de auditoría al backend
  logEvent(event: AuditEvent): void {
    const fullEvent: AuditEvent = {
      ...event,
      timestamp: new Date().toISOString(),
      userId: 'N/A', // O el ID del usuario del AuthService, si está disponible
      username: 'N/A', // O el nombre de usuario del AuthService
      // userAgent: navigator.userAgent // Podría ser capturado aquí o en el backend
    };

    // Intenta obtener el ID de usuario o nombre si el AuthService lo expone
    // En un sistema real, el userId podría venir del token JWT decodificado
    // o de un servicio de estado del usuario que lo obtenga de forma segura.
    if (this.authService.isLoggedIn()) {
      // Simula obtener el ID del usuario (ej. del payload del JWT)
      fullEvent.userId = 'user-' + this.authService.getAccessToken()?.split('.')[1].substring(0, 5);
      // fullEvent.username = this.authService.getCurrentUsername(); // Asume que existe
    }


    this.http.post(this.auditUrl, fullEvent).pipe(
      catchError(err => {
        console.error('Error al enviar evento de auditoría al backend:', err);
        // Podrías tener un mecanismo de fallback para registrar localmente
        return throwError(() => err);
      })
    ).subscribe();
  }
}

// 2. **Integración en Componentes (src/app/app.component.ts o en otros componentes)**
// Llamar al AuditService cuando ocurren acciones clave.

import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, Router, NavigationEnd } from '@angular/router'; // Para auditar navegación
import { AuditService } from './services/audit.service';
import { AuthService } from './auth/auth.service'; // Para eventos de login/logout
import { filter } from 'rxjs/operators';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-root',
  template: `
    <mat-toolbar color="primary">
      <span>Mi App Segura</span>
      <span class="spacer"></span>
      <button mat-button routerLink="/dashboard">Dashboard</button>
      <button mat-button routerLink="/admin" *ngIf="authService.hasRole('admin')">Admin</button>
      <button mat-button *ngIf="!(authService.isLoggedIn())" routerLink="/login">Login</button>
      <button mat-button *ngIf="authService.isLoggedIn()" (click)="onLogout()">Logout</button>
    </mat-toolbar>

    <div class="container">
      <router-outlet></router-outlet>
    </div>
  `,
  styles: [`
    .spacer { flex: 1 1 auto; }
    .container { padding: 20px; }
  `],
  standalone: true,
  imports: [
    CommonModule, RouterOutlet, MatToolbarModule, MatButtonModule, MatIconModule
  ]
})
export class AppComponent implements OnInit {
  constructor(
    private router: Router,
    private auditService: AuditService,
    public authService: AuthService // Para usar en la plantilla y en el logout
  ) {}

  ngOnInit(): void {
    // Auditar navegación de rutas
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd)
    ).subscribe((event: NavigationEnd) => {
      this.auditService.logEvent({
        action: 'NAVIGATE_TO',
        resource: event.urlAfterRedirects,
        details: { from: event.url }
      });
    });

    // Auditar login (ejemplo, en un caso real se llamaría desde el LoginComponent)
    this.authService.currentToken.subscribe(token => {
      if (token) {
        // Solo para demostrar, en una app real sería después de la respuesta exitosa de login
        // this.auditService.logEvent({ action: 'LOGIN_SUCCESS', details: { ip: '...' } });
      }
    });
  }

  onLogout(): void {
    this.authService.logout();
    this.auditService.logEvent({ action: 'LOGOUT_SUCCESS' });
  }

  // Otros métodos de componentes donde se realizan acciones críticas:
  // (Ejemplo en DashboardComponent)
  /*
  deleteItem(): void {
    if (this.authService.hasPermission('delete_post')) {
      // ... lógica de eliminación
      this.auditService.logEvent({
        action: 'DELETE_ITEM',
        resource: 'Item:XYZ', // ID del item
        details: { status: 'success', category: '...', value: '...' }
      });
    } else {
      this.auditService.logEvent({
        action: 'DELETE_ITEM_ATTEMPT_FAILED',
        resource: 'Item:XYZ',
        details: { reason: 'Unauthorized', userRole: this.authService.getUserRoles() }
      });
    }
  }
  */
}


// 3. **Implementación de Auditoría en el Backend (Conceptual - Node.js/Express)**
// Esto es lo que el endpoint `/api/audit` podría hacer.

/*
// server.js (o tu archivo de ruta de auditoría)
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());

// Middleware para simular la captura de IP y User-Agent
app.use((req, res, next) => {
    req.audit = {
        ipAddress: req.ip,
        userAgent: req.headers['user-agent']
    };
    next();
});

// Endpoint para recibir eventos de auditoría del frontend
app.post('/api/audit', (req, res) => {
    const { action, resource, details, timestamp, userId, username } = req.body;
    const { ipAddress, userAgent } = req.audit;

    // Lógica para guardar el evento de auditoría en la base de datos o en un sistema de logs
    const auditRecord = {
        timestamp: timestamp || new Date().toISOString(),
        userId: userId || 'anonymous',
        username: username || 'anonymous',
        action,
        resource,
        details: details || {},
        ipAddress,
        userAgent
    };

    console.log('AUDIT LOG:', auditRecord); // En un entorno real, esto iría a una DB o log centralizado

    // Ejemplo de cómo guardar en una base de datos PostgreSQL (conceptual)
    // const { Pool } = require('pg');
    // const pool = new Pool({...});
    // pool.query(`INSERT INTO audit_logs (timestamp, user_id, action, resource, details, ip_address, user_agent)
    //             VALUES ($1, $2, $3, $4, $5, $6, $7)`,
    //             [auditRecord.timestamp, auditRecord.userId, auditRecord.action,
    //              auditRecord.resource, JSON.stringify(auditRecord.details),
    //              auditRecord.ipAddress, auditRecord.userAgent])
    //     .then(() => console.log('Audit record saved'))
    //     .catch(e => console.error('Error saving audit record', e));

    res.status(200).send({ message: 'Audit event received' });
});

// Ejemplo de middleware de auditoría para operaciones críticas en el backend
function auditAction(actionType, getResourceId = (req) => null, getDetails = (req) => {}) {
    return (req, res, next) => {
        // Antes de la acción
        res.on('finish', () => {
            const status = res.statusCode >= 200 && res.statusCode < 300 ? 'success' : 'failure';
            const auditRecord = {
                timestamp: new Date().toISOString(),
                userId: req.user ? req.user.id : 'anonymous', // Asume que el usuario está en req.user
                username: req.user ? req.user.username : 'anonymous',
                action: actionType,
                resource: getResourceId(req),
                details: { ...getDetails(req), status },
                ipAddress: req.ip,
                userAgent: req.headers['user-agent']
            };
            console.log('BACKEND AUDIT:', auditRecord);
            // Guarda auditRecord en DB
        });
        next();
    };
}

// Ejemplo de uso en una ruta protegida del backend
// app.delete('/api/posts/:id', protectRoute, auditAction('DELETE_POST', (req) => `Post:${req.params.id}`), (req, res) => {
//     // Lógica para eliminar el post
//     res.status(204).send();
// });
*/

/*
Errores comunes en la auditoría de acciones de usuarios:

1.  **Auditar solo en el frontend**:
    Los logs del frontend son útiles para entender la experiencia del usuario o errores,
    pero **no son confiables para la seguridad y la auditoría forense**.
    Siempre audita las acciones críticas en el backend, donde pueden ser verificadas y protegidas.

2.  **No registrar suficiente contexto**:
    Un log de auditoría debe responder a las preguntas: ¿Quién hizo qué, cuándo, dónde y cómo?
    Asegúrate de incluir ID de usuario, tipo de acción, recurso afectado, marca de tiempo,
    dirección IP, user-agent y cualquier detalle relevante de la operación.

3.  **Registrar datos sensibles en texto plano**:
    Nunca incluyas contraseñas, números de tarjeta de crédito o PII sensible en los logs.
    Esto convertiría tus logs en una mina de oro para atacantes.

4.  **No proteger los logs de auditoría**:
    Los logs son un objetivo principal para los atacantes que buscan cubrir sus huellas.
    Deben almacenarse en un lugar seguro, con acceso restringido, y ser inmutables.

5.  **Ignorar los errores de envío de logs**:
    Si la llamada al servicio de auditoría falla, no debes detener la operación principal,
    pero sí debes registrar el error para que el problema de logging pueda ser investigado.
*/
'''
  });
}

Future<void> insertAngularMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Preparación para Producción',
    'subtopic': 'Optimización de builds',
    'definition': r'''
La optimización de builds en Angular se trata de hacer que tu aplicación, una vez que está lista para ser desplegada, sea lo más pequeña y rápida posible. Piensa en ello como empaquetar una mochila para un viaje largo: quieres llevar lo esencial, pero bien organizado y ligero para que no te cueste avanzar.

¿Te estás preguntando por qué esto importa? 

Cuando tus usuarios abren tu aplicación, su navegador tiene que descargar y procesar todos los archivos JavaScript, CSS y HTML. Si estos archivos son gigantes, la aplicación tardará una eternidad en cargar, lo que frustrará a tus usuarios y podría hacer que abandonen tu sitio. Una aplicación lenta impacta directamente en la experiencia de usuario y, en última instancia, en el éxito de tu proyecto. Google, por ejemplo, penaliza en su ranking de búsqueda a los sitios web lentos, así que una buena optimización no solo agrada a los usuarios, sino también a los motores de búsqueda.

La optimización de builds no es una bala de plata, es un conjunto de técnicas que se aplican durante el proceso de compilación de tu aplicación para producción, principalmente usando el Angular CLI. Algunas de las estrategias clave incluyen:

* **Minificación**: Elimina todos los caracteres innecesarios del código (espacios en blanco, saltos de línea, comentarios, etc.) sin cambiar su funcionalidad. Esto reduce drásticamente el tamaño del archivo. Es como comprimir un archivo ZIP.
* **Uglificación (o ofuscación)**: Renombra variables, funciones y clases a nombres más cortos. Por ejemplo, `nombreDeUsuario` podría convertirse en `nu`. Esto no solo reduce el tamaño, sino que también dificulta la ingeniería inversa del código.
* **Compilación Ahead-of-Time (AOT)**: En lugar de compilar las plantillas de Angular en el navegador en tiempo de ejecución (Just-in-Time o JIT), AOT las compila durante el proceso de build. Esto significa que el navegador no tiene que hacer ese trabajo, lo que acelera el tiempo de carga y la renderización inicial. También permite que el Tree Shaking funcione de manera más efectiva.
* **Tree Shaking**: Elimina el código no utilizado de tu aplicación. Si importas una librería grande pero solo usas una pequeña parte de ella, el Tree Shaking se asegura de que solo esa pequeña parte sea incluida en el bundle final. Es como quitar las ramas muertas de un árbol para que esté más sano y ligero.
* **Code Splitting / Lazy Loading**: Divide tu aplicación en varios "chunks" (trozos de código). Solo se carga el código necesario para la parte de la aplicación que el usuario está visitando en ese momento. Los demás chunks se cargan "perezosamente" (lazy-loading) cuando se necesitan. Esto mejora drásticamente el tiempo de carga inicial.
* **Generación de Source Maps**: Aunque no reducen el tamaño del bundle, los Source Maps son cruciales para la depuración en producción. Permiten mapear el código compilado de vuelta al código fuente original, lo que facilita encontrar y corregir errores. Asegúrate de que, si bien son útiles para depurar, no estén expuestos públicamente en producción para evitar dar información a atacantes.
* **Optimización de imágenes y otros activos**: Comprimir imágenes, usar formatos eficientes (WebP), y servir archivos estáticos desde una CDN (Content Delivery Network) también contribuyen significativamente a la velocidad de carga.

El Angular CLI hace un trabajo excepcional al aplicar muchas de estas optimizaciones por defecto cuando ejecutas `ng build --configuration production` o simplemente `ng build --prod` (en versiones antiguas). Sin embargo, entender qué hacen estas optimizaciones te permite configurar tu proyecto de manera más efectiva y diagnosticar problemas de rendimiento.
''',
    'code_example': r'''
// --- EJEMPLO: OPTIMIZACIÓN DE BUILDS EN ANGULAR ---

// La mayoría de las optimizaciones se configuran y ejecutan
// automáticamente con el Angular CLI. No hay código de Angular
// específico para "hacer" la minificación o el tree shaking;
// simplemente configuras tu proyecto y usas los comandos de build.

// 1. **Comando Básico de Build para Producción**

// Para compilar tu aplicación con las optimizaciones predeterminadas
// de Angular CLI para producción, simplemente usa:
// ng build --configuration production
// O en versiones más antiguas del CLI:
// ng build --prod

// Este comando habilita automáticamente:
// - Producción AOT (Ahead-of-Time Compilation)
// - Tree Shaking (eliminación de código muerto)
// - Minificación y Uglificación del código JavaScript, CSS y HTML
// - Generación de Source Maps (por defecto en producción, se pueden deshabilitar)
// - Optimización de CSS y HTML

// 2. **Archivo `angular.json` - Configuración de Optimización**

// Puedes ajustar algunas configuraciones de optimización en tu archivo `angular.json`.
// Busca la sección `architect.build.configurations.production`.

/*
// src/angular.json
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "newProjectRoot": "projects",
  "projects": {
    "my-app": {
      "projectType": "application",
      "schematics": {},
      "root": "",
      "sourceRoot": "src",
      "prefix": "app",
      "architect": {
        "build": {
          "builder": "@angular-devkit/build-angular:browser",
          "options": {
            // ... otras opciones
            "outputPath": "dist/my-app",
            "index": "src/index.html",
            "main": "src/main.ts",
            "polyfills": [
              "zone.js"
            ],
            "tsConfig": "tsconfig.app.json",
            "assets": [
              "src/favicon.ico",
              "src/assets"
            ],
            "styles": [
              "src/styles.css"
            ],
            "scripts": []
          },
          "configurations": {
            "production": {
              // --- Configuraciones de Optimización ---
              "budgets": [
                {
                  "type": "initial",
                  "maximumWarning": "500kb",
                  "maximumError": "1mb"
                },
                {
                  "type": "anyComponentStyle",
                  "maximumWarning": "2kb",
                  "maximumError": "4kb"
                }
              ],
              "outputHashing": "all", // Añade hashes a los nombres de archivo para cache-busting
              "optimization": true,   // Habilita minificación, tree-shaking, etc.
              "extractLicenses": true, // Extrae licencias de terceros
              "vendorChunk": false,    // No crea un chunk separado para el código de terceros
              "buildOptimizer": true,  // Habilita optimizaciones específicas de Angular
              "aot": true,             // Habilita compilación Ahead-of-Time
              "sourceMap": false,      // Deshabilita Source Maps en producción (por seguridad/tamaño)
              ""namedChunks": false   // No usa nombres de chunks legibles
            },
            "development": {
              // ... configuración para desarrollo
            }
          },
          "defaultConfiguration": "production" // Hace que "ng build" sin "--configuration" use "production"
        },
        "serve": { /* ... */ },
        "extract-i18n": { /* ... */ },
        "test": { /* ... */ }
      }
    }
  }
}
*/

// 3. **Ejemplo de Código para Tree Shaking (Concepto)**

// Angular CLI usa Webpack para hacer Tree Shaking. Para que funcione bien,
// tus librerías y tu propio código deben usar "módulos ES" (import/export).

// Imaginemos un archivo de utilidades:
// src/app/utils/math-utils.ts
export function add(a: number, b: number): number {
  return a + b;
}

export function subtract(a: number, b: number): number {
  return a - b;
}

export function multiply(a: number, b: number): number {
  return a * b;
}

// Si en tu componente solo usas `add`:
// src/app/my-component/my-component.ts
import { add } from '../utils/math-utils';

// ...
  someCalculation() {
    const sum = add(5, 3);
    console.log(sum);
  }
// ...

// Cuando compiles en producción con `ng build --prod`, el Tree Shaking de Webpack
// detectará que `subtract` y `multiply` no se están utilizando y los eliminará
// del bundle final, reduciendo el tamaño del archivo JS.

// 4. **Ejemplo de Lazy Loading (Optimización del tiempo de carga inicial)**

// Esto es una optimización clave para el tiempo de carga inicial,
// ya que divide la aplicación en "chunks" que se cargan solo cuando se necesitan.

// src/app/app-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent }, // Componente cargado al inicio
  {
    path: 'admin',
    loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) // Carga perezosa
  },
  {
    path: 'dashboard',
    loadChildren: () => import('./dashboard/dashboard.module').then(m => m.DashboardModule) // Carga perezosa
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// Con esta configuración, el código de `AdminModule` y `DashboardModule`
// solo se descargará del servidor cuando el usuario navegue a las rutas `/admin` o `/dashboard`,
// respectivamente. Esto reduce el tamaño del bundle inicial que el navegador debe cargar.

/*
Errores comunes en la optimización de builds:

1.  **No usar `ng build --configuration production`**:
    El error más básico. Si compilas con `ng build` sin el flag `--configuration production`
    (o `--prod`), obtendrás un build de desarrollo, que es mucho más grande y lento,
    con más código de depuración y sin las optimizaciones esenciales para producción.

2.  **Importar librerías completas cuando solo se necesitan partes**:
    Muchas librerías permiten importaciones modulares (ej., `import { ButtonModule } from '@angular/material/button'`
    en lugar de importar un módulo `MaterialModule` gigantesco que contenga todo).
    Importar la librería entera desactiva el Tree Shaking para esa librería, inflando el tamaño.

3.  **No usar Lazy Loading para módulos grandes**:
    Si tu aplicación crece y tienes módulos con muchas funcionalidades que no se usan
    al inicio (ej., un panel de administración), no usar Lazy Loading significará que
    todo ese código se descargará de golpe, ralentizando la carga inicial para todos los usuarios.

4.  **Olvidar la compresión en el servidor**:
    Aunque Angular optimiza los archivos, tu servidor web (Nginx, Apache) debe estar configurado
    para comprimir los archivos (Gzip o Brotli) antes de enviarlos al navegador. Esto reduce
    aún más el tamaño de los datos transferidos.

5.  **Exponer Source Maps en producción sin control**:
    Aunque los Source Maps son útiles para depurar problemas en producción, no deberías
    servirlos directamente a todos los usuarios, ya que exponen tu código fuente.
    Lo ideal es que solo los desarrolladores puedan acceder a ellos o que se sirvan
    solo para herramientas de monitoreo de errores como Sentry.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Preparación para Producción',
    'subtopic': 'Uso de AOT y Tree Shaking',
    'definition': r'''
Cuando hablamos de preparar tu aplicación Angular para producción, el "Uso de AOT y Tree Shaking" son dos de las técnicas más importantes y efectivas para que tu app cargue y se ejecute de forma más rápida. No son solo palabras de moda, sino herramientas fundamentales que el Angular CLI maneja por ti, pero que es crucial entender.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un restaurante. Si la cocina (el servidor) prepara todos los platos (componentes, plantillas) antes de que el cliente (el navegador) llegue, el cliente recibe su comida mucho más rápido. Eso es AOT. Ahora, si además la cocina solo pide y usa los ingredientes que realmente necesita para esos platos y desecha el resto, el restaurante (la aplicación) es más eficiente y ligero. Eso es Tree Shaking. Sin estas optimizaciones, tu aplicación sería como un restaurante que cocina todo al momento de que llega el cliente, con un montón de ingredientes desperdiciados en la nevera, lo que lo haría muy lento y pesado.

**Compilación Ahead-of-Time (AOT)**

Normalmente, el código JavaScript se compila "Just-in-Time" (JIT), es decir, en el momento de la ejecución. En Angular, esto significa que el navegador descargaría tu aplicación, y luego el motor de Angular en el navegador compilaría tus plantillas HTML y TypeScript en código JavaScript ejecutable. La compilación JIT es fantástica para el desarrollo porque es rápida y te permite ver los cambios al instante.

Sin embargo, para producción, quieres la máxima velocidad. Aquí es donde entra AOT:

* **¿Qué hace?**: AOT compila tus plantillas y componentes de Angular **antes** de que la aplicación sea servida al navegador. Es decir, durante la fase de build.
* **Beneficios**:
    * **Carga más rápida**: El navegador descarga código JavaScript ya compilado y optimizado, no tiene que hacer la compilación en tiempo de ejecución. Esto reduce el "tiempo hasta la interactividad" (Time To Interactive - TTI).
    * **Menos peticiones HTTP**: Las plantillas se "fusionan" con el código de los componentes, eliminando la necesidad de que el navegador haga peticiones separadas para cargar archivos HTML de plantillas.
    * **Detección temprana de errores**: Muchos errores de plantilla y de enlaces de datos que normalmente solo se detectarían en tiempo de ejecución con JIT, se detectan durante la compilación AOT, lo que te ayuda a corregirlos antes de que lleguen a producción.
    * **Mayor seguridad**: El código compilado es más difícil de leer y manipular.
    * **Habilita Tree Shaking efectivo**: AOT genera un código JavaScript más limpio y estático, lo que permite que el Tree Shaking funcione de manera mucho más eficiente.

**Tree Shaking (Eliminación de Código Muerto)**

El Tree Shaking es una técnica de optimización de código que se usa para eliminar el código no utilizado de tu bundle final. Imagina que importas una librería gigante (como Lodash o RxJS) pero solo usas una o dos funciones de ella. Sin Tree Shaking, toda la librería se incluiría en tu paquete. Con Tree Shaking, solo se incluyen las partes que realmente usas.

* **¿Cómo funciona?**: Se basa en los "módulos ES" (`import`/`export`) para rastrear las dependencias. Si una función o un módulo no es importado y utilizado por ninguna otra parte de tu código, el "shaker" (normalmente Webpack en el caso de Angular CLI) lo identifica como "código muerto" y lo elimina del paquete final.
* **Dependencia con AOT**: Aunque no es estrictamente necesario, AOT mejora significativamente la eficacia del Tree Shaking. Al compilar las plantillas y los componentes a código JavaScript plano, AOT ayuda a Webpack a identificar con mayor precisión qué partes del código de Angular o de librerías de terceros son realmente utilizadas.
* **Beneficios**:
    * **Reducción drástica del tamaño del bundle**: Esto es el beneficio principal. Un bundle más pequeño significa descargas más rápidas y menos consumo de datos para el usuario.
    * **Mejora de la velocidad de parseo y ejecución**: Menos código que el navegador tiene que analizar y ejecutar.

Ambas técnicas se activan automáticamente cuando utilizas el comando `ng build --configuration production` (o `ng build --prod` en versiones anteriores del CLI). No tienes que configurar manualmente Webpack o Babel; el Angular CLI se encarga de todo esto por ti, siguiendo las mejores prácticas. Esto es una de las grandes ventajas de usar un framework como Angular, que te proporciona herramientas de construcción robustas y optimizadas desde el primer día.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE AOT Y TREE SHAKING ---

// En Angular, AOT y Tree Shaking son características del proceso de build,
// no de código que escribas directamente en tu aplicación.
// Se activan con el comando de build para producción.

// 1. **Activación de AOT y Tree Shaking (Comando CLI)**

// La forma más común y recomendada de activar AOT y Tree Shaking
// es simplemente ejecutar el comando de build de Angular CLI para producción:
// ng build --configuration production

// O en versiones más antiguas del CLI:
// ng build --prod

// Cuando ejecutas este comando:
// - `aot: true` en `angular.json` asegura que la compilación Ahead-of-Time esté activa.
// - `optimization: true` en `angular.json` (que es parte de la configuración `production` por defecto)
//   habilita el Tree Shaking, la minificación y la uglificación.

// 2. **Impacto de AOT (Conceptual)**

// Imagina este componente con su plantilla:

// src/app/my-component/my-component.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-my-component',
  template: `
    <h2>Hola, {{ name }}!</h2>
    <button (click)="changeName()">Cambiar Nombre</button>
  `,
  styles: [`h2 { color: blue; }`]
})
export class MyComponent {
  name = 'Mundo';

  changeName() {
    this.name = 'Angular';
  }
}

// Con compilación JIT (desarrollo):
// El navegador descarga el TypeScript y el HTML.
// En tiempo de ejecución, el compilador JIT de Angular (que forma parte del runtime descargado)
// "lee" el `@Component` y la plantilla, los convierte en código JavaScript ejecutable,
// y luego renderiza el componente. Esto añade una sobrecarga inicial.

// Con compilación AOT (producción):
// Durante `ng build --prod`, el compilador AOT procesa `MyComponent` y su plantilla.
// Genera directamente el código JavaScript que ya contiene la lógica de renderizado
// y enlace de datos. Lo que se descarga al navegador es directamente ese código JS ya optimizado.
// El navegador no necesita el compilador JIT, lo que reduce el tamaño del runtime de Angular
// y el tiempo de inicio de la aplicación.

// 3. **Impacto de Tree Shaking (Ejemplo de Código)**

// Para que el Tree Shaking funcione eficazmente, necesitas usar módulos ES (`import`/`export`)
// y asegurarte de que tus librerías también los utilicen.

// Ejemplo 1: Librería de utilidades custom
// src/app/utils/string-utils.ts
export function capitalize(text: string): string {
  return text.charAt(0).toUpperCase() + text.slice(1);
}

export function reverse(text: string): string {
  return text.split('').reverse().join('');
}

// src/app/some-component/some-component.component.ts
import { capitalize } from '../utils/string-utils'; // Solo importamos 'capitalize'

@Component({
  selector: 'app-some-component',
  template: `<p>{{ capitalizedText }}</p>`
})
export class SomeComponent {
  capitalizedText = capitalize('hello angular');
  // No usamos `reverse` en este componente
}

// Cuando se hace `ng build --prod`, la función `reverse` será "sacudida" (tree-shaked)
// del bundle final porque no se está utilizando en ninguna parte de la aplicación.
// Esto reduce el tamaño del bundle.

// Ejemplo 2: Importaciones modulares de librerías grandes (ej. RxJS, Angular Material)
// src/app/app.module.ts
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { MatButtonModule } from '@angular/material/button'; // Importación modular

import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    MatButtonModule, // Solo importamos el módulo de botones, no el MatModule completo
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// En este caso, si solo necesitas `MatButtonModule` de Angular Material,
// importarlo específicamente (en lugar de un `MaterialModule` gigante que contenga todo)
// permite que el Tree Shaking de Webpack elimine los componentes de Material
// que no estás usando (ej., `MatDatepickerModule`, `MatDialogModule`, etc.),
// reduciendo el tamaño del bundle de tu aplicación.

/*
Errores comunes relacionados con AOT y Tree Shaking:

1.  **No usar `ng build --configuration production`**:
    Como se mencionó, es el error fundamental. Si no compilas en modo producción,
    no obtendrás los beneficios de AOT y Tree Shaking, resultando en una aplicación
    más lenta y pesada.

2.  **Importaciones no modulares que impiden el Tree Shaking**:
    Si utilizas librerías que no están diseñadas con módulos ES o las importas de
    una manera que arrastra todo el paquete (ej., `import * as _ from 'lodash';`
    en lugar de `import { someFunction } from 'lodash';` cuando solo necesitas una función),
    el Tree Shaking no podrá eliminar el código no utilizado. Siempre busca
    importaciones "deep" o específicas si la librería lo permite.

3.  **Errores en tiempo de ejecución que eran "silenciosos" en desarrollo**:
    AOT es estricto. A veces, el compilador JIT en desarrollo es más permisivo y permite
    ciertos errores de plantilla o de tipo que AOT detecta y reporta como errores de compilación.
    Esto no es un error de AOT, sino un beneficio (te ayuda a encontrar bugs), pero puede
    ser frustrante si no estás acostumbrado.

4.  **No optimizar los assets (imágenes, CSS) de forma externa**:
    Aunque AOT y Tree Shaking optimizan el JS/TS/HTML de Angular, no hacen nada
    con las imágenes o archivos CSS grandes que no están dentro de la pipeline de Angular.
    Debes optimizar estos assets por separado (comprimir imágenes, usar SVGs, etc.).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Preparación para Producción',
    'subtopic': 'Configuración de entornos',
    'definition': r'''
Cuando desarrollas una aplicación, es raro que trabaje exactamente igual en tu máquina que en el servidor donde la ven los usuarios. La "configuración de entornos" se refiere a la forma en que tu aplicación adapta su comportamiento (URLs de API, claves de servicios externos, modos de logging, etc.) dependiendo del lugar donde se esté ejecutando: tu máquina de desarrollo, un servidor de pruebas o el entorno de producción real.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un mapa. No es lo mismo un mapa de tu barrio (entorno de desarrollo), que un mapa de la ciudad (entorno de staging/pruebas), que un mapa del país completo (entorno de producción). Cada mapa tiene diferentes niveles de detalle, diferentes carreteras marcadas y diferentes destinos relevantes. De la misma manera, tu aplicación necesita configuraciones diferentes para cada entorno para funcionar correctamente y de forma segura. Si usaras la URL de tu API de desarrollo en producción, tu aplicación no funcionaría porque intentaría comunicarse con un servidor que no existe para los usuarios finales.

Angular CLI tiene un sistema incorporado para gestionar la configuración de entornos que es bastante robusto y sencillo de usar:

* **Archivo `environment.ts`**: Es el archivo base de configuración de tu entorno de desarrollo. Contiene variables como la URL de la API, un indicador de si estás en modo de producción, etc.
* **Archivo `environment.prod.ts`**: Este archivo contiene la configuración para el entorno de producción. Cuando ejecutas `ng build --configuration production`, el Angular CLI reemplaza automáticamente el archivo `environment.ts` por `environment.prod.ts` durante el proceso de compilación. Esto asegura que tu aplicación de producción utilice las URLs y las claves correctas.
* **Archivos de entorno personalizados**: Puedes crear configuraciones para otros entornos además de `development` y `production`, como `staging`, `qa`, etc. Simplemente crea `environment.staging.ts` y configúralo en `angular.json` para que el CLI sepa cómo usarlo (ver ejemplo).

**¿Qué tipo de información se configura por entorno?**

* **URLs de API**: La dirección donde tu frontend se comunicará con tu backend.
* **Claves de API de terceros**: Para servicios como Google Maps, Stripe, o cualquier otra API externa. Es crucial que las claves de producción sean diferentes a las de desarrollo y que nunca se almacenen directamente en el código fuente de una manera que las exponga. Para claves sensibles, a menudo se usa un proxy o un servicio de backend que las gestione de forma segura.
* **Modo de depuración/logging**: En desarrollo, quieres ver logs detallados. En producción, solo quieres ver logs de errores críticos para no sobrecargar el sistema ni exponer información sensible.
* **Modo de producción**: Un flag booleano que puedes usar en tu código para activar/desactivar ciertas funcionalidades solo en producción (ej., Google Analytics, Sentry).
* **Configuración de Web Sockets**: URLs de servidores de WebSockets.

Es importante recordar que esta configuración en el frontend es para variables no sensibles o para URLs. Las claves de API que son realmente confidenciales (ej., las claves secretas de Stripe) **NUNCA deben estar en el frontend**, ni siquiera en los archivos de entorno de producción. Deben estar en tu backend o en variables de entorno del servidor, y el frontend se comunicaría con el backend para que este último haga las llamadas seguras a los servicios de terceros. Empresas como Netflix, con su vasta infraestructura y múltiples entornos de desarrollo, pruebas y producción, dependen en gran medida de una gestión de configuración de entornos robusta para asegurar que cada microservicio y aplicación frontend se comporte según lo esperado en su entorno específico.
''',
    'code_example': r'''
// --- EJEMPLO: CONFIGURACIÓN DE ENTORNOS EN ANGULAR ---

// Angular CLI proporciona un sistema de archivos `environment.ts`
// para gestionar las configuraciones por entorno.

// 1. **Archivos de Entorno (Por defecto)**

// src/environments/environment.ts (Para desarrollo)
export const environment = {
  production: false,
  apiUrl: 'http://localhost:3000/api', // API de desarrollo
  debugMode: true,
  stripePublicKey: 'pk_test_YOUR_DEV_KEY', // Clave pública de prueba
  loggingLevel: 'debug'
};

// src/environments/environment.prod.ts (Para producción)
export const environment = {
  production: true,
  apiUrl: 'https://api.yourdomain.com/api', // API de producción
  debugMode: false,
  stripePublicKey: 'pk_live_YOUR_PROD_KEY', // Clave pública real
  loggingLevel: 'error'
};

// 2. **Configuración en `angular.json`**

// El archivo `angular.json` define cómo el CLI reemplaza los archivos de entorno
// cuando se compila para diferentes configuraciones.
// Busca la sección `architect.build.configurations`.

/*
// src/angular.json
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "newProjectRoot": "projects",
  "projects": {
    "my-app": {
      // ...
      "architect": {
        "build": {
          // ...
          "options": {
            // ...
            "outputPath": "dist/my-app",
            "index": "src/index.html",
            "main": "src/main.ts",
            "polyfills": [
              "zone.js"
            ],
            "tsConfig": "tsconfig.app.json",
            "assets": [
              "src/favicon.ico",
              "src/assets"
            ],
            "styles": [
              "src/styles.css"
            ],
            "scripts": []
          },
          "configurations": {
            "production": {
              // ... otras opciones de producción
              "fileReplacements": [
                {
                  "replace": "src/environments/environment.ts",
                  "with": "src/environments/environment.prod.ts"
                }
              ]
            },
            "development": {
              // Puedes tener configuraciones específicas para desarrollo aquí si no quieres las de `options`
            },
            // --- Ejemplo: Configuración de un entorno 'staging' personalizado ---
            "staging": {
              "fileReplacements": [
                {
                  "replace": "src/environments/environment.ts",
                  "with": "src/environments/environment.staging.ts"
                }
              ],
              "optimization": true, // Puedes aplicar optimizaciones también a staging
              "outputHashing": "all"
            }
          },
          "defaultConfiguration": "development" // Por defecto, `ng serve` usará el entorno de desarrollo
        },
        "serve": {
          "builder": "@angular-devkit/build-angular:dev-server",
          "configurations": {
            "production": {
              "browserTarget": "my-app:build:production"
            },
            "development": {
              "browserTarget": "my-app:build:development"
            },
            "staging": { // Permite servir con el entorno de staging
              "browserTarget": "my-app:build:staging"
            }
          },
          "defaultConfiguration": "development"
        },
        // ...
      }
    }
  }
}
*/

// 3. **Creando un entorno 'staging' personalizado**

// Primero, crea el archivo:
// src/environments/environment.staging.ts
export const environment = {
  production: false, // O true, dependiendo de si quieres que staging sea como prod o dev
  apiUrl: 'https://api.staging.yourdomain.com/api', // API de staging
  debugMode: false,
  stripePublicKey: 'pk_test_YOUR_STAGING_KEY',
  loggingLevel: 'info'
};

// Luego, asegúrate de que esté configurado en `angular.json` como se mostró arriba.

// 4. **Uso de las variables de entorno en tu aplicación**

// Puedes importar `environment` en cualquier archivo de tu aplicación Angular:

// src/app/services/api.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment'; // Importa el entorno

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getData(): Observable<any> {
    return this.http.get(`${this.baseUrl}/data`);
  }

  // Ejemplo de lógica condicional basada en el entorno
  logMessage(message: string): void {
    if (environment.debugMode) {
      console.log('DEBUG:', message);
    }
    // En producción, solo se registrarían errores según environment.loggingLevel
  }
}

// src/app/app.component.ts
import { Component } from '@angular/core';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  template: `
    <h1>Mi aplicación Angular</h1>
    <p>Modo de producción: {{ environment.production }}</p>
    <p>URL de la API: {{ environment.apiUrl }}</p>
    <button *ngIf="!environment.production">Botón de prueba en desarrollo</button>
  `,
  styles: []
})
export class AppComponent {
  environment = environment; // Hace que la variable 'environment' esté disponible en la plantilla
}


// 5. **Comandos para compilar y servir con diferentes entornos**

// Para desarrollo (por defecto):
// ng serve
// ng build

// Para producción:
// ng serve --configuration production
// ng build --configuration production

// Para staging (después de configurar en angular.json):
// ng serve --configuration staging
// ng build --configuration staging

/*
Errores comunes en la configuración de entornos:

1.  **Almacenar claves secretas en `environment.ts`**:
    **Nunca**, bajo ninguna circunstancia, guardes claves API secretas (ej., claves privadas de pasarelas de pago, secretos de OAuth) en los archivos `environment.ts`. Estos archivos son parte de tu bundle de frontend y, aunque compilados, pueden ser inspeccionados por el cliente. Las claves secretas deben residir en tu backend o en servicios de gestión de secretos (como AWS Secrets Manager, HashiCorp Vault), y tu backend las utilizará de forma segura.

2.  **No usar `fileReplacements` correctamente**:
    Si no configuras correctamente los `fileReplacements` en `angular.json` para cada entorno, el CLI no sustituirá los archivos de entorno, y podrías terminar con tu aplicación de producción usando las configuraciones de desarrollo.

3.  **Depender de variables de entorno del sistema operativo directamente en el frontend**:
    Angular no lee variables de entorno del sistema operativo directamente (como `process.env.NODE_ENV` en Node.js) en el navegador. La forma correcta de inyectar estas variables es a través del sistema de entornos de `angular.json` durante el build.

4.  **No tener un entorno de pruebas/staging**:
    Ir directamente de desarrollo a producción es una receta para desastres. Un entorno de staging o QA es crucial para probar tu aplicación con configuraciones similares a las de producción antes del despliegue final.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Integración Continua',
    'subtopic': 'Configuración de pipelines con GitHub Actions',
    'definition': r'''
La "Integración Continua" (CI) es una práctica de desarrollo donde los desarrolladores integran su código en un repositorio compartido varias veces al día. Cada integración se verifica mediante una construcción automatizada (conocida como "pipeline"), que incluye pruebas, para detectar errores de integración lo más rápido posible. Configurar "pipelines con GitHub Actions" es una forma popular y eficiente de lograr esto para tus proyectos de Angular alojados en GitHub.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una línea de producción en una fábrica. Si cada estación de trabajo fabrica una pieza y la pasa a la siguiente sin verificar si encaja, el producto final podría ser un desastre. Sin embargo, si cada pieza se verifica y se ensambla continuamente, los defectos se encuentran y corrigen mucho antes, lo que ahorra tiempo y dinero. De manera similar, en el desarrollo de software, la integración continua previene el "infierno de las fusiones" (merge hell) y asegura que tu código base esté siempre en un estado funcional, lo que permite a los equipos entregar software de manera más rápida y confiable. Empresas como Microsoft, que son dueños de GitHub, utilizan extensivamente GitHub Actions para construir, probar y desplegar sus propios productos.

GitHub Actions es una plataforma de CI/CD (Integración Continua/Despliegue Continuo) integrada directamente en GitHub. Te permite automatizar, personalizar y ejecutar tus flujos de trabajo de desarrollo de software directamente desde tu repositorio. Un "pipeline" en GitHub Actions es una serie de pasos definidos en un archivo YAML que se ejecuta automáticamente en respuesta a eventos específicos en tu repositorio (ej., un `push` a una rama, la apertura de un `pull request`).

Los componentes principales de una pipeline de GitHub Actions son:

* **Workflows**: El archivo YAML (`.github/workflows/*.yml`) que define tu flujo de trabajo. Un repositorio puede tener múltiples workflows.
* **Events**: Los desencadenantes que inician un workflow (ej., `on: [push, pull_request]`).
* **Jobs**: Un conjunto de pasos que se ejecutan en el mismo "runner" (una máquina virtual o contenedor). Los jobs se ejecutan en paralelo por defecto, pero pueden configurarse para ejecutarse secuencialmente.
* **Steps**: Una secuencia de tareas dentro de un job. Pueden ser scripts que ejecutas o "actions" (acciones predefinidas de la comunidad o personalizadas).
* **Actions**: Aplicaciones preempaquetadas que realizan una tarea específica, como configurar un entorno de Node.js, instalar dependencias o construir tu aplicación.

Configurar una pipeline para una aplicación Angular generalmente implica los siguientes pasos:

1.  **Detectar cambios**: El pipeline se activa cuando hay un `push` a la rama principal o cuando se abre un `pull request`.
2.  **Configurar el entorno**: Se instala Node.js en la máquina virtual donde se ejecutará el job.
3.  **Instalar dependencias**: Se ejecutan comandos como `npm install` o `yarn install`.
4.  **Construir la aplicación**: Se compila la aplicación Angular para producción (`ng build --configuration production`).
5.  **Ejecutar pruebas**: Se ejecutan las pruebas unitarias y de integración (`ng test --no-watch --browsers=ChromeHeadless`).
6.  **Analizar calidad de código (opcional)**: Herramientas como SonarQube o ESLint pueden ejecutarse para revisar el código.
7.  **Artefactos (opcional)**: Empaquetar los archivos de la aplicación compilada para su futuro despliegue.

El objetivo final es que cada vez que subas código, obtengas una retroalimentación rápida sobre si tus cambios rompieron algo, manteniendo tu rama principal siempre "desplegable".
''',
    'code_example': r'''
// --- EJEMPLO: CONFIGURACIÓN DE PIPELINES CON GITHUB ACTIONS PARA ANGULAR ---

// Los pipelines de GitHub Actions se definen en archivos YAML
// dentro de la carpeta `.github/workflows/` en la raíz de tu repositorio.

// 1. **Archivo de Workflow Básico para Angular**

// .github/workflows/angular-ci.yml
name: Angular CI

on:
  push:
    branches:
      - main # Ejecuta el workflow en cada push a la rama 'main'
  pull_request:
    branches:
      - main # Ejecuta el workflow en cada pull request dirigido a 'main'

jobs:
  build-and-test:
    runs-on: ubuntu-latest # Elige el sistema operativo para el runner

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4 # Clona el repositorio

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20' # Usa la versión de Node.js que necesites

      - name: Install dependencies
        run: npm ci # 'npm ci' es más rápido y reproducible para CI/CD

      - name: Build Angular app for production
        run: npm run build -- --configuration production # Compila la app para producción

      - name: Run unit tests
        run: npm test -- --no-watch --browsers=ChromeHeadless # Ejecuta pruebas unitarias sin abrir navegador
                                                            # --no-watch: corre las pruebas una vez y sale
                                                            # --browsers=ChromeHeadless: usa Chrome sin interfaz gráfica
      - name: Lint code (Optional)
        run: npm run lint # Ejecuta el linter (si tienes scripts 'lint' en package.json)

      - name: Archive production artifacts (Optional)
        uses: actions/upload-artifact@v4
        with:
          name: angular-dist
          path: dist/your-app-name # Asegúrate de que 'your-app-name' coincida con tu outputPath en angular.json
                                   # Esto guardará los archivos compilados para usarlos en un job de despliegue posterior
/*
  # Puedes añadir otro job para el despliegue si lo deseas, por ejemplo:
  deploy:
    needs: build-and-test # Este job depende del éxito del job anterior
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main' && github.event_name == 'push' # Solo despliega si es un push a 'main'

    steps:
      - name: Download build artifacts
        uses: actions/download-artifact@v4
        with:
          name: angular-dist
          path: dist # Descarga los archivos compilados

      - name: Deploy to Netlify (Example)
        env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }} # Usa un secreto de GitHub
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
        run: npm install -g netlify-cli && netlify deploy --dir=dist/your-app-name --prod
*/

/*
Errores comunes en la configuración de pipelines con GitHub Actions:

1.  **Variables de entorno sensibles expuestas**:
    Nunca incluyas claves API, contraseñas o tokens secretos directamente en tu archivo YAML.
    Usa los "GitHub Secrets" (`${{ secrets.YOUR_SECRET_NAME }}`) para almacenar información sensible.

2.  **No usar `npm ci`**:
    En entornos de CI/CD, `npm install` puede no ser determinista. `npm ci` es la elección correcta
    porque instala las dependencias exactamente como están definidas en `package-lock.json`
    (o `yarn.lock`), lo que asegura builds reproducibles y más rápidos.

3.  **Dependencias de navegadores para pruebas**:
    Si tus pruebas unitarias (`ng test`) dependen de un navegador (como Chrome), asegúrate de
    que el runner de GitHub Actions tenga ese navegador instalado y que lo ejecutes en modo
    "headless" (`--browsers=ChromeHeadless`) para que no intente abrir una interfaz gráfica.

4.  **No especificar la versión de Node.js**:
    Si no especificas `node-version`, GitHub Actions podría usar una versión por defecto que no
    sea compatible con tu proyecto, llevando a fallos de instalación o compilación.

5.  **Rutas de salida incorrectas**:
    Asegúrate de que la ruta especificada en `path` para `upload-artifact` o en los comandos de
    despliegue (`dist/your-app-name`) coincida con el `outputPath` definido en tu `angular.json`.

6.  **Errores silenciosos en tests/lint**:
    Si tus scripts `npm test` o `npm run lint` no devuelven un código de salida diferente de cero
    cuando hay fallos, GitHub Actions no sabrá que la prueba/linting falló y el job seguirá como exitoso.
    Asegúrate de que tus scripts de prueba y linting salgan con un código de error si las pruebas fallan.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Integración Continua',
    'subtopic': 'Pruebas automatizadas',
    'definition': r'''
Las "pruebas automatizadas" son la columna vertebral de la Integración Continua (CI) y, de hecho, de cualquier proceso de desarrollo de software moderno. Se trata de escribir código para verificar que otro código (tu aplicación) funciona como se espera, y luego ejecutar estas verificaciones de forma automática cada vez que se realizan cambios en el código.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un paracaídas. No querrías que el paracaídas se probara por primera vez justo antes de que lo uses, ¿verdad? Querrías que se probara exhaustivamente en un entorno controlado y que se verificara su funcionamiento cada vez que se empaqueta. De manera similar, las pruebas automatizadas son tu "red de seguridad" en el desarrollo de software. Te permiten detectar errores rápidamente, antes de que lleguen a los usuarios finales, lo que ahorra tiempo, reduce costos y mejora la calidad general de tu software. Sin pruebas automatizadas, cada cambio de código se convierte en un riesgo, y la confianza del equipo en el software disminuye, lo que ralentiza el desarrollo. Empresas como Google invierten masivamente en pruebas automatizadas para mantener la calidad y fiabilidad de sus productos a escala global.

En el contexto de Angular y las pipelines de CI, las pruebas automatizadas se centran principalmente en:

* **Pruebas Unitarias**: Son las pruebas más pequeñas y rápidas. Verifican unidades individuales de código (funciones, métodos, clases, componentes aislados) para asegurar que se comportan como se espera. En Angular, se usan principalmente para componentes (sin renderizar la UI real), servicios, pipes y directivas. Frameworks comunes son Jasmine y Karma (que viene con Angular CLI).
* **Pruebas de Integración**: Verifican cómo interactúan diferentes unidades de código entre sí. Por ejemplo, cómo un componente interactúa con un servicio, o cómo dos servicios se comunican. Son más lentas que las unitarias pero proporcionan más confianza.
* **Pruebas End-to-End (E2E)**: Simulan el comportamiento de un usuario real navegando por la aplicación en un navegador real. Prueban el flujo completo de la aplicación, desde la interfaz de usuario hasta la base de datos, pasando por el backend. Son las más lentas pero también las que ofrecen mayor confianza de que toda la aplicación funciona. Herramientas populares son Cypress y Playwright (Protractor era la opción por defecto de Angular, pero está siendo deprecado).

**¿Cómo se integran en una pipeline de CI?**

En una pipeline de CI (como las que configuramos con GitHub Actions), las pruebas automatizadas se ejecutan después de que el código se ha compilado y las dependencias se han instalado. Si alguna prueba falla, el pipeline se detiene y la construcción se marca como fallida. Esto notifica inmediatamente a los desarrolladores sobre el problema, permitiéndoles corregirlo antes de que el código se fusione en la rama principal o se despliegue.

Para asegurar un entorno de pruebas consistente en CI, a menudo se ejecutan las pruebas en un navegador "headless" (sin interfaz gráfica), como ChromeHeadless. Esto garantiza que las pruebas se ejecuten de manera reproducible y sin depender de una pantalla o interacción humana.
''',
    'code_example': r'''
// --- EJEMPLO: PRUEBAS AUTOMATIZADAS EN ANGULAR Y CI ---

// Angular CLI viene preconfigurado con Karma y Jasmine para pruebas unitarias.
// Para E2E, Cypress o Playwright son las opciones modernas.

// 1. **Pruebas Unitarias con Karma y Jasmine**

// Archivo de especificación de componente (ej. src/app/my-component/my-component.component.spec.ts)
// Este es el archivo que verifica la lógica de tu componente.

import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MyComponent } from './my-component.component';
import { By } from '@angular/platform-browser'; // Para seleccionar elementos del DOM virtual

describe('MyComponent', () => {
  let component: MyComponent;
  let fixture: ComponentFixture<MyComponent>;
  let el: HTMLElement; // Representa el elemento del DOM

  beforeEach(async () => {
    // Configura el entorno de prueba para el componente
    await TestBed.configureTestingModule({
      imports: [MyComponent] // Si es un standalone component
      // declarations: [MyComponent] // Si no es standalone y está en un módulo
    })
    .compileComponents(); // Compila el componente y sus plantillas (si no usas AOT en tests)
  });

  beforeEach(() => {
    // Crea una instancia del componente y su fixture (entorno de prueba)
    fixture = TestBed.createComponent(MyComponent);
    component = fixture.componentInstance; // La instancia de la clase del componente
    el = fixture.nativeElement; // El elemento DOM nativo del componente
    fixture.detectChanges(); // Detecta los cambios iniciales y renderiza la plantilla
  });

  it('should create', () => {
    expect(component).toBeTruthy(); // Verifica que el componente se creó correctamente
  });

  it(`should have as title 'my-app'`, () => {
    // Verifica que una propiedad del componente tiene un valor esperado
    expect(component.title).toEqual('my-app');
  });

  it('should render title in a h1 tag', () => {
    // Verifica que el DOM renderizado contiene un elemento h1 con el texto esperado
    fixture.detectChanges(); // Asegura que los cambios se detecten y se renderice
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('h1')?.textContent).toContain('Hello, my-app');
  });

  it('should update name on button click', () => {
    // Simula una interacción del usuario y verifica el cambio en la UI
    const button = fixture.debugElement.query(By.css('button')).nativeElement; // Selecciona el botón
    button.click(); // Simula un clic
    fixture.detectChanges(); // Dispara la detección de cambios para actualizar el DOM
    expect(el.querySelector('h2')?.textContent).toContain('Angular'); // Verifica el texto actualizado
  });
});

// Para ejecutar las pruebas unitarias localmente:
// ng test
// Para ejecutarlas en una pipeline de CI (sin interfaz gráfica):
// ng test --no-watch --browsers=ChromeHeadless


// 2. **Pruebas End-to-End (E2E) con Cypress (Ejemplo conceptual)**

// Cypress es una herramienta de E2E muy popular por su facilidad de uso.
// Después de instalar Cypress (`npm install cypress --save-dev`), puedes crear un test así:

// cypress/e2e/spec.cy.ts
describe('My First E2E Test', () => {
  it('Visits the initial page and checks title', () => {
    cy.visit('/') // Visita la URL base de tu aplicación (normalmente http://localhost:4200 en desarrollo)
    cy.contains('h1', 'Hello, my-app'); // Verifica que el h1 contiene el texto
  });

  it('should navigate to login page', () => {
    cy.visit('/');
    cy.get('button').contains('Login').click(); // Busca un botón con el texto 'Login' y hace clic
    cy.url().should('include', '/login'); // Verifica que la URL contenga '/login'
  });

  it('should allow user to login', () => {
    cy.visit('/login');
    cy.get('input[name="username"]').type('testuser'); // Escribe en el campo de usuario
    cy.get('input[name="password"]').type('password123'); // Escribe en el campo de contraseña
    cy.get('button[type="submit"]').click(); // Haz clic en el botón de submit
    cy.url().should('include', '/dashboard'); // Espera ser redirigido al dashboard
    cy.contains('p', 'Bienvenido'); // Verifica que un texto de bienvenida está presente
  });
});

// Para ejecutar pruebas Cypress localmente (abre la UI de Cypress):
// npx cypress open

// Para ejecutar pruebas Cypress en una pipeline de CI (headless):
// npx cypress run

// 3. **Integración en GitHub Actions (revisitando el `angular-ci.yml`)**

// .github/workflows/angular-ci.yml
name: Angular CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install dependencies
        run: npm ci

      - name: Build Angular app
        run: npm run build -- --configuration production # El build puede ser necesario para E2E

      - name: Run Unit Tests
        run: npm test -- --no-watch --browsers=ChromeHeadless # Ejecuta pruebas unitarias

      - name: Run E2E Tests (with Cypress)
        # Necesitarías un servidor local para la app para que Cypress pueda interactuar con ella
        # 'start-server-and-test' es una herramienta útil para esto
        run: npm install -g start-server-and-test
        env:
          CYPRESS_BASE_URL: http://localhost:4200 # O la URL de tu app desplegada en CI
        run: start-server-and-test "npm start" http://localhost:4200 "npx cypress run"
        # O si el build sirve archivos estáticos (ej. Nginx en CI):
        # run: start-server-and-test "npx serve dist/your-app-name -l 4200" http://localhost:4200 "npx cypress run"

/*
Errores comunes en pruebas automatizadas y CI:

1.  **Falta de pruebas o cobertura insuficiente**:
    Si no escribes pruebas para las funcionalidades críticas o si la cobertura de tus pruebas
    es baja, los errores pueden pasar desapercibidos y llegar a producción.

2.  **Pruebas demasiado acopladas a la implementación**:
    Si tus pruebas unitarias están demasiado ligadas a los detalles de implementación interna
    de un componente o servicio (en lugar de a su comportamiento observable), se romperán
    frecuentemente incluso con cambios de refactorización inofensivos.

3.  **Pruebas E2E inestables (flaky tests)**:
    Las pruebas E2E son inherentemente más lentas e inestables que las unitarias.
    Fallos intermitentes pueden ser causados por problemas de temporización, selectores frágiles
    o dependencias externas. Usa esperas explícitas (`cy.wait()`, `cy.intercept()`) y selectores robustos.

4.  **No ejecutar pruebas en modo headless en CI**:
    Intentar ejecutar pruebas que requieren una interfaz gráfica en un entorno de CI sin pantalla
    causará fallos o timeouts. Siempre usa el modo headless para pruebas de navegador en CI.

5.  **No limpiar el estado entre pruebas**:
    Especialmente en pruebas E2E, asegúrate de que cada prueba comience desde un estado conocido y limpio.
    Esto puede implicar limpiar la base de datos o el almacenamiento local antes de cada prueba.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Integración Continua',
    'subtopic': 'Despliegue continuo a plataformas como Firebase o Netlify',
    'definition': r'''
Una vez que tienes tu aplicación Angular compilada y tus pruebas automatizadas pasando con éxito, el siguiente paso lógico es el "Despliegue Continuo" (CD). Esto significa que cada vez que tu código pase todas las etapas de la Integración Continua (build, tests), se despliega automáticamente en un entorno de producción (o staging). Este proceso se puede automatizar a plataformas como Firebase Hosting o Netlify, que son excelentes opciones para aplicaciones Angular estáticas o Single Page Applications (SPAs).

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en lanzar un nuevo producto al mercado. No querrías tener que pasar por un proceso manual y propenso a errores cada vez que lanzas una actualización. Querrías que el producto se empaquetara y se enviara de forma automática y fiable tan pronto como pase los controles de calidad. De manera similar, el despliegue continuo elimina los pasos manuales, reduce los errores humanos y acelera la entrega de nuevas funcionalidades a tus usuarios, lo que te permite innovar más rápido. Empresas de software modernas, desde startups hasta gigantes, confían en el CD para mantener un ritmo de desarrollo ágil y entregar valor constantemente.

**Despliegue Continuo (CD)**:
El CD va un paso más allá de la CI. No solo construyes y pruebas automáticamente, sino que también despliegas. Esto significa que si un cambio de código pasa todas las pruebas automatizadas, se considera lo suficientemente bueno como para ser lanzado. La automatización se encarga de transferir los archivos compilados al servidor o servicio de hosting.

**Plataformas populares para despliegue de Angular SPAs:**

* **Firebase Hosting**: Es una opción fantástica para aplicaciones Angular porque ofrece hosting de contenido estático rápido, con CDN global, SSL gratuito y personalización de dominio. También se integra muy bien con otras características de Firebase (Base de datos, autenticación, funciones serverless).
* **Netlify**: Otra plataforma muy popular para SPAs. Proporciona hosting rápido, CDN, SSL, y una integración de CI/CD extremadamente sencilla con repositorios de Git (GitHub, GitLab, Bitbucket). Es conocido por su facilidad para configurar despliegues automáticos desde tu rama principal.
* **Vercel**: Similar a Netlify, Vercel es otra plataforma de hosting y CI/CD muy optimizada para aplicaciones frontend modernas (React, Angular, Vue). Ofrece despliegues instantáneos, previews automáticos para cada `git push`, y CDN.
* **AWS Amplify / Azure Static Web Apps / Google Cloud Run**: Opciones más completas para quienes ya están en un ecosistema de nube particular y necesitan más control o integración con otros servicios en la nube.

**¿Cómo funciona la integración con GitHub Actions (o servicios de hosting)?**

Para lograr el despliegue continuo desde una pipeline (como GitHub Actions), generalmente sigues estos pasos:

1.  **Trigger**: El workflow se activa en un `push` a una rama específica (comúnmente `main` o `master`) después de que las pruebas automatizadas han pasado.
2.  **Build**: La aplicación Angular se compila para producción (`ng build --configuration production`).
3.  **Authentication**: El pipeline se autentica con la plataforma de hosting utilizando tokens de acceso seguros (almacenados como secretos).
4.  **Deploy**: Los archivos estáticos compilados (la carpeta `dist/`) se cargan en la plataforma de hosting.

El despliegue continuo es una parte fundamental de las prácticas de DevOps, permitiendo entregas rápidas y seguras. Es la forma en que empresas como Airbnb o Spotify pueden lanzar actualizaciones y nuevas funciones a sus millones de usuarios con una cadencia impresionante, manteniendo al mismo tiempo una alta fiabilidad.
''',
    'code_example': r'''
// --- EJEMPLO: DESPLIEGUE CONTINUO A PLATAFORMAS (Firebase y Netlify) ---

// El despliegue continuo se configura en tu archivo de workflow de GitHub Actions.
// Se asume que ya tienes un job de `build-and-test` exitoso.

// Antes de configurar esto, necesitas:
// 1. Instalar las herramientas CLI de la plataforma (Firebase CLI, Netlify CLI).
// 2. Autenticarte con la plataforma (`firebase login`, `netlify login`).
// 3. Inicializar tu proyecto para hosting (`firebase init hosting`, `netlify init`).
// 4. Crear los secretos necesarios en tu repositorio de GitHub (Settings -> Secrets -> Actions).

// 1. **GitHub Action para Despliegue Continuo a Firebase Hosting**

// .github/workflows/firebase-deploy.yml (O puedes añadirlo al angular-ci.yml existente)
name: Deploy to Firebase Hosting

on:
  push:
    branches:
      - main # Despliega solo cuando se hace push a la rama principal

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    # Asegúrate de que este job solo se ejecute si el job de build y test fue exitoso (si están separados)
    # needs: build-and-test

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install dependencies
        run: npm ci

      - name: Build Angular app for production
        # Asegúrate de que el 'outputPath' en angular.json sea correcto (ej. dist/your-app-name)
        run: npm run build -- --configuration production

      - name: Deploy to Firebase
        uses: FirebaseExtended/action-hosting-deploy@v0 # Acción de Firebase para despliegue
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}' # Token predefinido para GHA
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT_YOUR_PROJECT_ID }}' # Tu cuenta de servicio
          channelId: live # Despliega a la versión "live" (producción)
          projectId: your-firebase-project-id # ID de tu proyecto de Firebase
          # Puedes especificar un target si usas múltiples sitios en Firebase:
          # target: your-hosting-target-name

/*
  # Para FirebaseServiceAccount:
  # 1. En Firebase Console, ve a Configuración del proyecto -> Cuentas de servicio.
  # 2. Genera una nueva clave privada JSON y descárgala.
  # 3. Abre el archivo JSON y copia todo su contenido.
  # 4. En GitHub, ve a tu repositorio -> Settings -> Secrets -> Actions -> New repository secret.
  # 5. Nombra el secreto: FIREBASE_SERVICE_ACCOUNT_YOUR_PROJECT_ID (reemplaza YOUR_PROJECT_ID).
  # 6. Pega el contenido JSON completo en el campo "Value".
*/


// 2. **GitHub Action para Despliegue Continuo a Netlify**

// .github/workflows/netlify-deploy.yml
name: Deploy to Netlify

on:
  push:
    branches:
      - main # Despliega solo cuando se hace push a la rama principal

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install dependencies
        run: npm ci

      - name: Build Angular app for production
        run: npm run build -- --configuration production # Asegúrate de que esto compile a la carpeta correcta (ej. dist/your-app-name)

      - name: Deploy to Netlify
        env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }} # Token de acceso personal de Netlify
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}     # ID del sitio Netlify
        run: |
          npm install -g netlify-cli # Instala la CLI de Netlify
          netlify deploy --dir=dist/your-app-name --prod # Despliega la carpeta de salida a Netlify

/*
  # Para Netlify_AUTH_TOKEN y NETLIFY_SITE_ID:
  # 1. NETLIFY_AUTH_TOKEN: En Netlify, ve a User settings -> Applications -> Personal access tokens -> New access token.
  #    Crea uno y guárdalo como secreto en GitHub.
  # 2. NETLIFY_SITE_ID: En Netlify, ve a tu sitio -> Site settings -> General -> Site information -> API ID.
  #    Copia este ID y guárdalo como secreto en GitHub.
  # 3. La bandera `--prod` asegura que se despliega al dominio principal (producción).
*/

/*
Errores comunes en el despliegue continuo:

1.  **No usar secretos para tokens de autenticación**:
    Incrustar tokens de Firebase, Netlify o AWS directamente en tu archivo YAML es un riesgo de seguridad crítico.
    Siempre usa "GitHub Secrets" (`${{ secrets.YOUR_SECRET_NAME }}`) para almacenar y acceder a estos valores.

2.  **Desplegar desde ramas incorrectas**:
    Asegúrate de que tu workflow de despliegue solo se active en las ramas correctas (ej., solo `main` para producción)
    para evitar despliegues accidentales de código no probado o incompleto.

3.  **Rutas de compilación incorrectas**:
    Verifica que la carpeta que se despliega (`dist/your-app-name` o similar) sea la correcta que resulta del build de Angular.
    Un error aquí resultará en un sitio web vacío o roto.

4.  **Fallo de pruebas ignorado**:
    En una pipeline robusta, el job de despliegue debería depender del éxito del job de build y pruebas.
    Si el job de build/tests falla, el despliegue no debería ejecutarse (`needs: build-and-test`).

5.  **No manejar el cacheo del CDN**:
    Después de un despliegue, el CDN de tu plataforma de hosting puede tardar en invalidar el caché.
    Asegúrate de que tu `angular.json` esté configurado para `outputHashing: 'all'`
    para que los nombres de archivo cambien con cada build, forzando a los navegadores y CDNs a descargar los nuevos archivos.

6.  **Despliegue sin confirmación en producción**:
    Para aplicaciones muy críticas, a veces el despliegue continuo a producción puede tener un paso manual de aprobación
    después de que el código ha sido construido y probado. GitHub Actions permite esto con "Environments" y "required reviewers".
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Monitoreo y Logging',
    'subtopic': 'Implementación de herramientas de monitoreo',
    'definition': r'''
La "implementación de herramientas de monitoreo" se trata de tener una visión clara y en tiempo real de cómo se está comportando tu aplicación Angular una vez que está en producción. Es como tener un panel de control en un coche, que te muestra la velocidad, el nivel de combustible y la temperatura del motor, pero para tu software.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un sistema de semáforos en una ciudad. Si no hubiera monitoreo, nadie sabría si un semáforo está en verde permanentemente o si hay un fallo que está causando atascos. La ciudad funcionaría mal y la gente se frustraría. De manera similar, sin monitoreo, no sabrás si tu aplicación está funcionando lentamente para algunos usuarios, si hay errores silenciosos, o si está experimentando picos de uso que podrían requerir más recursos. El monitoreo es vital para identificar problemas antes de que afecten a muchos usuarios, asegurar una buena experiencia de usuario, y tomar decisiones informadas sobre la escalabilidad y el rendimiento. Empresas como Amazon, con su gigantesca infraestructura, dependen de herramientas de monitoreo sofisticadas para mantener sus servicios en funcionamiento y detectar cualquier anomalía al instante.

Las herramientas de monitoreo se dividen generalmente en dos categorías principales para las aplicaciones frontend:

1.  **Monitoreo del Rendimiento de la Aplicación (APM - Application Performance Monitoring)**:
    Estas herramientas te ayudan a entender la experiencia real de tus usuarios. Monitorean métricas como:
    * **Tiempo de carga de la página (Page Load Time)**: ¿Cuánto tarda la aplicación en ser visible e interactiva?
    * **Métricas Core Web Vitals**: LCP (Largest Contentful Paint), FID (First Input Delay), CLS (Cumulative Layout Shift). Son métricas de Google que miden la experiencia de carga, interactividad y estabilidad visual.
    * **Velocidad de las peticiones de red**: Cuánto tardan las llamadas a tu API o a servicios de terceros.
    * **Errores de JavaScript**: Errores no capturados que ocurren en el navegador del usuario.
    * **Rendimiento de los componentes**: Qué tan rápido se renderizan y se actualizan los componentes.
    * **Ejemplos de herramientas**:
        * **New Relic, Dynatrace, Datadog**: Soluciones APM completas, pero pueden ser costosas.
        * **Google Analytics / Google Search Console**: Aunque no son APM puros, te dan métricas de rendimiento y experiencia de usuario.
        * **Web Vitals Library**: Una biblioteca de Google que te permite medir las Core Web Vitals en tu aplicación y enviarlas a tu sistema de analíticas.

2.  **Monitoreo de Errores (Error Monitoring)**:
    Estas herramientas capturan y te notifican sobre los errores que ocurren en el lado del cliente (errores de JavaScript no manejados, errores de red, etc.). Agrupan errores similares, proporcionan stack traces y contexto del usuario (navegador, sistema operativo, URL, incluso el estado de la aplicación en el momento del error).
    * **Ejemplos de herramientas**:
        * **Sentry**: Una de las herramientas más populares y robustas para el monitoreo de errores. Ofrece SDKs para Angular y otras tecnologías, agrupamiento inteligente de errores, y contexto detallado.
        * **Rollbar, Bugsnag**: Alternativas similares a Sentry.
        * **LogRocket / FullStory**: Van más allá al permitirte "reproducir" sesiones de usuario, viendo exactamente lo que el usuario hizo antes de un error.

**Integración en Angular**:

La integración de estas herramientas en Angular suele implicar la instalación de un SDK (Software Development Kit) o una biblioteca JavaScript, y luego su inicialización en tu `main.ts` o en un `app.module.ts`. Luego, configuras cómo se envían los eventos (errores, métricas personalizadas) a la plataforma de monitoreo.

Es crucial configurar estas herramientas para que solo envíen la información necesaria y respeten la privacidad del usuario (ej., anonimizando IPs, no enviando datos sensibles). El monitoreo te da los "ojos y oídos" en producción que necesitas para mantener tu aplicación saludable y a tus usuarios contentos.
''',
    'code_example': r'''
// --- EJEMPLO: IMPLEMENTACIÓN DE HERRAMIENTAS DE MONITOREO EN ANGULAR ---

// Este ejemplo se centrará en la integración de Sentry para monitoreo de errores
// y la librería `web-vitals` para métricas de rendimiento de la web.

// 1. **Instalación de dependencias (para Sentry y web-vitals)**
// npm install @sentry/angular-ivy @sentry/tracing web-vitals

// 2. **Configuración de Sentry (src/main.ts)**
// Sentry es una herramienta de monitoreo de errores. Su configuración suele ir al inicio de la aplicación.

import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

// Importa Sentry
import * as Sentry from '@sentry/angular-ivy';
import { BrowserTracing } from '@sentry/tracing';

if (environment.production) {
  enableProdMode();

  // Inicializa Sentry solo en producción
  Sentry.init({
    dsn: 'https://examplePublicKey@o0.ingest.sentry.io/0', // <-- Reemplaza con tu DSN de Sentry
    integrations: [
      new BrowserTracing({
        tracePropagationTargets: ['localhost', 'https://api.yourdomain.com'], // URLs a monitorear para tracing
        routingInstrumentation: Sentry.routingInstrumentation,
      }),
    ],
    // Ajusta la tasa de muestreo de transacciones si no quieres capturar el 100%
    tracesSampleRate: 0.5, // 50% de las transacciones serán muestreadas
    replaysSessionSampleRate: 0.1, // 10% de sesiones serán grabadas (para Replay)
    replaysOnErrorSampleRate: 1.0, // 100% de sesiones con errores serán grabadas (para Replay)

    // Entorno de la aplicación (production, staging, etc.)
    environment: environment.production ? 'production' : 'development',

    // Deshabilita la depuración de Sentry en producción
    debug: !environment.production,

    // Puedes agregar una versión de la aplicación para un mejor seguimiento
    release: 'my-angular-app@1.0.0', // Asegúrate de que esto coincida con la versión de tu app
  });
}

platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => {
    console.error(err);
    // En caso de que falle el bootstrapping de Angular, puedes reportarlo
    if (environment.production) {
      Sentry.captureException(err);
    }
  });


// 3. **Configuración de web-vitals (src/main.ts o un servicio)**
// `web-vitals` es una librería ligera para medir métricas de rendimiento de usuario real.
// Normalmente enviarías estas métricas a tu sistema de analíticas (ej., Google Analytics, Matomo)
// o a tu backend para ser almacenadas en un data warehouse.

import { getCLS, getFID, getLCP, getTTFB, getFCP, ReportHandler } from 'web-vitals';

// Función para enviar las métricas (puedes adaptarla para tu API o Analytics)
const sendToAnalytics: ReportHandler = (metric) => {
  // console.log(metric); // Para depuración
  if (environment.production) {
    // Ejemplo: Enviar a tu backend
    // fetch('/api/web-vitals', {
    //   method: 'POST',
    //   body: JSON.stringify(metric),
    //   headers: {
    //     'Content-Type': 'application/json'
    //   }
    // });

    // Ejemplo: Enviar a Sentry como evento personalizado (no es su uso principal, pero posible)
    Sentry.captureMessage(`Web Vitals: ${metric.name} - ${metric.value.toFixed(2)}`, {
      level: 'info',
      tags: {
        metric_id: metric.id,
        metric_name: metric.name,
        metric_rating: metric.rating, // 'good', 'needs-improvement', 'poor'
      },
      extra: {
        delta: metric.delta,
        navigationType: metric.navigationType,
      },
    });

    // Ejemplo: Enviar a Google Analytics (si lo estás usando)
    // window.gtag('event', metric.name, {
    //   value: metric.delta, // o metric.value
    //   metric_id: metric.id,
    //   metric_name: metric.name,
    //   metric_rating: metric.rating,
    //   // ...otras propiedades si las necesitas
    // });
  }
};

// Llama a las funciones para recolectar las métricas
if (environment.production) {
  getCLS(sendToAnalytics);
  getFID(sendToAnalytics);
  getLCP(sendToAnalytics);
  getTTFB(sendToAnalytics); // Time to First Byte
  getFCP(sendToAnalytics); // First Contentful Paint
}


// 4. **Uso de Sentry en Componentes/Servicios (Para capturar errores manualmente)**

// src/app/my-component/my-component.component.ts
import { Component } from '@angular/core';
import * as Sentry from '@sentry/angular-ivy'; // Importa Sentry

@Component({
  selector: 'app-my-component',
  template: `<button (click)="throwError()">Lanzar Error</button>`
})
export class MyComponent {
  throwError() {
    try {
      // Simula un error
      throw new Error('Este es un error de ejemplo generado en MyComponent.');
    } catch (error) {
      console.error('Error capturado localmente:', error);
      // Envía el error a Sentry
      Sentry.captureException(error);
      // También puedes enviar mensajes: Sentry.captureMessage('Usuario hizo clic en un botón problemático');
    }
  }
}

/*
Errores comunes en la implementación de herramientas de monitoreo:

1.  **No inicializar en el entorno correcto**:
    Asegúrate de inicializar las herramientas de monitoreo (especialmente las de errores) solo en el entorno de producción (o staging).
    Ejecutarlas en desarrollo puede enviar ruido inútil y agotar tus cuotas.

2.  **Exponer información sensible en los logs/errores**:
    Configura cuidadosamente las integraciones para evitar que datos sensibles (ej., PII, contraseñas, claves API)
    sean enviados junto con los errores o métricas. La mayoría de las herramientas tienen opciones de filtrado y anonimización.

3.  **Monitoreo excesivo (demasiado ruido)**:
    Si cada pequeño detalle o advertencia se convierte en una alerta, te saturarás y empezarás a ignorar las alertas reales.
    Configura niveles de logging apropiados y umbrales de alerta sensatos.

4.  **Ignorar el costo**:
    Las herramientas de monitoreo, especialmente las completas de APM y de reproducción de sesiones, pueden ser costosas.
    Asegúrate de entender los modelos de precios y de muestrear los datos si es necesario para controlar los costos.

5.  **Fallo al actuar sobre los datos**:
    Tener herramientas de monitoreo es inútil si no revisas los datos y actúas sobre los problemas que detectan.
    Establece procesos para revisar errores, analizar métricas y planificar mejoras basadas en los insights.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Monitoreo y Logging',
    'subtopic': 'Registro de errores y eventos',
    'definition': r'''
El "registro de errores y eventos" (o "logging") es una práctica esencial en el desarrollo de software. Se trata de grabar información sobre lo que sucede en tu aplicación, especialmente cuando algo sale mal o cuando ocurren eventos importantes. Es como el diario de a bordo de un barco, donde se anotan las condiciones del mar, las coordenadas y cualquier incidente relevante para poder entender la travesía después.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un detective investigando un crimen. No puede estar en la escena del crimen cuando sucede, pero puede examinar las pistas y el registro de eventos (testigos, grabaciones, huellas) para reconstruir lo que pasó. De manera similar, los logs son las pistas que te permiten entender lo que ocurrió en tu aplicación cuando tú no estabas mirando. Son críticos para:

* **Depuración de problemas**: Cuando un usuario reporta un error, los logs te dan el rastro de los eventos que llevaron a ese error.
* **Diagnóstico de rendimiento**: Los logs pueden registrar tiempos de respuesta, lo que te ayuda a identificar cuellos de botella.
* **Auditoría de seguridad**: Eventos como intentos de inicio de sesión fallidos o accesos no autorizados pueden ser detectados a través de logs.
* **Análisis de comportamiento**: Entender cómo interactúan los usuarios con la aplicación (aunque para esto hay herramientas más específicas como analíticas).
* **Cumplimiento normativo**: Muchas regulaciones exigen el registro de ciertas actividades.

**Tipos de registro**:

Generalmente, los logs se clasifican por niveles de gravedad, lo que te permite filtrar la información y concentrarte en lo más crítico:

* **DEBUG**: Información detallada, útil solo para depuración en desarrollo.
* **INFO**: Mensajes generales que indican el progreso de la aplicación (ej., "Usuario 'X' inició sesión").
* **WARN**: Advertencias sobre situaciones que no son errores pero que podrían indicar un problema potencial (ej., "Función deprecada utilizada").
* **ERROR**: Errores en tiempo de ejecución que no impiden el funcionamiento de la aplicación, pero que necesitan atención (ej., "Fallo al cargar datos de la API").
* **CRITICAL / FATAL**: Errores muy graves que impiden que la aplicación continúe funcionando correctamente.

**Registro en Angular (Frontend)**:

Aunque la auditoría y el logging de eventos críticos deben residir principalmente en el backend (donde están más seguros y completos), el frontend (Angular) juega un papel crucial en:

* **Captura de errores no manejados**: Utilizar un `ErrorHandler` global para interceptar errores de JavaScript que no se capturaron con `try-catch`.
* **Envío de logs al backend**: Enviar información de logs y errores del cliente al servidor para que se almacenen de forma centralizada y segura. Esto es vital para entender lo que realmente experimentan los usuarios en sus navegadores.
* **Registro de eventos de UI**: Eventos específicos de la interfaz de usuario que podrían ser relevantes para el análisis de problemas (ej., "Clic en botón de pago fallido").

**Herramientas para Logging**:

* **En el frontend**:
    * **`console.log`, `console.error`**: Para depuración local, pero no para producción.
    * **Sentry, Rollbar, Bugsnag**: Herramientas de monitoreo de errores que capturan y agregan logs de errores del cliente.
    * **Custom Loggers**: Servicios que envían logs a un endpoint de tu backend.
* **En el backend (donde se centralizan y almacenan los logs)**:
    * **Winston (Node.js), Log4j (Java), Serilog (.NET)**: Librerías de logging.
    * **ELK Stack (Elasticsearch, Logstash, Kibana)**: Solución popular para la ingesta, almacenamiento y visualización de logs.
    * **Splunk, Datadog Logs, AWS CloudWatch Logs**: Servicios gestionados de logging.

Un buen sistema de logging es la primera línea de defensa cuando algo falla en producción, proporcionando la visibilidad necesaria para diagnosticar y resolver problemas rápidamente.
''',
    'code_example': r'''
// --- EJEMPLO: REGISTRO DE ERRORES Y EVENTOS EN ANGULAR ---

// En Angular, la principal forma de registrar errores globalmente es
// implementando una clase personalizada que extienda `ErrorHandler`.

// 1. **Servicio de Logging Personalizado (src/app/services/logger.service.ts)**
// Este servicio sería el encargado de enviar los logs al backend o a una herramienta.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { AuthService } from '../auth/auth.service'; // Para obtener información del usuario

export enum LogLevel {
  DEBUG = 'DEBUG',
  INFO = 'INFO',
  WARN = 'WARN',
  ERROR = 'ERROR',
  CRITICAL = 'CRITICAL'
}

interface LogEntry {
  level: LogLevel;
  message: string;
  timestamp: string;
  context?: any; // Datos adicionales (ej. usuario, ruta, stack trace)
  userId?: string;
}

@Injectable({
  providedIn: 'root'
})
export class LoggerService {
  private logEndpoint = `${environment.apiUrl}/logs`;

  constructor(private http: HttpClient, private authService: AuthService) { }

  private sendLog(level: LogLevel, message: string, context?: any): void {
    if (environment.production && level === LogLevel.DEBUG) {
      // No enviar logs de DEBUG en producción
      return;
    }

    const logEntry: LogEntry = {
      level,
      message,
      timestamp: new Date().toISOString(),
      context: context,
      userId: this.authService.isLoggedIn() ? this.authService.getUserId() : 'anonymous', // Asume que authService tiene getUserId()
    };

    // Para evitar ciclos si hay un error en la solicitud HTTP
    try {
      this.http.post(this.logEndpoint, logEntry).subscribe({
        next: () => {
          // console.log('Log enviado exitosamente', logEntry);
        },
        error: (err) => {
          console.error('Fallo al enviar log al backend:', err, logEntry);
          // Opcional: Fallback a console.error si el envío falla
          console.error(`[${level}] ${message}`, context);
        }
      });
    } catch (e) {
      console.error('Error al intentar enviar log (problema en la petición HTTP):', e, logEntry);
    }
  }

  debug(message: string, context?: any): void {
    this.sendLog(LogLevel.DEBUG, message, context);
  }

  info(message: string, context?: any): void {
    this.sendLog(LogLevel.INFO, message, context);
  }

  warn(message: string, context?: any): void {
    this.sendLog(LogLevel.WARN, message, context);
  }

  error(message: string, error?: Error, context?: any): void {
    const errorContext = {
      ...context,
      stack: error ? error.stack : undefined,
      name: error ? error.name : undefined,
      message: error ? error.message : undefined,
    };
    this.sendLog(LogLevel.ERROR, message, errorContext);
  }

  critical(message: string, error?: Error, context?: any): void {
    const errorContext = {
      ...context,
      stack: error ? error.stack : undefined,
      name: error ? error.name : undefined,
      message: error ? error.message : undefined,
    };
    this.sendLog(LogLevel.CRITICAL, message, errorContext);
  }
}

// 2. **Global Error Handler (src/app/core/global-error-handler.ts)**
// Captura errores no manejados por Angular y los envía a tu LoggerService.

import { ErrorHandler, Injectable, Injector } from '@angular/core';
import { LoggerService } from '../services/logger.service'; // Asegúrate de la ruta correcta
import { environment } from 'src/environments/environment';

@Injectable()
export class GlobalErrorHandler implements ErrorHandler {
  constructor(private injector: Injector) { } // Usar Injector para evitar un problema de dependencia circular

  handleError(error: any): void {
    const loggerService = this.injector.get(LoggerService);

    // Muestra el error en la consola (solo en desarrollo)
    if (!environment.production) {
      console.error('Error no manejado (desarrollo):', error);
    }

    // Registra el error usando tu LoggerService
    loggerService.error('Error no manejado en el frontend', error, {
      url: window.location.href,
      userAgent: navigator.userAgent,
      // Aquí puedes añadir más contexto si es necesario, pero evita datos sensibles
    });

    // IMPORTANTE: re-lanzar el error o loguearlo para que Angular lo vea
    // console.error(error); // Si quieres que Angular lo muestre también
  }
}

// 3. **Configuración en AppModule (src/app/app.module.ts)**
// Proporciona tu `GlobalErrorHandler` para que Angular lo use.

import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { GlobalErrorHandler } from './core/global-error-handler'; // Asegúrate de la ruta
import { LoggerService } from './services/logger.service'; // Importa tu logger
// ... otros imports

@NgModule({
  declarations: [
    AppComponent,
    // ... otros componentes
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    // ... otros módulos
  ],
  providers: [
    LoggerService, // Provee tu servicio de logger
    { provide: ErrorHandler, useClass: GlobalErrorHandler } // Sobrescribe el ErrorHandler por defecto
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }


// 4. **Uso de LoggerService en componentes/servicios**

// src/app/some-feature/some-feature.component.ts
import { Component, OnInit } from '@angular/core';
import { LoggerService, LogLevel } from '../../services/logger.service';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-some-feature',
  template: `
    <button (click)="loadData()">Cargar Datos</button>
    <button (click)="triggerWarning()">Advertencia</button>
  `
})
export class SomeFeatureComponent implements OnInit {
  constructor(private logger: LoggerService, private apiService: ApiService) { }

  ngOnInit(): void {
    this.logger.info('Componente SomeFeature inicializado.', { path: '/some-feature' });
  }

  loadData(): void {
    this.apiService.getData().subscribe({
      next: (data) => {
        this.logger.info('Datos cargados exitosamente.', { dataLength: data.length });
      },
      error: (err) => {
        this.logger.error('Fallo al cargar datos de la API.', err, { endpoint: '/data' });
      }
    });
  }

  triggerWarning(): void {
    this.logger.warn('Se intentó una acción que podría ser problemática.', { userId: '123' });
  }
}

/*
Errores comunes en el registro de errores y eventos:

1.  **Registrar datos sensibles**:
    Nunca incluyas contraseñas, información de tarjetas de crédito o cualquier PII (Información de Identificación Personal)
    en tus logs, ya sea en el frontend o al enviarlos al backend. Anonimiza o filtra estos datos.

2.  **Excesiva verbosidad en producción (logs de DEBUG)**:
    Registrar demasiada información en producción puede saturar tu sistema de logging, aumentar costos
    y dificultar la búsqueda de información relevante. Asegúrate de filtrar los logs de `DEBUG` e `INFO`
    en producción, y solo enfocarte en `WARN`, `ERROR`, `CRITICAL`.

3.  **Logging inconsistente**:
    Si diferentes partes de tu aplicación o diferentes desarrolladores registran información de manera
    inconsistente (ej., diferentes formatos, falta de contexto), los logs serán difíciles de analizar.
    Define una estructura estándar para tus logs y asegúrate de que se sigan.

4.  **No centralizar los logs**:
    Dejar los logs solo en el navegador del usuario o en el servidor individual donde se genera
    dificulta la depuración de problemas a gran escala. Usa un sistema de logging centralizado (como ELK Stack, Splunk)
    para recopilar logs de todos los orígenes.

5.  **Ignorar los logs**:
    Tener un sistema de logging es inútil si nadie revisa los logs o si no hay alertas configuradas para
    errores críticos. Implementa un proceso para revisar logs regularmente y configurar alertas para problemas importantes.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Monitoreo y Logging',
    'subtopic': 'Análisis de logs',
    'definition': r'''
El "análisis de logs" es el proceso de examinar y extraer información útil de los grandes volúmenes de datos que se generan en tus registros de errores y eventos. No se trata solo de recolectar logs, sino de entender qué te están diciendo. Es como un historiador que, en lugar de solo coleccionar documentos antiguos, los estudia, los contextualiza y saca conclusiones sobre eventos pasados.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una conversación muy larga en un idioma que no conoces. Recopilar cada palabra sería inútil si no tienes la capacidad de traducirla y entenderla. De manera similar, los logs, por sí solos, son solo texto. El análisis de logs te permite convertir ese ruido en señales claras: identificar patrones de errores, detectar intentos de ataque, entender el comportamiento del usuario y medir el rendimiento de tu aplicación. Sin un análisis adecuado, los logs son una mina de oro de información sin explotar, y podrías estar perdiendo problemas críticos o valiosas oportunidades de mejora. Empresas como la NASA, para sus misiones espaciales, no solo recopilan datos de telemetría, sino que tienen equipos enteros dedicados al análisis de esos logs para asegurar que todo funciona según lo previsto.

El análisis de logs es un componente clave de la observabilidad y se realiza principalmente en el backend, donde se centralizan los logs de todas las partes de tu aplicación (frontend, backend, bases de datos, infraestructura).

**Pasos y técnicas clave en el análisis de logs**:

1.  **Centralización de logs**:
    El primer paso es recopilar logs de todas tus fuentes en un único lugar. Esto facilita la búsqueda, el filtrado y la correlación de eventos. Herramientas como Logstash, Fluentd o Beats (en el ecosistema ELK) ayudan a recolectar logs de diferentes fuentes.

2.  **Estandarización y enriquecimiento**:
    Asegúrate de que tus logs tengan un formato consistente (ej., JSON) y que incluyan información clave como la marca de tiempo, el nivel de gravedad, el ID de usuario, la transacción, etc. Puedes enriquecer los logs con información adicional (ej., geolocalización de la IP, versión del navegador).

3.  **Indexación y búsqueda**:
    Una vez centralizados, los logs se indexan para permitir búsquedas rápidas y eficientes. Esto es fundamental para encontrar errores específicos o eventos en segundos entre miles o millones de entradas. Elasticsearch es un motor de búsqueda popular para esto.

4.  **Visualización y Dashboards**:
    Convertir los datos de log en gráficos, tablas y dashboards es crucial para identificar tendencias y patrones de un vistazo. Puedes ver picos de errores, latencia en la API, o el número de inicios de sesión fallidos en un período. Kibana (en el ecosistema ELK) o Grafana son herramientas excelentes para esto.

5.  **Alertas y notificaciones**:
    Configura alertas para eventos críticos. Por ejemplo, si el número de errores aumenta repentinamente, si un usuario accede a un recurso prohibido, o si el tiempo de respuesta de la API excede un umbral. Esto te permite reaccionar a los problemas en tiempo real.

6.  **Correlación de eventos**:
    Relacionar eventos de diferentes partes de tu sistema. Por ejemplo, si un error en el frontend se corresponde con un error en el backend y una anomalía en la base de datos. Esto ayuda a identificar la causa raíz de los problemas.

**Herramientas comunes para el análisis de logs**:

* **ELK Stack (Elasticsearch, Logstash, Kibana)**: Una suite de código abierto muy popular para la ingesta, búsqueda, análisis y visualización de logs.
* **Splunk**: Una plataforma de inteligencia operativa que ofrece análisis y visualización de datos de máquinas. Es muy potente pero puede ser costosa.
* **Datadog Logs**: Parte de la plataforma de monitoreo de Datadog, con capacidades de ingesta, indexación y visualización de logs.
* **New Relic Logs**: Integración de logs con su plataforma APM.
* **Grafana Loki**: Un sistema de agregación de logs diseñado para ser rentable y escalable, que se integra bien con Grafana para la visualización.

El análisis de logs transforma el "Big Data" de tu aplicación en insights accionables, permitiéndote mantener tu software saludable, seguro y eficiente.
''',
    'code_example': r'''
// --- EJEMPLO: ANÁLISIS DE LOGS (Conceptual y de Herramientas) ---

// El análisis de logs es principalmente una actividad de DevOps/Operaciones
// que ocurre FUERA del código de Angular. Angular solo se encarga de
// **generar y enviar** los logs. Las herramientas de análisis de logs
// procesan, almacenan y visualizan esos logs.

// Este ejemplo se centra en la configuración y uso conceptual de herramientas
// y qué esperar de los logs que Angular (y tu backend) podrían enviar.

// 1. **Ejemplo de un Log Estructurado (JSON) enviado por Angular/Backend**
// Para que el análisis sea efectivo, los logs deben ser estructurados (ej. JSON)
// y contener información clave.

/*
// Ejemplo de log de error desde el frontend (enviado por LoggerService):
{
  "level": "ERROR",
  "message": "Error no manejado en el frontend",
  "timestamp": "2025-06-07T16:00:00.123Z",
  "userId": "user-abcde",
  "context": {
    "url": "https://your-app.com/dashboard",
    "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
    "stack": "Error: Este es un error...\n    at MyComponent.throwError (my-component.component.ts:25:11)",
    "name": "Error",
    "message": "Este es un error de ejemplo generado en MyComponent."
  },
  "clientIp": "192.168.1.10" // Si el backend lo añade
}

// Ejemplo de log de API exitoso desde el backend:
{
  "level": "INFO",
  "message": "API call successful",
  "timestamp": "2025-06-07T16:00:00.456Z",
  "userId": "user-abcde",
  "endpoint": "/api/data",
  "method": "GET",
  "statusCode": 200,
  "responseTimeMs": 55,
  "clientIp": "192.168.1.10"
}

// Ejemplo de log de autenticación fallida desde el backend:
{
  "level": "WARN",
  "message": "Failed login attempt",
  "timestamp": "2025-06-07T16:00:01.789Z",
  "usernameAttempted": "baduser",
  "ipAddress": "203.0.113.42",
  "reason": "Invalid credentials"
}
*/

// 2. **Flujo de Loggin y Análisis (Conceptual)**

/*
  Tu aplicación Angular                 Tu Backend/API                      Sistema de Gestión de Logs (ELK Stack, Splunk, Datadog)
  +--------------------+               +--------------------+               +-----------------------------------------------------+
  | `LoggerService`    | --HTTP POST-->| Servidor API       |               |                                                     |
  | (Captura errores,  |               | (Middleware/Logger)|               | [Logstash/Fluentd/Beats] (Colector/Procesador)      |
  | eventos de UI)     |               | (Recibe logs de FE,|               |   -> Ingesta, parsea, enriquece logs                |
  +--------------------+               |  genera logs de BE)|               |                                                     |
            |                            +---------+----------+               | [Elasticsearch] (Almacenamiento/Motor de búsqueda)  |
            |                                      |                        |   -> Indexa logs para búsquedas rápidas             |
            |                                      |                        |                                                     |
            | (Errores no manejados)               |                        | [Kibana/Grafana] (Visualización/Alertas)            |
            V                                      V                        |   -> Dashboards, gráficos, alertas, correlación     |
  `GlobalErrorHandler`                           Logs (Archivos/DB)         |                                                     |
                                         (o directamente a un colector)     +-----------------------------------------------------+

**Ejemplo de cómo usarías las herramientas para analizar un problema:**

**Escenario:** Los usuarios se quejan de que la aplicación está lenta y a veces no pueden cargar los datos.

**Pasos de Análisis:**

1.  **Acceder al Dashboard de Logs**: Vas a Kibana (o tu herramienta) y abres un dashboard de rendimiento.
2.  **Filtrar por Tiempo**: Miras las métricas de `responseTimeMs` en los logs del backend en el último período de tiempo donde se reportó lentitud.
    * **Insight**: Ves un pico en los tiempos de respuesta de la API `/api/data` alrededor de las 14:30.
3.  **Correlacionar Errores**: Filtra los logs por nivel `ERROR` y `CRITICAL` en el mismo período.
    * **Insight**: Observas un aumento de errores `500 Internal Server Error` en el backend, específicamente relacionados con la conexión a la base de datos.
    * **Correlación Frontend**: Ves que en el frontend, el `LoggerService` también reportó un aumento de "Fallo al cargar datos de la API" con errores de red.
4.  **Investigar la Causa Raíz**: Profundizas en los logs del backend para las entradas de error de base de datos.
    * **Insight**: Encuentras un log que indica "Maximum connections reached" o un "Deadlock detected".
5.  **Identificar Patrón**: Analizas el `userId` y `ipAddress` de los logs de error y éxito.
    * **Insight**: Ves que un usuario específico estaba realizando una gran cantidad de operaciones de "guardar" antes de que el problema ocurriera, posiblemente causando una sobrecarga en la base de datos.
6.  **Tomar Acción**: Basado en el análisis, puedes:
    * Optimizar la consulta de la base de datos.
    * Aumentar el pool de conexiones de la base de datos.
    * Limitar la tasa de solicitudes de ese usuario o funcionalidad específica.
    * Desplegar una nueva versión con la corrección y monitorear los logs para confirmar que el problema está resuelto.
*/

/*
Errores comunes en el análisis de logs:

1.  **Logs no estructurados**:
    Si tus logs son solo cadenas de texto planas, el análisis se vuelve extremadamente difícil.
    Siempre formatea tus logs como JSON o un formato similar que sea fácilmente parseable.

2.  **Falta de contexto en los logs**:
    Un log como "Error" es inútil. Los logs deben incluir suficiente contexto (ID de usuario, ID de transacción,
    ruta/endpoint, stack trace, etc.) para que puedas entender qué sucedió y por qué.

3.  **No tener un sistema de centralización de logs**:
    Buscar logs en docenas de servidores o en los navegadores de los usuarios es imposible a escala.
    Necesitas una forma centralizada de recolectar, almacenar y buscar todos tus logs.

4.  **Ignorar la relevancia de los logs**:
    No todos los logs son igual de importantes. Define niveles de gravedad y prioriza los errores y eventos críticos.
    Evita la "fatiga de alerta" generada por demasiado ruido.

5.  **Falta de métricas de rendimiento en los logs**:
    Registrar métricas como `responseTimeMs` para las llamadas a la API o el tiempo de carga de componentes
    en el frontend permite no solo depurar errores, sino también monitorear y mejorar el rendimiento.

6.  **No correlacionar logs de diferentes componentes**:
    Un problema en el frontend podría ser causado por un problema en el backend o la base de datos.
    Un buen análisis de logs te permite correlacionar eventos a través de todo tu stack para encontrar la causa raíz.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Gestión de Configuraciones',
    'subtopic': 'Uso de archivos de entorno',
    'definition': r'''
El "uso de archivos de entorno" en Angular es la manera estándar y organizada de gestionar las diferentes configuraciones que tu aplicación necesita dependiendo del contexto en el que se ejecuta. Piensa en ello como tener diferentes juegos de interruptores en una casa: uno para el modo de fiesta, otro para el modo de estudio y otro para cuando estás de vacaciones, cada uno ajustando la iluminación y el ambiente de una forma particular.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una receta de cocina. No es lo mismo cocinar para una persona (desarrollo), que para diez (staging) o para un banquete (producción). Los ingredientes y las cantidades cambian. De manera similar, tu aplicación Angular necesita diferentes "ingredientes" (URLs de API, claves, banderas de depuración) cuando está en tu máquina de desarrollo, en un servidor de pruebas o en la web para miles de usuarios. Sin archivos de entorno, tendrías que cambiar manualmente estas configuraciones cada vez que quisieras desplegar tu aplicación en un nuevo lugar, lo cual es propenso a errores y una pérdida de tiempo. El sistema de archivos de entorno de Angular CLI te permite automatizar este proceso y asegurar que la configuración correcta se use en el momento correcto.

En Angular, los archivos de entorno se encuentran típicamente en la carpeta `src/environments/` y son archivos TypeScript que exportan un objeto `environment`:

* **`environment.ts`**: Este es el archivo predeterminado para el entorno de desarrollo. Cuando ejecutas `ng serve` o `ng build` sin especificar una configuración, este es el archivo que se utiliza. Contendrá variables que son útiles para la depuración y el desarrollo local (ej., `production: false`, `apiUrl: 'http://localhost:3000/api'`).
* **`environment.prod.ts`**: Este archivo contiene la configuración para el entorno de producción. Cuando ejecutas `ng build --configuration production` (o `ng build --prod`), el Angular CLI está configurado para reemplazar `environment.ts` con `environment.prod.ts` en el bundle final. Aquí es donde pondrías las URLs de tu API de producción, flags de `production: true`, etc.

**¿Qué tipo de información se guarda en los archivos de entorno?**

La información más común incluye:

* **Banderas de modo (`production: boolean`)**: Para controlar si ciertas funcionalidades (ej., logging detallado, Google Analytics) se activan o desactivan.
* **URLs de APIs**: Las direcciones de tus servicios de backend.
* **Claves públicas de servicios de terceros**: Como las claves públicas de pasarelas de pago (Stripe, PayPal) o APIs de mapas. (¡Importante! Nunca las claves secretas).
* **Configuraciones de servicios específicos**: Por ejemplo, si tienes un servicio de logging o analíticas que necesita un ID de proyecto diferente por entorno.

El Angular CLI hace un excelente trabajo automatizando el reemplazo de estos archivos durante el proceso de build, lo que simplifica enormemente la gestión de diferentes configuraciones para diferentes despliegues. Esto permite a los desarrolladores centrarse en el código de la aplicación, sabiendo que la configuración correcta se aplicará automáticamente.
''',
    'code_example': r'''
// --- EJEMPLO: USO DE ARCHIVOS DE ENTORNO EN ANGULAR ---

// Angular CLI organiza los archivos de entorno en la carpeta `src/environments/`.

// 1. **Archivo de Entorno para Desarrollo (src/environments/environment.ts)**
// Este es el entorno por defecto, usado por `ng serve` y `ng build` sin flags.

export const environment = {
  production: false, // Indica que no estamos en producción
  apiUrl: 'http://localhost:3000/api', // URL de tu API de desarrollo local
  debugLogging: true, // Activa logs de depuración
  googleMapsApiKey: 'AIzaSyC_YourDevelopmentKey_123', // Clave de API de desarrollo
  analyticsId: 'UA-XXXXX-DEV' // ID de Google Analytics para desarrollo
};

// 2. **Archivo de Entorno para Producción (src/environments/environment.prod.ts)**
// Este archivo reemplaza a `environment.ts` cuando se compila para producción.

export const environment = {
  production: true, // Indica que estamos en producción
  apiUrl: 'https://api.yourdomain.com/api', // URL de tu API de producción
  debugLogging: false, // Desactiva logs de depuración
  googleMapsApiKey: 'AIzaSyC_YourProductionKey_456', // Clave de API de producción
  analyticsId: 'UA-YYYYY-PROD' // ID de Google Analytics para producción
};

// 3. **Configuración en `angular.json` (Archivo de configuración del CLI)**
// Esta sección le dice al CLI cómo reemplazar los archivos.

/*
// src/angular.json (fragmento relevante)
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  // ...
  "projects": {
    "your-app-name": {
      "architect": {
        "build": {
          // ...
          "configurations": {
            "production": {
              "fileReplacements": [
                {
                  "replace": "src/environments/environment.ts", // El archivo a reemplazar
                  "with": "src/environments/environment.prod.ts" // El archivo por el que se reemplazará
                }
              ],
              // ... otras opciones de producción como optimization, aot, etc.
            },
            "development": {
              // Si tienes configuraciones específicas para el entorno de desarrollo
            }
          },
          "defaultConfiguration": "development" // ng serve y ng build por defecto usarán 'development'
        },
        "serve": {
          "builder": "@angular-devkit/build-angular:dev-server",
          "configurations": {
            "production": {
              "browserTarget": "your-app-name:build:production" // Cuando sirves con --configuration production
            },
            "development": {
              "browserTarget": "your-app-name:build:development"
            }
          },
          "defaultConfiguration": "development"
        }
      }
    }
  }
}
*/

// 4. **Uso de las variables de entorno en tu aplicación Angular**

// src/app/services/api.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment'; // Importa el objeto `environment`

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getUsers() {
    return this.http.get(`${this.baseUrl}/users`);
  }
}

// src/app/app.component.ts
import { Component, OnInit } from '@angular/core';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  template: `
    <h1>Mi Aplicación Angular</h1>
    <p>Modo Producción: {{ environment.production ? 'Sí' : 'No' }}</p>
    <p>URL de la API: {{ environment.apiUrl }}</p>

    <div *ngIf="environment.debugLogging">
      <p>Modo de Depuración Activado. Detalles adicionales:</p>
      <small>Clave de Google Maps: {{ environment.googleMapsApiKey }}</small>
    </div>
  `
})
export class AppComponent implements OnInit {
  // Hacer la variable 'environment' accesible en la plantilla
  environment = environment;

  ngOnInit() {
    if (environment.production) {
      // Inicializar Google Analytics solo en producción
      // gtag('config', environment.analyticsId); // Asumiendo que gtag está global
    }
  }
}

/*
Errores comunes en el uso de archivos de entorno:

1.  **Olvidar compilar con `--configuration production`**:
    Si despliegas tu aplicación sin haber ejecutado `ng build --configuration production`,
    estarás desplegando la configuración de desarrollo, lo que puede apuntar a APIs incorrectas,
    activar logs de depuración o usar claves incorrectas.

2.  **No actualizar `angular.json` para nuevos entornos**:
    Si creas un nuevo entorno como `environment.staging.ts`, debes añadir la configuración
    `fileReplacements` para él en `angular.json` para que el CLI sepa cómo usarlo.

3.  **Incluir secretos sensibles (claves privadas)**:
    Como se mencionó, NUNCA pongas claves API secretas, contraseñas de bases de datos
    o cualquier información altamente confidencial directamente en los archivos de entorno
    del frontend. Estos archivos son parte del bundle JavaScript final y son accesibles
    en el navegador del usuario. Las claves realmente sensibles deben ser gestionadas
    en el backend o mediante variables de entorno del servidor.

4.  **Nombrar mal los archivos de entorno**:
    Si los nombres de tus archivos no siguen el patrón `environment.ENV_NAME.ts` y no
    están correctamente mapeados en `angular.json`, el sistema de reemplazo no funcionará.

5.  **Confundir variables de entorno de Node.js con Angular**:
    `process.env.NODE_ENV` o similares son variables de entorno del sistema operativo
    que solo son accesibles en un entorno Node.js (ej., en el backend o en scripts de build).
    Angular, que se ejecuta en el navegador, no tiene acceso directo a estas variables del sistema.
    La forma de "inyectar" valores específicos por entorno es a través del sistema de `environment.ts`
    y el proceso de build de Angular.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Gestión de Configuraciones',
    'subtopic': 'Separación de configuraciones por entorno',
    'definition': r'''
La "separación de configuraciones por entorno" es una práctica fundamental en el desarrollo y despliegue de aplicaciones. Implica tener conjuntos de valores de configuración distintos y bien definidos para cada fase del ciclo de vida de tu aplicación: desarrollo, pruebas (staging/QA), y producción. Es como tener un kit de herramientas diferente para cada tipo de tarea: una caja para trabajos pequeños en casa, otra para trabajos pesados en el taller y una tercera para proyectos profesionales. Cada una tiene las herramientas y ajustes precisos para su contexto.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una obra de teatro. Los ensayos (desarrollo) usan un escenario de práctica, iluminación de bajo costo y utilería de prueba. La función previa (staging) usa un escenario y vestuario más cercanos a la realidad, pero todavía en un ambiente controlado. La obra final (producción) se ejecuta en el gran teatro, con la mejor iluminación, sonido y vestuario para la audiencia. Cada etapa necesita sus propios ajustes y recursos. De manera similar, tu aplicación necesita configuraciones diferentes para:

* **Desarrollo**: Aquí quieres un feedback rápido. Las configuraciones pueden incluir URLs de API locales (`localhost`), logging muy verboso, sin optimizaciones de rendimiento y, a veces, datos simulados o de prueba. La seguridad es menos estricta porque estás en tu máquina local.
* **Staging / Pruebas / QA**: Este entorno debe ser lo más parecido posible a producción. Se usa para pruebas finales, demostraciones a clientes, y pruebas de rendimiento. Las configuraciones incluirán URLs de APIs de prueba, logging menos detallado, y quizás algunas optimizaciones de rendimiento. La seguridad aquí debe ser más robusta que en desarrollo.
* **Producción**: Este es el entorno donde tus usuarios reales interactúan con tu aplicación. La configuración debe estar optimizada para el rendimiento y la seguridad. Las URLs de API son las reales, el logging es mínimo (solo errores críticos), y la seguridad es la máxima prioridad.

**Ventajas de la separación de configuraciones**:

* **Fiabilidad**: Reduce drásticamente el riesgo de errores en producción al usar la configuración equivocada.
* **Seguridad**: Permite tener diferentes niveles de seguridad para claves y credenciales en cada entorno, siendo más estrictos en producción.
* **Eficiencia**: Evita tener que cambiar manualmente el código cada vez que se despliega en un entorno diferente.
* **Claridad**: Hace que sea obvio qué configuraciones se aplican a cada entorno.
* **Colaboración**: Facilita que diferentes equipos (desarrollo, QA, operaciones) trabajen con sus propias configuraciones sin interferir.

Angular CLI, a través de sus archivos `environment.ts` y la configuración en `angular.json` (como vimos en el subtema anterior), facilita enormemente esta separación. Aunque el ejemplo estándar es `development` y `production`, es una buena práctica extender esto a un entorno de `staging` si tu proceso lo requiere. Esta práctica es un pilar fundamental de DevOps, donde la automatización y la consistencia en los entornos son clave para entregas rápidas y fiables.
''',
    'code_example': r'''
// --- EJEMPLO: SEPARACIÓN DE CONFIGURACIONES POR ENTORNO ---

// Este ejemplo muestra cómo se organiza el código y las configuraciones
// para múltiples entornos (desarrollo, staging, producción).

// 1. **Archivos de Entorno para Múltiples Ambientes**

// src/environments/environment.ts (Desarrollo por defecto)
export const environment = {
  production: false,
  environmentName: 'development',
  apiUrl: 'http://localhost:3000/api',
  featureFlags: {
    newDashboard: true, // Habilita una nueva función en desarrollo
    betaTests: true,
  },
  loggingLevel: 'debug'
};

// src/environments/environment.staging.ts (Entorno de Staging/QA)
export const environment = {
  production: false, // O true, depende de cómo quieras que staging se acerque a prod
  environmentName: 'staging',
  apiUrl: 'https://api.staging.yourdomain.com/api',
  featureFlags: {
    newDashboard: false, // Deshabilita la nueva función en staging para pruebas específicas
    betaTests: false,
  },
  loggingLevel: 'info'
};

// src/environments/environment.prod.ts (Producción)
export const environment = {
  production: true,
  environmentName: 'production',
  apiUrl: 'https://api.yourdomain.com/api',
  featureFlags: {
    newDashboard: false, // La nueva función aún no está en producción
    betaTests: false,
  },
  loggingLevel: 'error' // Solo errores y warnings
};

// 2. **Configuración en `angular.json` para Múltiples Entornos**

/*
// src/angular.json (fragmento relevante del build architect)
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "projects": {
    "my-angular-app": {
      "architect": {
        "build": {
          "builder": "@angular-devkit/build-angular:browser",
          "options": { /* ... opciones base ... */ },
          "configurations": {
            "production": {
              "fileReplacements": [
                {
                  "replace": "src/environments/environment.ts",
                  "with": "src/environments/environment.prod.ts"
                }
              ],
              "optimization": true,
              "buildOptimizer": true,
              "aot": true,
              "sourceMap": false, // Generalmente false en producción
              "namedChunks": false
            },
            "staging": { // Nueva configuración para el entorno de staging
              "fileReplacements": [
                {
                  "replace": "src/environments/environment.ts",
                  "with": "src/environments/environment.staging.ts"
                }
              ],
              "optimization": true, // Puedes optimizar también para staging
              "buildOptimizer": true,
              "aot": true,
              "sourceMap": true // Quizás quieras source maps en staging para depuración
            },
            "development": {
              // Si tienes opciones específicas para desarrollo que no están en 'options' base
            }
          },
          "defaultConfiguration": "development"
        },
        "serve": {
          // Asegúrate de que el 'serve' también tenga configuraciones para tus entornos
          "configurations": {
            "production": { "browserTarget": "my-angular-app:build:production" },
            "development": { "browserTarget": "my-angular-app:build:development" },
            "staging": { "browserTarget": "my-angular-app:build:staging" } // Para servir staging
          },
          "defaultConfiguration": "development"
        }
      }
    }
  }
}
*/

// 3. **Uso de configuraciones en la aplicación**

// src/app/services/analytics.service.ts
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AnalyticsService {
  constructor() {
    if (environment.production || environment.environmentName === 'staging') {
      // Solo inicializa Analytics en producción o staging
      console.log(`Inicializando Analytics para ${environment.environmentName} con ID: ${environment.analyticsId}`);
      // Aquí iría la inicialización real de tu librería de analíticas
    } else {
      console.log('Analytics deshabilitado en desarrollo.');
    }
  }

  trackEvent(eventName: string, properties: any): void {
    if (environment.production || environment.environmentName === 'staging') {
      // Enviar evento a la herramienta de analíticas
      console.log(`Tracking event: ${eventName}`, properties);
    } else if (environment.debugLogging) {
      console.log(`(DEBUG) Tracking event: ${eventName}`, properties);
    }
  }
}

// src/app/components/feature-toggle/feature-toggle.component.ts
import { Component } from '@angular/core';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-feature-toggle',
  template: `
    <div *ngIf="environment.featureFlags.newDashboard">
      <h2>¡Bienvenido al Nuevo Dashboard!</h2>
      <p>Esta es una característica en desarrollo/prueba.</p>
    </div>
    <div *ngIf="!environment.featureFlags.newDashboard">
      <h2>Dashboard Clásico</h2>
      <p>La versión actual de nuestro panel de control.</p>
    </div>
  `
})
export class FeatureToggleComponent {
  environment = environment; // Hacer environment accesible en la plantilla
}

// 4. **Comandos para servir/construir para diferentes entornos**

// Para Desarrollo:
// ng serve
// ng build

// Para Staging:
// ng serve --configuration staging
// ng build --configuration staging

// Para Producción:
// ng serve --configuration production
// ng build --configuration production

/*
Errores comunes en la separación de configuraciones:

1.  **Valores que no deberían cambiar por entorno en los archivos de entorno**:
    No pongas en `environment.ts` valores que son intrínsecos a la lógica de tu aplicación y que no
    cambian según el entorno (ej., la lógica de negocio, constantes matemáticas).
    Solo deben ir valores que **dependen** del entorno de despliegue.

2.  **Configuraciones incompletas o inconsistentes**:
    Asegúrate de que cada archivo de entorno tenga todas las variables necesarias y que sus nombres
    sean consistentes. Un valor faltante o mal nombrado puede causar errores sutiles o fallos en producción.

3.  **No tener un entorno de staging/QA**:
    Saltar directamente de desarrollo a producción es arriesgado. Un entorno de staging es crucial
    para realizar pruebas finales en un entorno que simula de cerca la producción antes de un lanzamiento real.

4.  **No usar el flag `--configuration`**:
    El error más común es desplegar sin especificar la configuración, lo que por defecto usará el entorno de desarrollo,
    llevando a problemas en producción.

5.  **Exponer información sensible (reiterado)**:
    Una vez más, si bien los archivos de entorno separan las configuraciones, no los hacen seguros
    para datos realmente sensibles. Las claves secretas deben manejarse en el backend o en variables de entorno del servidor.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Gestión de Configuraciones',
    'subtopic': 'Seguridad en la gestión de configuraciones',
    'definition': r'''
La "seguridad en la gestión de configuraciones" es uno de los aspectos más críticos y a menudo subestimados en el desarrollo y despliegue de aplicaciones, especialmente en el frontend. Se trata de cómo manejas y proteges los valores de configuración (URLs, claves de API, credenciales) para asegurar que no caigan en manos equivocadas o sean mal utilizados. Es como proteger las llaves de tu casa y las combinaciones de tu caja fuerte: no las dejas a la vista, no las compartes con cualquiera y las cambias si sospechas que han sido comprometidas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un mapa del tesoro. Si el mapa (tu configuración) cayera en manos de un pirata (un atacante), este podría usarlo para acceder a tus recursos más valiosos. En el mundo de las aplicaciones, esto significa que si una clave de API secreta o una credencial de base de datos se expone, un atacante podría acceder a datos de usuarios, tomar control de tus servicios o incluso causar daños financieros. Un incidente de seguridad debido a una configuración mal manejada puede tener consecuencias devastadoras, desde la pérdida de confianza de los usuarios hasta multas por incumplimiento de normativas de privacidad. Empresas como Uber han tenido problemas de seguridad por malas prácticas en la gestión de claves.

**Principios clave de seguridad en la gestión de configuraciones para Angular**:

1.  **NUNCA almacenar secretos sensibles en el frontend**:
    Este es el principio más importante. Tu aplicación Angular se descarga y ejecuta en el navegador del usuario. Cualquier cosa que esté en el bundle JavaScript final (incluidos los valores de `environment.ts` una vez compilados) es accesible para cualquiera que inspeccione el código fuente. Esto significa que:
    * **Claves secretas de APIs**: No deben ir aquí (ej., tu `Stripe Secret Key`, credenciales de bases de datos, claves privadas de OAuth).
    * **Contraseñas o credenciales de servicios**: Lo mismo, prohibido.
    * **Tokens de acceso de usuario (JWTs)**: Aunque se manejan en el frontend, deben almacenarse de forma segura (ej., HttpOnly cookies, o en `localStorage`/`sessionStorage` con precauciones) y nunca como parte de la configuración estática.

2.  **Gestionar secretos en el backend o con servicios de gestión de secretos**:
    Las claves y credenciales realmente sensibles deben residir en tu backend o en un servicio de gestión de secretos dedicado (como AWS Secrets Manager, Azure Key Vault, HashiCorp Vault, Google Cloud Secret Manager). Tu backend será el único que tenga acceso a estas claves y las usará para interactuar con servicios de terceros. El frontend solo conocerá la URL de tu propio backend.

3.  **Uso de variables de entorno del sistema operativo (en el servidor de CI/CD)**:
    Cuando construyas tu aplicación en un entorno de CI/CD (GitHub Actions, GitLab CI/CD, Jenkins), puedes inyectar algunas configuraciones como variables de entorno del sistema (ej., `process.env.MY_API_URL`). Estas variables solo existen durante el proceso de build y no terminan en el bundle final del cliente. Por ejemplo, tu token de despliegue para Netlify o Firebase se inyecta de esta manera.

4.  **Minimizar la superficie de ataque en los archivos de entorno públicos**:
    Aunque los `environment.ts` son accesibles, solo deben contener información que no suponga un riesgo si se hace pública (ej., URLs de APIs públicas, claves de API que solo funcionan del lado del cliente y tienen permisos limitados, flags de características).

5.  **Revisión y rotación de claves**:
    Regularmente revisa y rota tus claves de API y credenciales. Si una clave se filtra, su rotación limita el daño.

6.  **Configuración de CSP (Content Security Policy)**:
    Aunque no es directamente sobre valores de configuración, una CSP bien definida en tu servidor web (o en tu `index.html` de Angular) puede mitigar los ataques de XSS y restringir desde dónde se pueden cargar recursos, lo que añade una capa de seguridad.

La seguridad en la gestión de configuraciones es un equilibrio entre la conveniencia y la protección. Siempre piensa: "¿Qué daño podría hacer si esta información se hace pública?" Si la respuesta es "mucho", entonces no debe estar en el frontend.
''',
    'code_example': r'''
// --- EJEMPLO: SEGURIDAD EN LA GESTIÓN DE CONFIGURACIONES (CONCEPTUAL) ---

// Este ejemplo se centra en los "anti-patrones" y las buenas prácticas
// en la gestión de configuraciones, especialmente para el frontend.

// 1. **MAL: Almacenar secretos sensibles directamente en `environment.ts`**
// Este es un ERROR DE SEGURIDAD GRAVE. NUNCA HAGAS ESTO en un proyecto real.

// src/environments/environment.ts (EJEMPLO DE MALA PRÁCTICA)
export const environment = {
  production: false,
  // ¡¡¡NO DEBERÍA ESTAR AQUÍ!!! Clave secreta de Stripe para procesar pagos
  stripeSecretKey: 'sk_test_YOUR_ACTUAL_SECRET_KEY',
  // ¡¡¡NO DEBERÍA ESTAR AQUÍ!!! Contraseña para acceder a una base de datos directamente
  dbPassword: 'mySuperSecretDbPassword123',
  // ¡¡¡NO DEBERÍA ESTAR AQUÍ!!! Clave privada para firmar JWTs
  jwtPrivateKey: '-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----',
  apiUrl: 'http://localhost:3000/api'
};

// Problema: Cuando `ng build` compila tu aplicación, estos valores
// terminan directamente en los archivos JavaScript de tu bundle,
// que cualquier usuario puede ver en su navegador.

// 2. **BIEN: Claves públicas en `environment.ts` (con precauciones)**
// Las claves públicas (ej., de pasarelas de pago) que solo funcionan del lado del cliente
// y tienen permisos limitados, pueden ir en los archivos de entorno.

// src/environments/environment.prod.ts (BUENA PRÁCTICA)
export const environment = {
  production: true,
  apiUrl: 'https://api.yourdomain.com/api',
  stripePublicKey: 'pk_live_YOUR_PUBLIC_KEY', // Esta clave es pública por diseño del servicio
  googleMapsApiKey: 'AIzaSyC_YourProductionPublicAPIKey', // Esta clave es de API pública
  // Otros flags y URLs no sensibles
};

// Las claves públicas son necesarias para que el frontend interactúe directamente
// con servicios de terceros (ej., Stripe para tokenizar tarjetas de crédito antes de enviarlas al backend).
// Sin embargo, incluso estas claves públicas deben tener restricciones (ej., dominios permitidos)
// en la configuración del servicio externo.

// 3. **BIEN: Gestión de secretos sensibles en el Backend**

// Flujo recomendado para secretos sensibles:
// a) El frontend (Angular) llama a tu propio Backend/API.
// b) El Backend recibe la solicitud del frontend.
// c) El Backend recupera la clave secreta (ej., `Stripe Secret Key`) de:
//    - Variables de entorno del servidor (ej., `process.env.STRIPE_SECRET_KEY` en Node.js).
//    - Un servicio de gestión de secretos (AWS Secrets Manager, Azure Key Vault).
// d) El Backend utiliza la clave secreta para interactuar con el servicio externo (ej., Stripe).
// e) El Backend devuelve la respuesta al frontend.

/*
// Ejemplo conceptual en un Backend (Node.js con Express)
// app.js
const express = require('express');
const app = express();
require('dotenv').config(); // Carga variables de entorno desde .env

const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY); // Usa la clave secreta del entorno

app.post('/api/process-payment', async (req, res) => {
  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount: req.body.amount,
      currency: 'usd',
      payment_method: req.body.paymentMethodId, // Token de tarjeta desde el frontend
      confirm: true,
    });
    res.json({ success: true, clientSecret: paymentIntent.client_secret });
  } catch (error) {
    console.error('Error procesando pago:', error);
    res.status(500).json({ error: error.message });
  }
});

// .env (Este archivo NO se sube al control de versiones)
STRIPE_SECRET_KEY=sk_live_YOUR_ACTUAL_SECRET_KEY_NEVER_COMMIT_THIS
DB_PASSWORD=anotherSuperSecretPassword

// En producción, estas variables se configurarían directamente en el entorno del servidor
// o en un gestor de secretos, no en un archivo `.env`.
*/

// 4. **BIEN: Uso de GitHub Secrets para despliegue en CI/CD**

// .github/workflows/deploy.yml (fragmento)
name: Deploy to Netlify

on:
  push:
    branches: [main]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      // ...
      - name: Deploy to Netlify
        env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }} # Accede al secreto de GitHub
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
        run: netlify deploy --dir=dist/your-app-name --prod

// NETLIFY_AUTH_TOKEN se configura en Settings -> Secrets -> Actions en tu repositorio de GitHub.
// Nunca se ve en el código fuente.

/*
Errores comunes en la seguridad de la gestión de configuraciones:

1.  **Hardcoding de secretos**:
    Poner claves API, contraseñas, etc., directamente en el código fuente de cualquier archivo (no solo `environment.ts`).

2.  **Commit de archivos `.env` o configuraciones sensibles**:
    Si usas archivos `.env` para desarrollo local, asegúrate de que estén en tu `.gitignore` para
    evitar subirlos accidentalmente al repositorio. Lo mismo para archivos de configuración específicos del servidor.

3.  **No rotar credenciales**:
    Dejar las mismas claves y tokens durante años aumenta el riesgo de compromiso.
    Implementa una política de rotación regular (ej., cada 90 días).

4.  **Permisos excesivos para claves de API**:
    Asegúrate de que tus claves de API (incluso las públicas) tengan los permisos mínimos necesarios.
    Por ejemplo, una clave de Google Maps solo debería tener acceso a la API de mapas, no a otros servicios de Google Cloud.

5.  **Depender de la ofuscación como seguridad**:
    Algunas personas piensan que si el código JavaScript está "minificado" u "ofuscado" (como lo hace el build de Angular),
    los secretos están seguros. Esto es falso. La ofuscación no es seguridad; un atacante determinado puede revertirla.
    La única forma segura es no tener el secreto en el frontend en primer lugar.
*/
'''
  });
}
