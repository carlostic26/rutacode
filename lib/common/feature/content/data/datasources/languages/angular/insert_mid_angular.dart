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

Future<void> insertAngularMidLevel2Data(Database db) async {}

Future<void> insertAngularMidLevel3Data(Database db) async {}
