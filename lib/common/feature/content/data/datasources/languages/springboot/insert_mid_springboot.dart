import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSpringbootMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Seguridad Avanzada',
    'topic': 'JWT (JSON Web Tokens)',
    'subtopic': 'Implementación de autenticación basada en tokens.',
    'definition': '''
En el desarrollo de APIs RESTful modernas, las sesiones tradicionales (donde el servidor guarda el estado del usuario) pueden ser un dolor de cabeza, especialmente en entornos distribuidos o de microservicios. Aquí es donde los JSON Web Tokens (JWT) entran en juego como una solución elegante para la autenticación sin estado.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a simplificar la autenticación.

Pensemos por un momento en cómo funciona esto. Un JWT es básicamente una cadena compacta, segura para URL, que representa un conjunto de declaraciones (claims) que transfieren información entre dos partes. Una vez que un usuario se autentica (con usuario y contraseña, por ejemplo), el servidor no crea una sesión, sino que genera un JWT. Este token contiene información sobre el usuario (su ID, roles, etc.) y va firmado digitalmente.

El servidor devuelve este JWT al cliente (por ejemplo, una aplicación frontend). A partir de ese momento, el cliente incluye este token en cada petición subsiguiente a la API (normalmente en la cabecera `Authorization` como un `Bearer Token`).

Cuando el servidor recibe una petición con un JWT:
1.  **Verifica la firma**: Primero, el servidor usa la clave secreta (que solo él conoce) para verificar la firma del token. Si la firma no es válida, significa que el token fue alterado o no fue emitido por nuestro servidor, y la petición es rechazada.
2.  **Valida la caducidad y otros "claims"**: Luego, el servidor comprueba que el token no haya caducado y que otras declaraciones importantes (como el emisor o el público al que va dirigido) sean correctas.
3.  **Extrae la información del usuario**: Si el token es válido, el servidor puede decodificarlo para obtener la identidad del usuario y sus roles, sin necesidad de consultar una base de datos o un registro de sesión.

La clave aquí es que el JWT es **autocontenido y sin estado (stateless)**. El servidor no necesita almacenar ninguna información de sesión. Toda la información necesaria para autenticar y autorizar la petición está en el token mismo. Esto es increíblemente útil para la escalabilidad, ya que cualquier servidor puede verificar el token de forma independiente, y para arquitecturas de microservicios, donde diferentes servicios pueden validar el mismo token. Esto es fundamental para empresas como Netflix o Spotify, que manejan millones de usuarios y requieren alta escalabilidad.
''',
    'code_example': r'''
// Ejemplo conceptual de implementación de autenticación basada en JWT en Spring Boot

// 1. Dependencias en pom.xml (Maven)
/*
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.12.5</version> </dependency>
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-impl</artifactId>
    <version>0.12.5</version>
    <scope>runtime</scope>
</dependency>
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-jackson</artifactId>
    <version>0.12.5</version>
    <scope>runtime</scope>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
*/

// 2. Componente para generar y validar JWTs (JwtTokenProvider.java)
/*
package com.example.demo.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Component
public class JwtTokenProvider {

    @Value("${app.jwtSecret}") // Se lee de application.properties
    private String jwtSecret;

    @Value("${app.jwtExpirationInMs}") // Se lee de application.properties
    private int jwtExpirationInMs;

    // Genera un JWT a partir de la autenticación de un usuario
    public String generateToken(Authentication authentication) {
        UserDetails userPrincipal = (UserDetails) authentication.getPrincipal();

        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + jwtExpirationInMs);

        return Jwts.builder()
                .setSubject(userPrincipal.getUsername()) // Nombre de usuario en el 'subject'
                .setIssuedAt(new Date())
                .setExpiration(expiryDate)
                .signWith(getSigningKey(), SignatureAlgorithm.HS512) // Firma con clave secreta y algoritmo
                .compact();
    }

    // Obtiene el nombre de usuario de un JWT
    public String getUsernameFromJWT(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    // Valida un JWT
    public boolean validateToken(String authToken) {
        try {
            Jwts.parserBuilder().setSigningKey(getSigningKey()).build().parseClaimsJws(authToken);
            return true;
        } catch (Exception ex) {
            // Manejo de excepciones de JWT (malformado, expirado, etc.)
            System.out.println("JWT inválido: " + ex.getMessage());
        }
        return false;
    }

    // Extrae una claim específica del token
    private <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    // Extrae todas las claims del token
    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder().setSigningKey(getSigningKey()).build().parseClaimsJws(token).getBody();
    }

    // Obtiene la clave de firma desde la cadena secreta
    private Key getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(jwtSecret);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
*/

// 3. Filtro de Autenticación JWT (JwtAuthenticationFilter.java)
/*
package com.example.demo.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        try {
            String jwt = getJwtFromRequest(request);

            if (StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
                String username = tokenProvider.getUsernameFromJWT(jwt);

                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        } catch (Exception ex) {
            System.out.println("No se pudo establecer la autenticación del usuario en el contexto de seguridad" + ex);
        }

        filterChain.doFilter(request, response);
    }

    private String getJwtFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7); // Quita el prefijo "Bearer "
        }
        return null;
    }
}
*/

// 4. Configuración de Seguridad para JWT (SecurityConfig.java)
/*
package com.example.demo.config;

import com.example.demo.security.JwtAuthenticationFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final UserDetailsService userDetailsService;

    public SecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Deshabilita CSRF para APIs REST sin estado
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)) // API sin estado
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/api/auth/**").permitAll() // Rutas de autenticación (login, registro) permitidas
                .anyRequest().authenticated() // Todas las demás rutas requieren autenticación
            );

        // Añade nuestro filtro JWT antes del filtro de autenticación de usuario/contraseña de Spring Security
        http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
*/

// 5. Controlador de Autenticación (AuthController.java)
/*
package com.example.demo.controller;

import com.example.demo.payload.LoginRequest; // DTO para credenciales de login
import com.example.demo.payload.JwtAuthenticationResponse; // DTO para la respuesta JWT
import com.example.demo.security.JwtTokenProvider;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider tokenProvider;

    public AuthController(AuthenticationManager authenticationManager, JwtTokenProvider tokenProvider) {
        this.authenticationManager = authenticationManager;
        this.tokenProvider = tokenProvider;
    }

    @PostMapping("/signin")
    public ResponseEntity<JwtAuthenticationResponse> authenticateUser(@RequestBody LoginRequest loginRequest) {
        // Autentica al usuario usando las credenciales proporcionadas
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUsername(),
                        loginRequest.getPassword()
                )
        );

        // Establece la autenticación en el contexto de seguridad
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // Genera el token JWT
        String jwt = tokenProvider.generateToken(authentication);
        return ResponseEntity.ok(new JwtAuthenticationResponse(jwt));
    }
}
*/

// 6. DTOs de ejemplo (LoginRequest.java y JwtAuthenticationResponse.java)
/*
package com.example.demo.payload;

public class LoginRequest {
    private String username;
    private String password;
    // Getters y Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}

public class JwtAuthenticationResponse {
    private String accessToken;
    private String tokenType = "Bearer";

    public JwtAuthenticationResponse(String accessToken) {
        this.accessToken = accessToken;
    }
    // Getters
    public String getAccessToken() { return accessToken; }
    public String getTokenType() { return tokenType; }
    // Setters (opcional si solo se usa para respuesta)
    public void setAccessToken(String accessToken) { this.accessToken = accessToken; }
    public void setTokenType(String tokenType) { this.tokenType = tokenType; }
}
*/

// 7. Propiedades de JWT en application.properties
/*
app.jwtSecret=TuSuperSecretoParaFirmarTokensQueDebeSerLargoYComplejo
app.jwtExpirationInMs=604800000 # 7 días en milisegundos
*/

/* Incorrecto:
   Almacenar JWTs en el localStorage del navegador para ataques XSS.
   Es mejor usar HttpOnly Cookies para JWTs en aplicaciones web tradicionales.
*/
/*
// En el frontend (JS):
// localStorage.setItem('jwtToken', response.data.accessToken); // NO RECOMENDADO
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Seguridad Avanzada',
    'topic': 'JWT (JSON Web Tokens)',
    'subtopic': 'Protección de endpoints y roles de usuario.',
    'definition': '''
Una vez que has implementado la autenticación basada en JWT, el siguiente paso lógico es usar esos tokens para proteger tus endpoints y controlar el acceso de los usuarios en función de sus roles. Esto es la autorización, y Spring Security, junto con JWT, ofrece un mecanismo robusto para lograrlo en tus APIs RESTful.

Aquí te va la aclaración: Esto es como tener una tarjeta de acceso que no solo te deja entrar al edificio (autenticación), sino que también tiene un chip que indica a qué pisos (endpoints) y qué oficinas (funcionalidades) tienes permiso para acceder (autorización).

Para proteger los endpoints con JWT y roles, el proceso general es:

1.  **Validación del token**: Como vimos en el subtema anterior, cada vez que una petición llega a tu API, el filtro JWT intercepta la solicitud, extrae el token y lo valida. Si el token es válido, se extrae el nombre de usuario y los roles (o autoridades) del token.
2.  **Carga de autoridades**: La información del usuario y sus roles se carga en el `SecurityContextHolder` de Spring Security, que es un lugar donde Spring mantiene los detalles del principal de seguridad actual.
3.  **Aplicación de reglas de autorización**: Una vez que el usuario y sus roles están en el contexto de seguridad, puedes aplicar las reglas de autorización.

En Spring Boot, esto se hace de dos maneras principales:

* **Protección a nivel de URL (o ruta)**: En tu configuración de Spring Security (la clase con `@Configuration` y `@EnableWebSecurity`), puedes definir reglas para qué roles pueden acceder a qué patrones de URL. Por ejemplo, `"/admin/**.hasRole('ADMIN')` significa que cualquier ruta que empiece con `/admin/` solo será accesible si el usuario autenticado tiene el rol `ADMIN`.
* **Protección a nivel de método**: Para un control más granular, puedes usar anotaciones como `@PreAuthorize` o `@Secured` directamente en los métodos de tus controladores o servicios. Esto es útil si una parte de la lógica de negocio dentro de un método solo debe ejecutarse para usuarios con roles específicos, independientemente de la URL que la invocó. Por ejemplo, un método `deleteProduct()` podría estar anotado con `@PreAuthorize("hasRole('ADMIN')")`.

La información de los roles generalmente se incluye como un "claim" dentro del JWT durante su generación. Cuando el token se recibe, estos claims se leen y se usan para construir las `GrantedAuthority`s que Spring Security necesita para realizar la autorización. Esto permite una arquitectura sin estado, donde cada petición es independiente y no se basa en sesiones de servidor, lo que es fundamental para la escalabilidad y la resiliencia de las APIs modernas.
''',
    'code_example': r'''
// Ejemplo de protección de endpoints y roles de usuario con JWT en Spring Boot

package com.example.demo.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Asegúrate de que tienes @EnableMethodSecurity(prePostEnabled = true)
// en tu clase de configuración de seguridad para que @PreAuthorize funcione.

@RestController
@RequestMapping("/api")
public class SecuredEndpointController {

    // Este endpoint está protegido por la configuración de Spring Security
    // Solo usuarios autenticados pueden acceder (anyRequest().authenticated())
    @GetMapping("/user/me")
    public String getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return "Hola, " + username + "! Has accedido a tu información de usuario.";
    }

    // Este endpoint requiere el rol "ADMIN" para ser accedido
    @GetMapping("/admin/dashboard")
    @PreAuthorize("hasRole('ADMIN')") // Requiere el rol ADMIN
    public String getAdminDashboard() {
        return "Bienvenido al panel de administración. Solo para admins.";
    }

    // Este endpoint requiere el rol "USER" o "ADMIN"
    @GetMapping("/products")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')") // Requiere rol USER o ADMIN
    public String getProducts() {
        return "Listado de productos disponible para usuarios y administradores.";
    }

    // Un endpoint que requiere un permiso (autoridad) más granular, no solo un rol
    // Por ejemplo, el rol ADMIN podría tener este permiso, o un rol CUSTOMER_SERVICE
    @GetMapping("/support/view-tickets")
    @PreAuthorize("hasAuthority('VIEW_TICKETS')") // Requiere la autoridad 'VIEW_TICKETS'
    public String viewTickets() {
        return "Puedes ver los tickets de soporte.";
    }

    // En tu JwtTokenProvider, asegúrate de que los roles se añaden como claims al JWT:
    /*
    // Dentro de JwtTokenProvider.java
    public String generateToken(Authentication authentication) {
        UserDetails userPrincipal = (UserDetails) authentication.getPrincipal();
        // Recopila los roles/autoridades del usuario
        List<String> roles = userPrincipal.getAuthorities().stream()
                                    .map(GrantedAuthority::getAuthority)
                                    .collect(Collectors.toList());

        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + jwtExpirationInMs);

        return Jwts.builder()
                .setSubject(userPrincipal.getUsername())
                .claim("roles", roles) // Añade los roles como un claim personalizado
                .setIssuedAt(new Date())
                .setExpiration(expiryDate)
                .signWith(getSigningKey(), SignatureAlgorithm.HS512)
                .compact();
    }
    */

    // Y en tu JwtAuthenticationFilter, asegúrate de que estos claims se leen y se usan
    // para crear el UsernamePasswordAuthenticationToken con las autoridades correctas.
    /*
    // Dentro de JwtAuthenticationFilter.java
    // ...
    if (StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
        String username = tokenProvider.getUsernameFromJWT(jwt);
        // Aquí podrías obtener los roles/autoridades directamente del JWT,
        // o cargarlos de tu UserDetailsService si es necesario para lógica más compleja.
        // Si los roles están en el JWT, puedes construir la lista de GrantedAuthority directamente:
        // List<String> rolesFromJwt = (List<String>) tokenProvider.getClaimFromJWT(jwt, "roles");
        // List<GrantedAuthority> authorities = rolesFromJwt.stream()
        //      .map(SimpleGrantedAuthority::new)
        //      .collect(Collectors.toList());
        // UserDetails userDetails = new User(username, "", authorities);

        UserDetails userDetails = userDetailsService.loadUserByUsername(username); // O carga de UserDetailsService
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                userDetails, null, userDetails.getAuthorities()); // Las autoridades se obtienen de userDetails
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }
    // ...
    */

    /* Incorrecto:
       No especificar roles para los endpoints o métodos y confiar únicamente en la autenticación,
       lo que lleva a que todos los usuarios autenticados tengan el mismo nivel de acceso.
    */
    /*
    @GetMapping("/secure-but-any-user")
    // Sin @PreAuthorize o configuracion en SecurityFilterChain, cualquier usuario autenticado accede
    public String unprotectedSecureEndpoint() {
        return "Cualquier usuario logueado puede ver esto.";
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Seguridad Avanzada',
    'topic': 'OAuth2 y OpenID Connect',
    'subtopic': 'Integración con proveedores de identidad.',
    'definition': '''
En el mundo actual de aplicaciones conectadas, es muy común que los usuarios quieran usar sus credenciales existentes (como las de Google, Facebook, o un sistema de identidad corporativo) para acceder a tu aplicación. Aquí es donde entran en juego OAuth2 y OpenID Connect (OIDC), facilitando la integración con estos "proveedores de identidad" sin necesidad de que tu aplicación gestione directamente las contraseñas de los usuarios.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a simplificar la autenticación.

Pensemos por un momento en cómo esto funciona. OAuth2 es un framework de autorización. Su objetivo principal es permitir que una aplicación (el "cliente") acceda a recursos protegidos en nombre de un usuario en otro servicio (el "servidor de recursos"), sin que el cliente necesite las credenciales del usuario. Por ejemplo, permitir que una app de fotos acceda a tus fotos en Google Fotos.

OpenID Connect (OIDC) es una capa de identidad construida sobre OAuth2. Mientras que OAuth2 se enfoca en la autorización (dar permisos para acceder a recursos), OIDC se enfoca en la autenticación (verificar la identidad del usuario). OIDC te proporciona un "ID Token" (un JWT) que contiene información sobre el usuario autenticado.

La integración con proveedores de identidad (como Google, Okta, Auth0, Keycloak, etc.) en Spring Boot con OAuth2/OIDC funciona de la siguiente manera:

1.  **Redirección al proveedor**: Cuando un usuario quiere iniciar sesión o autorizar tu aplicación, tu aplicación lo redirige al proveedor de identidad.
2.  **Autenticación y consentimiento**: El usuario inicia sesión en el proveedor (si no lo está ya) y da su consentimiento para que tu aplicación acceda a cierta información o recursos en su nombre.
3.  **Redirección de vuelta a tu aplicación**: El proveedor de identidad redirige al usuario de vuelta a tu aplicación con un "código de autorización" o directamente un "token de acceso" y/o un "ID token".
4.  **Intercambio de código por tokens**: Si se recibe un código de autorización, tu aplicación lo intercambia con el proveedor por tokens (token de acceso, token de refresco, ID token).
5.  **Acceso a recursos e identificación**: Tu aplicación usa el token de acceso para llamar a las APIs del proveedor (por ejemplo, para obtener el perfil del usuario) y el ID token para verificar la identidad del usuario.

Spring Security tiene un soporte excelente para OAuth2/OIDC, haciendo que esta integración sea relativamente sencilla. Esto es clave para aplicaciones modernas que buscan ofrecer una experiencia de usuario fluida y segura, permitiendo a los usuarios usar sus cuentas existentes y reduciendo la carga de tu aplicación en la gestión de credenciales.
''',
    'code_example': r'''
// Ejemplo conceptual de integración con un proveedor de identidad (Google) usando Spring Boot OAuth2/OIDC

// 1. Dependencia en pom.xml (Maven) para Spring Security OAuth2 Client
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-oauth2-client</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
*/

// 2. Configuración en application.properties (o .yml)
// (Ejemplo para Google como proveedor de identidad)
/*
# Registrar tu aplicación en Google Cloud Console para obtener client-id y client-secret
# Redirige URI: http://localhost:8080/login/oauth2/code/google

spring.security.oauth2.client.registration.google.client-id=<TU_CLIENT_ID_DE_GOOGLE>
spring.security.oauth2.client.registration.google.client-secret=<TU_CLIENT_SECRET_DE_GOOGLE>
spring.security.oauth2.client.registration.google.scope=openid,profile,email # Permisos solicitados
spring.security.oauth2.client.registration.google.redirect-uri={baseUrl}/login/oauth2/code/{registrationId} # URI de redirección
spring.security.oauth2.client.registration.google.client-name=Google # Nombre visible en el login

# Opcional: configurar un proveedor de identidad personalizado (si no es uno de los comunes como Google, GitHub, Okta)
# spring.security.oauth2.client.provider.my-custom-provider.authorization-uri=https://auth.example.com/oauth/authorize
# spring.security.oauth2.client.provider.my-custom-provider.token-uri=https://auth.example.com/oauth/token
# spring.security.oauth2.client.provider.my-custom-provider.user-info-uri=https://auth.example.com/userinfo
# spring.security.oauth2.client.provider.my-custom-provider.jwk-set-uri=https://auth.example.com/.well-known/jwks.json
*/

// 3. Configuración de seguridad en Spring (SecurityConfig.java)
/*
package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class OAuth2SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorizeRequests ->
                authorizeRequests
                    .requestMatchers("/").permitAll() // Permite acceso a la raíz (ej. para el login link)
                    .anyRequest().authenticated() // Todas las demás rutas requieren autenticación
            )
            .oauth2Login(oauth2Login ->
                oauth2Login
                    .defaultSuccessUrl("/oauth_success", true) // Redirección después de un login exitoso
                    .failureUrl("/oauth_failure") // Redirección si falla el login
            );
            // Si necesitas logout de OAuth2/OIDC, puedes configurarlo aquí
            // .logout(logout -> logout
            //    .logoutSuccessUrl("/loggedout")
            // );

        return http.build();
    }
}
*/

// 4. Controlador simple para ver el usuario autenticado (OAuth2Controller.java)
/*
package com.example.demo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OAuth2Controller {

    @GetMapping("/")
    public String home() {
        return "<h1>Bienvenido!</h1><a href='/oauth2/authorization/google'>Login con Google</a>";
    }

    @GetMapping("/oauth_success")
    public String oauthSuccess(Authentication authentication) {
        // authentication contendrá detalles del usuario autenticado vía OAuth2/OIDC
        return "¡Login exitoso con " + authentication.getName() + "! Tipo: " + authentication.getPrincipal().getClass().getName();
    }

    @GetMapping("/userinfo")
    public String getUserInfo(@AuthenticationPrincipal OidcUser oidcUser) {
        // OidcUser contiene los claims del ID Token (información del usuario)
        if (oidcUser != null) {
            return "<h2>Información del Usuario:</h2>" +
                   "<p>Nombre: " + oidcUser.getFullName() + "</p>" +
                   "<p>Email: " + oidcUser.getEmail() + "</p>" +
                   "<p>Atributos: " + oidcUser.getAttributes() + "</p>";
        }
        return "No hay información de usuario OIDC.";
    }

    // Para obtener el token de acceso (ej. para llamar a APIs de Google en nombre del usuario)
    @GetMapping("/authorized_client")
    public String authorizedClient(@RegisteredOAuth2AuthorizedClient("google") OAuth2AuthorizedClient authorizedClient) {
        if (authorizedClient != null) {
            return "Token de Acceso de Google: " + authorizedClient.getAccessToken().getTokenValue();
        }
        return "Cliente no autorizado.";
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Seguridad Avanzada',
    'topic': 'OAuth2 y OpenID Connect',
    'subtopic': 'Flujos de autorización y autenticación.',
    'definition': '''
OAuth2 y OpenID Connect (OIDC) definen varios "flujos" o "grant types" que dictan cómo una aplicación cliente obtiene autorización para acceder a recursos protegidos o cómo se verifica la identidad de un usuario. Entender estos flujos es clave para elegir la estrategia de seguridad adecuada para tu aplicación.

No sé tú, pero a mí esto al principio me costó entender las diferencias entre cada flujo y cuándo usar uno sobre otro.

Aquí te va la aclaración: los flujos son como coreografías predefinidas entre el cliente (tu aplicación), el usuario, y el servidor de autorización (el proveedor de identidad, como Google o Facebook). Cada flujo está diseñado para un tipo de aplicación y un nivel de confianza específicos.

Los flujos más comunes que verás y usarás son:

1.  **Código de Autorización (Authorization Code Grant)**:
    * **¿Para qué es?**: Este es el flujo más seguro y el más recomendado para aplicaciones web tradicionales (servidor-cliente) y aplicaciones móviles/nativas.
    * **¿Cómo funciona?**:
        1.  El usuario es redirigido a la página de login/consentimiento del proveedor.
        2.  Después del consentimiento, el proveedor redirige al usuario de vuelta a tu aplicación con un `código de autorización` (un código de un solo uso).
        3.  Tu aplicación (en el backend, de forma segura) intercambia ese código de autorización por un `token de acceso` y un `token de refresco` (y un `ID Token` si es OIDC).
        4.  Tu aplicación usa el `token de acceso` para llamar a las APIs protegidas.
    * **Ventaja**: El `token de acceso` nunca se expone directamente en el navegador del usuario, ya que el intercambio del código ocurre en el backend de forma segura.

2.  **Código de Autorización con PKCE (Proof Key for Code Exchange)**:
    * **¿Para qué es?**: Una extensión del flujo de Código de Autorización, diseñado específicamente para aplicaciones "públicas" (SPA - Single Page Applications, móviles y de escritorio) donde no se puede guardar un `client_secret` de forma segura.
    * **¿Cómo funciona?**: Añade un secreto generado dinámicamente por el cliente para cada solicitud. Esto evita ataques de intercepción del código de autorización. Es el flujo preferido para SPAs y móviles hoy en día.

3.  **Credenciales de Cliente (Client Credentials Grant)**:
    * **¿Para qué es?**: Para comunicación entre servicios (máquina a máquina), donde no hay un usuario final involucrado.
    * **¿Cómo funciona?**: Tu aplicación cliente (con su `client_id` y `client_secret`) solicita directamente un `token de acceso` al servidor de autorización. No hay redirección de usuario.
    * **Ventaja**: Simple y directo para la automatización y la comunicación entre microservicios.

4.  **Contraseña del Propietario del Recurso (Resource Owner Password Credentials Grant)**:
    * **¿Para qué es?**: **DEPRECADO y generalmente NO RECOMENDADO**. Fue pensado para aplicaciones altamente confiables (como las del propio proveedor de identidad) donde el usuario introduce sus credenciales directamente en el cliente.
    * **¿Cómo funciona?**: El cliente envía las credenciales del usuario (nombre de usuario y contraseña) directamente al servidor de autorización para obtener un token.
    * **Desventaja**: El cliente maneja directamente las credenciales del usuario, lo que es un riesgo de seguridad enorme. Evita este flujo.

5.  **Implícito (Implicit Grant)**:
    * **¿Para qué es?**: **DEPRECADO para la mayoría de los casos**. Anteriormente usado para SPAs.
    * **¿Cómo funciona?**: El token de acceso se devuelve directamente en la URL de redirección (fragmento hash), lo que lo hace vulnerable a ataques.
    * **Desventaja**: Riesgos de seguridad al exponer el token en la URL. Preferiblemente, usa el flujo de Código de Autorización con PKCE para SPAs.

Spring Security te ayuda a configurar y manejar estos flujos, especialmente el de Código de Autorización con o sin PKCE, que son los más seguros para la mayoría de las aplicaciones. Elegir el flujo correcto es una decisión crítica para la seguridad de tu aplicación.
''',
    'code_example': r'''
// Los flujos de OAuth2/OIDC se configuran principalmente
// a través de las propiedades de Spring Security OAuth2 Client en `application.properties`
// y la forma en que el cliente inicia la interacción (redireccionando al usuario).

// No hay un "código de ejemplo" directo para cada flujo, ya que son procesos coreográficos.
// La configuración en application.properties determina qué flujo puede usar tu cliente
// y cómo Spring Security lo maneja.

// **Ejemplo de configuración en `application.properties` para el flujo de Código de Autorización con PKCE (implícito en Spring Boot 2.x+ para SPA)**
/*
# Para Google como proveedor
spring.security.oauth2.client.registration.google.client-id=<TU_CLIENT_ID_DE_GOOGLE>
spring.security.oauth2.client.registration.google.client-secret=<TU_CLIENT_SECRET_DE_GOOGLE>
spring.security.oauth2.client.registration.google.scope=openid,profile,email
spring.security.oauth2.client.registration.google.redirect-uri={baseUrl}/login/oauth2/code/{registrationId}
spring.security.oauth2.client.registration.google.authorization-grant-type=authorization_code # Esto es clave para el flujo de código

# Si estás integrando con un servidor de autorización personalizado que soporta PKCE:
# Spring Security 5.x+ (y Spring Boot 2.x+) para el módulo `spring-security-oauth2-client`
# automáticamente agrega soporte para PKCE para los flujos de "authorization_code"
# cuando se usa con clientes públicos (como SPAs o móviles).
# No necesitas una configuración explícita para "habilitar PKCE"
# simplemente configurando el `authorization-grant-type=authorization_code`
# y asegurándote de que tu cliente es configurado como "público" en el IdP.
*/

// **Ejemplo de un controlador simple para iniciar un flujo de login OAuth2/OIDC**
// Spring Security automáticamente genera los enlaces de login para los proveedores configurados.
/*
package com.example.demo.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FlowDemoController {

    @GetMapping("/login-selection")
    public String loginPage() {
        // Spring Security genera automáticamente un endpoint como /oauth2/authorization/google
        // para iniciar el flujo de autenticación para el proveedor "google".
        return "<h1>Selecciona tu proveedor de Login:</h1>" +
               "<a href=\"/oauth2/authorization/google\">Login con Google</a><br/>" +
               "<a href=\"/oauth2/authorization/github\">Login con GitHub</a>";
    }

    @GetMapping("/authenticated-user-info")
    public String getUserInfo(@AuthenticationPrincipal OAuth2User oauth2User) {
        if (oauth2User != null) {
            // El objeto OAuth2User contiene los atributos obtenidos del proveedor de identidad
            // después de un flujo exitoso de Código de Autorización (con o sin PKCE).
            return "<h2>Información del Usuario Autenticado:</h2>" +
                   "<p>Nombre: " + oauth2User.getName() + "</p>" +
                   "<p>Atributos: " + oauth2User.getAttributes() + "</p>";
        }
        return "Usuario no autenticado.";
    }

    // Un endpoint para probar el flujo de Credenciales de Cliente
    // Esto no involucraría un navegador, sería una llamada de servicio a servicio.
    // Necesitarías una configuración separada para esto, típicamente usando WebClient o RestTemplate
    // para solicitar el token.
    // @Service
    // public class ClientCredentialsService {
    //     @Autowired
    //     private OAuth2AuthorizedClientService authorizedClientService;
    //
    //     public String getServiceToken() {
    //         OAuth2AuthorizedClient client = authorizedClientService.loadAuthorizedClient(
    //             "client_credentials_registration_id", "client_id_for_service");
    //         if (client != null) {
    //             return client.getAccessToken().getTokenValue();
    //         }
    //         return "No token available";
    //     }
    // }
}
*/

/* Incorrecto (o al menos a evitar en la mayoría de los casos modernos):
   Configurar y usar el flujo 'Implicit Grant' o 'Resource Owner Password Credentials Grant'
   debido a sus inherentes riesgos de seguridad para aplicaciones públicas o de usuario final.
*/
/*
# Configuración DEPRECADA o NO RECOMENDADA para aplicaciones web/móviles:
# spring.security.oauth2.client.registration.my-app.authorization-grant-type=implicit
# spring.security.oauth2.client.registration.my-app.authorization-grant-type=password
*/
'''
  });
}

Future<void> insertSpringbootMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Arquitectura de Microservicios',
    'topic': 'Desarrollo de Microservicios',
    'subtopic':
        'Separación de responsabilidades y comunicación entre servicios.',
    'definition': '''
Los microservicios son un estilo arquitectónico que estructura una aplicación como una colección de servicios pequeños, autónomos y acoplados de forma ligera. Cada servicio se enfoca en una funcionalidad de negocio específica, lo que contrasta con las arquitecturas monolíticas tradicionales.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a simplificar el desarrollo?

Pensemos por un momento en las dos ideas centrales de los microservicios: la separación de responsabilidades y la comunicación entre ellos.

1.  **Separación de responsabilidades**:
    * Cada microservicio debe tener una única responsabilidad bien definida, lo que se conoce como el "principio de responsabilidad única". Por ejemplo, en una aplicación de comercio electrónico, tendrías un servicio para `Usuarios`, otro para `Productos`, otro para `Pedidos`, y así sucesivamente.
    * Esta separación permite que equipos pequeños trabajen de forma independiente en sus propios servicios, sin pisarse los pies con otros equipos. Esto acelera el desarrollo, facilita el mantenimiento y reduce el riesgo de que un cambio en una parte de la aplicación afecte a otras.
    * Además, cada servicio puede ser desarrollado en un lenguaje de programación diferente y usar su propia base de datos, si es necesario, eligiendo la mejor tecnología para su tarea específica (políglota en tecnología).

2.  **Comunicación entre servicios**:
    * Dado que los microservicios son autónomos, necesitan una forma de comunicarse entre sí para realizar operaciones que abarcan múltiples funcionalidades. Esta comunicación puede ser síncrona o asíncrona.
    * **Comunicación síncrona**: Esto es cuando un servicio llama directamente a otro y espera una respuesta inmediata. El método más común para esto en microservicios es usar APIs RESTful sobre HTTP. Un servicio de `Pedidos` podría llamar al servicio de `Inventario` para verificar la disponibilidad de un producto.
    * **Comunicación asíncrona**: Esto implica el uso de colas de mensajes o brokers (como Kafka, RabbitMQ) donde los servicios envían eventos o mensajes y no esperan una respuesta inmediata. Por ejemplo, el servicio de `Pedidos` podría publicar un evento "Pedido Creado", y el servicio de `Facturación` y el de `Envío` escucharían ese evento para realizar sus propias acciones. Esto aumenta la resiliencia, ya que los servicios no dependen de que el otro esté siempre disponible.

La separación de responsabilidades facilita que cada servicio sea más pequeño, fácil de entender y de mantener. La comunicación bien definida, ya sea síncrona o asíncrona, asegura que todos los servicios puedan colaborar para ofrecer la funcionalidad completa de la aplicación. Empresas como Amazon y Netflix han sido pioneras en el uso de arquitecturas de microservicios para escalar sus operaciones masivamente y permitir el desarrollo rápido e independiente de miles de equipos.
''',
    'code_example': r'''
// Ejemplo conceptual de separación de responsabilidades y comunicación en microservicios

// 1. Servicio de Usuarios (responsabilidad: gestionar usuarios)
/*
package com.example.userservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Esto sería un microservicio independiente
@RestController
@RequestMapping("/users")
public class UserController {

    @GetMapping("/{userId}")
    public String getUserProfile(@PathVariable Long userId) {
        // Lógica para obtener el perfil del usuario de una base de datos de usuarios
        return "Perfil del usuario " + userId + " (desde User Service)";
    }
}
*/

// 2. Servicio de Productos (responsabilidad: gestionar productos)
/*
package com.example.productservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Otro microservicio independiente
@RestController
@RequestMapping("/products")
public class ProductController {

    @GetMapping("/{productId}")
    public String getProductDetails(@PathVariable Long productId) {
        // Lógica para obtener detalles del producto de una base de datos de productos
        return "Detalles del producto " + productId + " (desde Product Service)";
    }

    @GetMapping("/availability/{productId}")
    public boolean checkProductAvailability(@PathVariable Long productId) {
        // Lógica para verificar la disponibilidad
        return productId % 2 == 0; // Ejemplo: par = disponible
    }
}
*/

// 3. Servicio de Pedidos (responsabilidad: gestionar pedidos, se comunica con otros)
/*
package com.example.orderservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate; // Para comunicación síncrona HTTP

// Otro microservicio independiente
@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private RestTemplate restTemplate; // Bean para hacer llamadas HTTP

    // Simulación de un DTO de pedido
    static class OrderRequest {
        public Long userId;
        public Long productId;
        public int quantity;
    }

    @PostMapping
    public String createOrder(@RequestBody OrderRequest orderRequest) {
        // 1. Comunicación Síncrona: Llamar al servicio de productos para verificar disponibilidad
        String productServiceUrl = "http://localhost:8081/products/availability/" + orderRequest.productId;
        Boolean isAvailable = restTemplate.getForObject(productServiceUrl, Boolean.class);

        if (isAvailable != null && isAvailable) {
            // 2. Comunicación Asíncrona (conceptual): Publicar evento de "Pedido Creado"
            // Esto usaría una librería de mensajería (KafkaProducer, RabbitTemplate, etc.)
            System.out.println("DEBUG: Publicando evento 'OrderCreated' para el pedido de usuario " + orderRequest.userId);
            // orderProducer.send(new OrderCreatedEvent(orderRequest.userId, orderRequest.productId, orderRequest.quantity));

            return "Pedido creado con éxito para el usuario " + orderRequest.userId + " y producto " + orderRequest.productId;
        } else {
            return "Producto " + orderRequest.productId + " no disponible.";
        }
    }
}

// Configuración de RestTemplate en Order Service (en una clase @Configuration)
// @Configuration
// public class AppConfig {
//     @Bean
//     public RestTemplate restTemplate() {
//         return new RestTemplate();
//     }
// }
*/

/* Incorrecto (Monolito que mezcla responsabilidades y hace comunicación interna directa):
   Un único servicio grande que maneja usuarios, productos y pedidos,
   con lógica de negocio interconectada que dificulta el mantenimiento.
*/
/*
package com.example.monolith.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MonolithController {

    @GetMapping("/process-everything")
    public String processEverything() {
        // Aquí se mezclan todas las responsabilidades:
        // Lógica para gestionar usuarios, productos, pedidos, inventario, etc.
        // Todo en el mismo proceso y base de datos (típicamente)
        System.out.println("Gestionando usuarios...");
        System.out.println("Verificando productos...");
        System.out.println("Creando pedidos...");
        return "Proceso monolítico completado.";
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Arquitectura de Microservicios',
    'topic': 'Desarrollo de Microservicios',
    'subtopic': 'Uso de REST y HTTP para interacción entre servicios.',
    'definition': '''
En el corazón de la comunicación síncrona entre microservicios, encontrarás a REST y HTTP. Estos no son solo términos de moda; son la base sobre la cual se construyen muchas de las interacciones entre los servicios en una arquitectura distribuida.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a la hora de estructurar nuestros servicios?

Pensemos por un momento que cada microservicio es una pequeña aplicación web que expone una API. HTTP es el protocolo fundamental de la web, y REST es un estilo arquitectónico que se basa en HTTP para definir cómo interactúan los sistemas. Cuando un microservicio necesita información o funcionalidad de otro, el patrón más común es que actúe como un cliente HTTP y realice una llamada REST al servicio proveedor.

Aquí te va la aclaración:

* **HTTP (Hypertext Transfer Protocol)**: Es el lenguaje que usan los navegadores para hablar con los servidores web, y también el que usan los microservicios entre sí. Define métodos como:
    * `GET`: Para obtener recursos (ej. obtener detalles de un producto).
    * `POST`: Para crear nuevos recursos (ej. crear un nuevo usuario).
    * `PUT`: Para actualizar un recurso existente completamente.
    * `PATCH`: Para actualizar parcialmente un recurso existente.
    * `DELETE`: Para eliminar un recurso.
    * También define códigos de estado (200 OK, 201 Created, 404 Not Found, 500 Internal Server Error) que son cruciales para entender el resultado de una operación.

* **REST (Representational State Transfer)**: Es un conjunto de principios arquitectónicos para diseñar APIs web. Las APIs RESTful tratan todo como "recursos" (ej. un usuario, un producto, un pedido), que se identifican por URLs únicas (URIs). Los servicios interactúan con estos recursos usando los métodos HTTP estándar.

La ventaja de usar REST sobre HTTP para la comunicación entre microservicios es múltiple:
* **Simpleza y familiaridad**: La mayoría de los desarrolladores web están familiarizados con HTTP y REST, lo que facilita la creación y el consumo de estas APIs.
* **Flexibilidad**: Puedes intercambiar fácilmente el lenguaje o framework de un servicio sin afectar a los consumidores, siempre y cuando la interfaz REST (URL, métodos, formato de datos) se mantenga.
* **Escalabilidad**: Al ser un protocolo sin estado (stateless), HTTP facilita el balanceo de carga y la escalabilidad horizontal de los servicios. Cada petición contiene toda la información necesaria, por lo que cualquier instancia del servicio puede manejarla.
* **Herramientas y Ecosistema**: Hay una vasta cantidad de herramientas (clientes HTTP, librerías, proxies, gateways) que soportan HTTP y REST, lo que simplifica su implementación y depuración.

En Spring Boot, la clase `RestTemplate` (aunque ahora se prefiere `WebClient` por ser no-bloqueante) es la herramienta principal para realizar llamadas HTTP salientes, permitiendo que un microservicio actúe como cliente de otro. Esta interacción es fundamental para que la colección de microservicios trabaje en conjunto como una aplicación cohesiva.
''',
    'code_example': r'''
// Ejemplo de un microservicio usando RestTemplate (cliente HTTP) para interactuar con otro microservicio

// 1. Servicio 'ProductService' (el que va a ser llamado)
/*
package com.example.productservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/products")
public class ProductServiceController {

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id) {
        // Simula la obtención de un producto de una base de datos
        if (id == 1L) {
            return new Product(1L, "Laptop", 1200.0);
        } else if (id == 2L) {
            return new Product(2L, "Mouse", 25.0);
        }
        throw new RuntimeException("Producto no encontrado");
    }

    // Clase de modelo simple para el producto
    static class Product {
        public Long id;
        public String name;
        public double price;

        public Product(Long id, String name, double price) {
            this.id = id;
            this.name = name;
            this.price = price;
        }
    }
}
*/

// 2. Servicio 'OrderService' (el que realiza la llamada HTTP REST)
/*
package com.example.orderservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate; // Cliente HTTP para llamadas REST

@RestController
@RequestMapping("/orders")
public class OrderServiceController {

    // Inyecta RestTemplate, que se usa para hacer peticiones HTTP
    @Autowired
    private RestTemplate restTemplate;

    // URL del servicio de productos (asumiendo que corre en localhost:8081)
    private final String PRODUCT_SERVICE_BASE_URL = "http://localhost:8081/products";

    @GetMapping("/create-with-product/{productId}")
    public String createOrderWithProductDetails(@PathVariable Long productId) {
        try {
            // Realiza una llamada GET al servicio de productos para obtener los detalles
            // Usa RestTemplate para enviar una petición HTTP GET a la URL del producto
            // y mapea la respuesta JSON a un objeto Product.
            ProductServiceController.Product product = restTemplate.getForObject(
                PRODUCT_SERVICE_BASE_URL + "/" + productId,
                ProductServiceController.Product.class
            );

            if (product != null) {
                // Aquí iría la lógica para crear el pedido usando los detalles del producto
                return "Pedido creado para el producto: " + product.name + " con precio: " + product.price;
            } else {
                return "No se pudieron obtener los detalles del producto " + productId;
            }
        } catch (Exception e) {
            return "Error al comunicarse con el servicio de productos: " + e.getMessage();
        }
    }
}

// Configuración de RestTemplate en OrderService (en una clase @Configuration)
@Configuration
class RestTemplateConfig {
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
*/

/* Incorrecto (Comunicación directa a la base de datos de otro servicio):
   Un microservicio NO debería acceder directamente a la base de datos de otro microservicio.
   Esto rompe la autonomía y la separación de responsabilidades.
*/
/*
// En OrderService, si intentaras hacer esto (NO HACER):
// @Service
// public class BadOrderService {
//     @Autowired
//     private ProductRepository productRepository; // Accediendo al repo de otro servicio

//     public Order createOrder(Long productId) {
//         // Esto rompe el límite del microservicio de productos
//         Product product = productRepository.findById(productId).orElseThrow();
//         // ... lógica de pedido
//         return new Order(product.getName());
//     }
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Arquitectura de Microservicios',
    'topic': 'Spring Cloud',
    'subtopic': 'Uso de Eureka para descubrimiento de servicios.',
    'definition': '''
En una arquitectura de microservicios, donde tienes muchos servicios pequeños que necesitan comunicarse entre sí, surge un problema: ¿cómo sabe un servicio dónde encontrar a otro? Aquí es donde entra en juego el "descubrimiento de servicios", y Eureka de Spring Cloud es una de las soluciones más populares para esto.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a simplificar la configuración.

Pensemos por un momento en un escenario sin descubrimiento de servicios. Si el Servicio A necesita hablar con el Servicio B, el Servicio A necesitaría saber la IP y el puerto exactos del Servicio B. Pero, ¿qué pasa si el Servicio B se escala y tiene múltiples instancias, o si se reinicia y su IP cambia? Actualizar manualmente esas configuraciones en cada servicio sería una pesadilla.

Eureka resuelve este problema. Actúa como un "servidor de registro" o "servidor de nombres".

Aquí te va la aclaración:

1.  **Servidor Eureka (Eureka Server)**: Es una aplicación Spring Boot que actúe como el centro de registro. Los microservicios se "registran" en él cuando arrancan. El servidor Eureka mantiene una lista actualizada de todos los servicios disponibles, sus ubicaciones (IPs y puertos), y su estado (si están "vivos" o no).
2.  **Cliente Eureka (Eureka Client)**: Cada uno de tus microservicios actúa como un cliente Eureka.
    * **Registro**: Cuando un microservicio se inicia, se registra automáticamente en el servidor Eureka, publicando su información de red.
    * **Descubrimiento**: Cuando un microservicio necesita llamar a otro, en lugar de saber la IP/Puerto directamente, le pregunta al servidor Eureka: "Oye, ¿dónde está el servicio 'ProductService'?" Eureka le devuelve la lista de instancias disponibles de 'ProductService', y el cliente puede elegir una para hacer la llamada.

Las ventajas de usar Eureka son enormes para microservicios:
* **Desacoplamiento**: Los servicios no necesitan conocer las direcciones de los demás de antemano. Solo necesitan saber el nombre lógico del servicio.
* **Elasticidad**: Puedes escalar tus servicios (añadir o quitar instancias) sin necesidad de reconfigurar los servicios que los consumen. Eureka se encarga de actualizar su registro dinámicamente.
* **Resiliencia**: Eureka ayuda con el balanceo de carga básico del lado del cliente (si hay múltiples instancias) y puede ayudar a evitar instancias no disponibles.

Eureka fue desarrollado y utilizado extensivamente por Netflix para gestionar su vasto ecosistema de microservicios, demostrando su capacidad para operar a gran escala. Es una pieza fundamental para la orquestación y la flexibilidad en arquitecturas distribuidas.
''',
    'code_example': r'''
// Ejemplo de uso de Eureka para descubrimiento de servicios en Spring Boot

// 1. Configuración del Servidor Eureka (Eureka Server)
//   Crear un nuevo proyecto Spring Boot con la dependencia 'Eureka Server'
//   Añadir @EnableEurekaServer en la clase principal

/*
package com.example.eurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer; // Habilita el servidor Eureka

@SpringBootApplication
@EnableEurekaServer // Anotación clave para convertir esta app en un servidor Eureka
public class EurekaServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}
*/

//   Configuración en application.yml (para Eureka Server)
/*
server:
  port: 8761 # Puerto por defecto de Eureka Server

eureka:
  instance:
    hostname: localhost
  client:
    register-with-eureka: false # El servidor Eureka no se registra a sí mismo
    fetch-registry: false # No intenta obtener el registro de sí mismo
    service-url:
      defaultZone: http://${eureka.instance.hostname}:${server.port}/eureka/ # URL del servidor Eureka
*/

// 2. Configuración de un Cliente Eureka (Microservicio que se registra y descubre)
//   Añadir la dependencia 'Eureka Discovery Client' en tus microservicios
//   Añadir @EnableDiscoveryClient en la clase principal del microservicio

/*
package com.example.userservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient; // Habilita el cliente Eureka

@SpringBootApplication
@EnableDiscoveryClient // Anotación clave para que el servicio se registre en Eureka
public class UserServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserServiceApplication.class, args);
    }
}
*/

//   Configuración en application.yml (para un Microservicio Cliente como UserService)
/*
spring:
  application:
    name: user-service # Nombre con el que se registrará en Eureka
server:
  port: 8082 # Puerto de este microservicio

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/ # URL del servidor Eureka donde se registrará
  instance:
    prefer-ip-address: true # Opcional: registrar la IP en lugar del hostname
*/

// 3. Cómo un microservicio usa el descubrimiento para llamar a otro
//   Añadir la dependencia 'Spring Cloud OpenFeign' o 'Spring Cloud Netflix Ribbon' (aunque Ribbon está en mantenimiento)
//   o simplemente usar RestTemplate con @LoadBalanced

/*
package com.example.orderservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.loadbalancer.LoadBalanced; // Para balanceo de carga del lado del cliente
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private RestTemplate restTemplate; // RestTemplate configurado con @LoadBalanced

    @GetMapping("/get-user-info/{userId}")
    public String getUserInfo(@PathVariable Long userId) {
        // En lugar de usar una IP:Puerto, usamos el nombre registrado en Eureka
        // Spring Cloud automáticamente resolverá 'user-service' a una instancia disponible
        String user = restTemplate.getForObject("http://user-service/users/" + userId, String.class);
        return "Información del usuario " + userId + " obtenida: " + user;
    }
}

// Configuración para RestTemplate con LoadBalanced en OrderService
// En la clase de configuración de OrderService
// @Configuration
// public class AppConfig {
//     @Bean
//     @LoadBalanced // Esta anotación habilita el balanceo de carga del lado del cliente con Eureka
//     public RestTemplate restTemplate() {
//         return new RestTemplate();
//     }
// }
*/

/* Incorrecto (Hardcoding de IPs/puertos en un entorno de microservicios):
   Si el 'OrderService' llamara a 'UserService' usando una dirección fija como:
   "http://localhost:8082/users/" + userId
   Esto sería incorrecto porque no permite la escalabilidad ni la resiliencia en caso de que el
   'UserService' cambie de dirección o tenga múltiples instancias.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Arquitectura de Microservicios',
    'topic': 'Spring Cloud',
    'subtopic': 'Implementación de Gateway y Config Server.',
    'definition': '''
A medida que tu arquitectura de microservicios crece, la necesidad de gestionar el tráfico de entrada y la configuración de forma centralizada se vuelve crítica. Aquí es donde Spring Cloud Gateway y Spring Cloud Config Server se convierten en herramientas indispensables.

Esto tiene una explicación, y es porque:

1.  **Spring Cloud Gateway**:
    * **¿Qué es?**: Un API Gateway es la puerta de entrada única a tus microservicios desde el mundo exterior (aplicaciones frontend, otras APIs). En lugar de que los clientes conozcan la dirección de cada microservicio individual, todas las peticiones pasan primero por el Gateway.
    * **¿Para qué sirve?**:
        * **Enrutamiento de peticiones**: Redirige las peticiones entrantes al microservicio correcto basándose en reglas configurables (ej. `/users/**` va al `user-service`).
        * **Seguridad**: Puede manejar la autenticación y autorización en el borde, para que los microservicios individuales no tengan que preocuparse tanto por ello.
        * **CORS (Cross-Origin Resource Sharing)**: Gestiona las políticas de CORS de forma centralizada.
        * **Limitación de tasa (Rate Limiting)**: Controla cuántas peticiones puede hacer un cliente en un período de tiempo.
        * **Reescritura de URL, filtros, etc.**: Permite aplicar transformaciones a las peticiones o respuestas.
    * **¿Cómo funciona?**: Se integra con Eureka para descubrir las instancias de los servicios y usa un modelo reactivo (basado en WebFlux) para ser eficiente.

2.  **Spring Cloud Config Server**:
    * **¿Qué es?**: En un entorno de microservicios, cada servicio necesita su propia configuración (conexiones a bases de datos, propiedades de seguridad, etc.). Gestionar estas configuraciones en archivos individuales o dentro del código de cada servicio es inmanejable y propenso a errores. El Config Server proporciona una forma centralizada de gestionar la configuración de todos tus microservicios.
    * **¿Para qué sirve?**:
        * **Centralización**: Almacena la configuración de todos los servicios en un repositorio externo (comúnmente Git, pero también bases de datos, Vault, etc.).
        * **Diferenciación de entornos**: Puedes tener configuraciones diferentes para distintos entornos (desarrollo, pruebas, producción) y perfiles (dev, prod).
        * **Actualizaciones en caliente**: Los microservicios pueden actualizar su configuración en tiempo de ejecución sin necesidad de reiniciar, lo cual es vital para la alta disponibilidad.
    * **¿Cómo funciona?**: Los microservicios arrancan, y en lugar de leer su `application.properties` local, le piden su configuración al Config Server.

Tanto el Gateway como el Config Server son patrones cruciales en la arquitectura de microservicios que simplifican enormemente la gestión, la seguridad y la operabilidad de sistemas distribuidos a gran escala, un modelo que empresas como Pivotal (creadores de Spring) y muchas otras han adoptado para sus productos.
''',
    'code_example': r'''
// Ejemplo de implementación de Gateway y Config Server con Spring Cloud

// 1. Configuración del Servidor de Configuración (Config Server)
//   Crear un nuevo proyecto Spring Boot con la dependencia 'Config Server'
//   Añadir @EnableConfigServer en la clase principal

/*
package com.example.configserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer; // Habilita el Config Server

@SpringBootApplication
@EnableConfigServer // Anotación clave
public class ConfigServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConfigServerApplication.class, args);
    }
}
*/

//   Configuración en application.yml (para Config Server)
/*
server:
  port: 8888 # Puerto por defecto para Config Server

spring:
  cloud:
    config:
      server:
        git:
          uri: https://github.com/tu-usuario/config-repo.git # URL de tu repositorio Git de configuración
          search-paths: config-data # Opcional: subdirectorio dentro del repo
          default-label: main # Rama por defecto
*/

//   Ejemplo de un archivo de configuración en tu repositorio Git (ej. user-service.yml)
/*
# config-data/user-service.yml
user-service:
  message: Hola desde el servicio de usuarios - v1.0
  db-connection: jdbc:mysql://localhost:3306/users_db
*/

// 2. Configuración de un Microservicio Cliente para Config Server
//   Añadir las dependencias 'Config Client' y 'Eureka Discovery Client'
//   Crear un archivo `bootstrap.yml` en el microservicio (antes de application.yml)

/*
// bootstrap.yml (en el microservicio, ej. UserService)
spring:
  application:
    name: user-service # Nombre con el que Config Server buscará su configuración
  cloud:
    config:
      uri: http://localhost:8888 # URL del Config Server
      fail-fast: true # Si no puede conectar al Config Server, falla al iniciar
  config:
    import: "optional:configserver:" # Importa la configuración del Config Server

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/ # Se registra en Eureka
*/

//   En el microservicio (ej. UserService), puedes acceder a las propiedades:
/*
package com.example.userservice.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserServiceController {

    @Value("${user-service.message}") // Inyecta la propiedad del Config Server
    private String message;

    @GetMapping("/hello")
    public String hello() {
        return message;
    }
}
*/

// 3. Configuración de un API Gateway (Spring Cloud Gateway)
//   Crear un nuevo proyecto Spring Boot con la dependencia 'Spring Cloud Gateway' y 'Eureka Discovery Client'
//   Añadir @EnableDiscoveryClient en la clase principal

/*
package com.example.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient // Para que el Gateway descubra los servicios en Eureka
public class GatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }
}
*/

//   Configuración en application.yml (para Gateway)
/*
server:
  port: 8080 # Puerto del Gateway

spring:
  application:
    name: gateway-service
  cloud:
    gateway:
      discovery:
        locator:
          enabled: true # Habilita el Route Locator basado en Eureka
          lower-case-service-id: true # Convierte los IDs de servicio a minúsculas
      routes:
        - id: user_service_route
          uri: lb://user-service # 'lb://' para balanceo de carga con Eureka
          predicates:
            - Path=/users/** # Rutas que empiezan con /users van a user-service
        - id: product_service_route
          uri: lb://product-service
          predicates:
            - Path=/products/** # Rutas que empiezan con /products van a product-service
    config:
      uri: http://localhost:8888 # El Gateway también puede obtener su configuración del Config Server

eureka:
  client:
    service-url:
      defaultZone: http://localhost:8761/eureka/ # Se registra en Eureka
*/

/* Incorrecto:
   Gestionar la configuración de cada microservicio de forma individual,
   sin un Config Server, y sin un Gateway, dejando a los clientes acceder
   directamente a la dirección de cada microservicio.
*/
/*
// En el cliente (frontend, o postman):
// Acceso directo a cada microservicio:
// GET http://localhost:8082/users/1
// GET http://localhost:8083/products/1
// Esto dificulta la gestión de URLs, seguridad y balanceo de carga.
*/
'''
  });
}

Future<void> insertSpringbootMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Comunicación Asíncrona',
    'topic': 'Mensajería con RabbitMQ y Kafka',
    'subtopic': 'Integración de sistemas de mensajería.',
    'definition': '''
En arquitecturas de microservicios, la comunicación síncrona (como las llamadas REST HTTP) puede volverse un cuello de botella o un punto único de fallo. Aquí es donde los sistemas de mensajería asíncrona, como RabbitMQ y Apache Kafka, brillan, permitiendo que los servicios se comuniquen de manera más robusta y escalable.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a la hora de hacer nuestras aplicaciones más robustas.

Pensemos por un momento en un sistema donde un servicio de pedidos necesita informar a varios otros servicios (facturación, inventario, envío) que se ha creado un nuevo pedido. Si usa llamadas HTTP directas, el servicio de pedidos tendría que esperar la respuesta de cada uno, y si alguno falla, todo el proceso podría detenerse.

Aquí te va la aclaración de cómo la integración de sistemas de mensajería resuelve esto:

* **¿Qué son?** Son brokers de mensajes, una especie de "intermediarios" que facilitan la comunicación entre diferentes partes de una aplicación. Los servicios no se hablan directamente entre sí, sino que se comunican a través del broker.
* **Modelo Publicador/Suscriptor**:
    * Un servicio (el "publicador" o "productor") envía un mensaje a un "topic" o "cola" en el broker.
    * Otros servicios (los "suscriptores" o "consumidores") que estén interesados en ese tipo de mensaje, escuchan ese topic o cola y procesan el mensaje cuando llega.
* **Desacoplamiento**: El publicador no necesita saber quiénes son o dónde están los consumidores, y viceversa. Solo necesitan saber cómo hablar con el broker de mensajes. Esto reduce la dependencia entre servicios.
* **Resiliencia**: Si un consumidor está inactivo, el mensaje se queda en la cola/topic del broker hasta que el consumidor esté listo para procesarlo. El publicador no se ve afectado y puede seguir enviando mensajes. Esto significa que tu sistema es más tolerante a fallos temporales.
* **Escalabilidad**: Puedes añadir más instancias de consumidores para procesar mensajes en paralelo, sin cambiar la lógica del publicador.
* **Flexibilidad**: Puedes añadir nuevos consumidores interesados en los mismos mensajes sin modificar a los publicadores existentes.

**RabbitMQ vs. Kafka**:
* **RabbitMQ**: Es un broker de mensajes tradicional, que implementa el protocolo AMQP (Advanced Message Queuing Protocol). Es ideal para escenarios donde necesitas garantía de entrega de mensajes uno a uno y confirmaciones de procesamiento (ej. un pedido, una notificación). Piensa en él como una lista de tareas que se completan y se borran.
* **Apache Kafka**: Es una plataforma de streaming de eventos distribuida. Está diseñado para manejar grandes volúmenes de datos en tiempo real y persistir los mensajes durante un período de tiempo configurable. Es ideal para escenarios de "flujo de datos" donde múltiples consumidores pueden leer los mismos mensajes (ej. logs, eventos de click, datos de sensores). Piensa en él como un registro inmutable de todo lo que ha sucedido.

Integrar estos sistemas con Spring Boot es bastante directo gracias a Spring AMQP para RabbitMQ y Spring for Apache Kafka, que proporcionan abstracciones de alto nivel para interactuar con los brokers, haciendo que la mensajería asíncrona sea mucho más accesible. Grandes empresas como LinkedIn (creadores de Kafka) y muchas otras utilizan intensivamente estos sistemas para construir arquitecturas robustas y altamente escalables.
''',
    'code_example': r'''
// Ejemplo conceptual de integración de sistemas de mensajería con Spring Boot

// 1. Dependencias en pom.xml (Maven)
// Para RabbitMQ:
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-amqp</artifactId>
</dependency>
*/
// Para Kafka:
/*
<dependency>
    <groupId>org.springframework.kafka</groupId>
    <artifactId>spring-kafka</artifactId>
</dependency>
*/

// 2. Configuración para RabbitMQ en application.yml (ejemplo)
/*
spring:
  rabbitmq:
    host: localhost
    port: 5672
    username: guest
    password: guest
*/

// 3. Configuración para Kafka en application.yml (ejemplo)
/*
spring:
  kafka:
    bootstrap-servers: localhost:9092 # Dirección de tu broker Kafka
    producer:
      key-serializer: org.apache.kafka.common.serialization.StringSerializer
      value-serializer: org.springframework.kafka.support.serializer.JsonSerializer
    consumer:
      group-id: my-group
      key-deserializer: org.apache.kafka.common.serialization.StringDeserializer
      value-deserializer: org.springframework.kafka.support.serializer.JsonDeserializer
      auto-offset-reset: earliest
      properties:
        spring.json.trusted.packages: "*" # Para deserializar JSON de forma segura
*/

// 4. Ejemplo de un "publicador" (productor) de mensajes con RabbitMQ
/*
package com.example.rabbitmqdemo.publisher;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
public class MessagePublisher {

    private final RabbitTemplate rabbitTemplate; // Bean inyectado por Spring AMQP

    public MessagePublisher(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void sendMessage(String exchange, String routingKey, String message) {
        System.out.println("Publicando mensaje: '" + message + "' a exchange: '" + exchange + "' con routingKey: '" + routingKey + "'");
        rabbitTemplate.convertAndSend(exchange, routingKey, message);
    }
}

// Configuración de RabbitMQ (Exchange y Queue) en una clase @Configuration
// @Configuration
// public class RabbitMQConfig {
//     @Bean
//     public TopicExchange topicExchange() {
//         return new TopicExchange("my-exchange"); // Define un exchange de tipo topic
//     }
//
//     @Bean
//     public Queue myQueue() {
//         return new Queue("my-queue", false); // Define una cola
//     }
//
//     @Bean
//     public Binding binding(Queue myQueue, TopicExchange topicExchange) {
//         return BindingBuilder.bind(myQueue).to(topicExchange).with("my.routing.key"); // Asocia cola con exchange
//     }
// }
*/

// 5. Ejemplo de un "consumidor" de mensajes con RabbitMQ
/*
package com.example.rabbitmqdemo.consumer;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class MessageConsumer {

    @RabbitListener(queues = "my-queue") // Escucha mensajes en la cola "my-queue"
    public void receiveMessage(String message) {
        System.out.println("Mensaje recibido de RabbitMQ: '" + message + "'");
        // Aquí iría la lógica de negocio para procesar el mensaje
    }
}
*/

// 6. Ejemplo de un "productor" de mensajes con Kafka
/*
package com.example.kafkapublisher.producer;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaMessageProducer {

    private final KafkaTemplate<String, String> kafkaTemplate; // Bean inyectado por Spring Kafka

    public KafkaMessageProducer(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void sendMessage(String topic, String key, String message) {
        System.out.println("Enviando mensaje: '" + message + "' a topic: '" + topic + "' con clave: '" + key + "'");
        kafkaTemplate.send(topic, key, message);
    }
}
*/

// 7. Ejemplo de un "consumidor" de mensajes con Kafka
/*
package com.example.kafkaconsumer.consumer;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageConsumer {

    @KafkaListener(topics = "my-topic", groupId = "my-group") // Escucha en el topic "my-topic"
    public void listen(String message) {
        System.out.println("Mensaje recibido de Kafka: '" + message + "'");
        // Lógica de negocio para procesar el mensaje
    }
}
*/

/* Incorrecto (Acoplamiento directo entre servicios sin un broker de mensajes):
   Un servicio que llama directamente a otro servicio para una tarea que podría ser asíncrona,
   creando dependencias síncronas innecesarias y reduciendo la resiliencia.
*/
/*
// En un OrderService, en lugar de usar un broker de mensajes para notificar:
// @Service
// public class BadOrderService {
//     @Autowired
//     private BillingService billingService; // Dependencia directa

//     public void processOrder() {
//         // ...
//         billingService.generateInvoice(order); // Llamada síncrona
//         // Si billingService cae, processOrder falla
//     }
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Comunicación Asíncrona',
    'topic': 'Mensajería con RabbitMQ y Kafka',
    'subtopic': 'Publicación y consumo de mensajes.',
    'definition': '''
Entender cómo publicar (enviar) y consumir (recibir) mensajes es el corazón de la comunicación asíncrona. Si bien la integración de sistemas de mensajería configura la infraestructura, estas operaciones son las que realmente hacen que tus microservicios interactúen de manera desacoplada y robusta.

No sé tú, pero a mí esto al principio me costó un poco entender cómo funcionaba el concepto de 'topics' y 'queues' y la diferencia práctica.

Aquí te va la aclaración:

**Publicación de Mensajes (Producción)**:
* Un "productor" (tu microservicio) crea un mensaje que contiene datos o un evento (ej. "usuario_registrado", "pedido_creado", "stock_actualizado").
* Este mensaje se envía a un "broker de mensajes" (RabbitMQ, Kafka).
* El productor no se preocupa por quién va a recibir el mensaje, ni si el receptor está disponible en ese momento. Simplemente lo envía y se olvida.
* **En Spring Boot**: Usarás clases como `RabbitTemplate` para RabbitMQ o `KafkaTemplate` para Kafka. Estas clases abstractas simplifican el proceso de enviar el mensaje al broker, mapeando tus objetos Java a un formato adecuado (como JSON) para la transmisión.

**Consumo de Mensajes (Consumo)**:
* Un "consumidor" (otro de tus microservicios) está interesado en recibir mensajes de un tipo específico (ej. "eventos de pedidos").
* El consumidor se "suscribe" a una "cola" (en RabbitMQ) o a un "topic" (en Kafka) en el broker de mensajes.
* Cuando un mensaje llega a esa cola/topic, el broker lo entrega al consumidor. El consumidor lo procesa, realiza su lógica de negocio (ej. envía un email de confirmación, actualiza el inventario) y, en muchos casos, envía una confirmación de que el mensaje fue procesado correctamente.
* **En Spring Boot**: Usarás anotaciones como `@RabbitListener` para RabbitMQ o `@KafkaListener` para Kafka. Estas anotaciones transforman métodos normales en "oyentes" de mensajes, que Spring ejecuta automáticamente cuando llega un mensaje al topic/cola configurado.

**Diferencias clave en el comportamiento de colas vs. topics:**

* **Colas (RabbitMQ)**: Los mensajes suelen ser entregados a un solo consumidor. Si tienes múltiples consumidores de la misma cola, se reparten la carga (load balancing). Una vez que un mensaje es consumido y confirmado, se elimina de la cola. Es un modelo de "tarea a completar".
* **Topics (Kafka)**: Los mensajes son persistidos y pueden ser leídos por múltiples "grupos de consumidores" de forma independiente. Cada grupo de consumidores recibe una copia completa de los mensajes del topic. Un mensaje no se "elimina" del topic inmediatamente, sino que permanece durante un tiempo configurable. Es un modelo de "flujo de datos" o "registro de eventos". Esto permite que diferentes servicios "reproduzcan" el historial de eventos si es necesario.

La publicación y el consumo de mensajes son los bloques de construcción para sistemas reactivos y resilientes. Permiten que los servicios sean más independientes y flexibles, mejorando la escalabilidad y la capacidad de recuperación de tu aplicación, algo crucial para empresas que buscan agilizar sus operaciones.
''',
    'code_example': r'''
// Ejemplos detallados de publicación y consumo de mensajes con RabbitMQ y Kafka en Spring Boot

// Para estos ejemplos, asume que las dependencias y la configuración de `application.yml`
// (vistas en el subtema anterior) ya están configuradas.

// --- Parte 1: RabbitMQ (Publicación y Consumo) ---

// Modelo de mensaje (DTO)
/*
package com.example.rabbitmqdemo.model;

public class OrderEvent {
    private String orderId;
    private String productCode;
    private int quantity;
    private String status;

    // Constructor, Getters y Setters
    public OrderEvent() {}
    public OrderEvent(String orderId, String productCode, int quantity, String status) {
        this.orderId = orderId;
        this.productCode = productCode;
        this.quantity = quantity;
        this.status = status;
    }
    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }
    public String getProductCode() { return productCode; }
    public void setProductCode(String productCode) { this.productCode = productCode; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return "OrderEvent{" +
               "orderId='" + orderId + '\'' +
               ", productCode='" + productCode + '\'' +
               ", quantity=" + quantity +
               ", status='" + status + '\'' +
               '}';
    }
}
*/

// Publicador de RabbitMQ (servicio de "Pedidos")
/*
package com.example.rabbitmqdemo.publisher;

import com.example.rabbitmqdemo.model.OrderEvent;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
public class OrderPublisher {

    private final RabbitTemplate rabbitTemplate;
    private static final String EXCHANGE_NAME = "order.exchange"; // Un exchange de RabbitMQ
    private static final String ROUTING_KEY = "order.created"; // Una routing key

    public OrderPublisher(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void publishOrderCreated(OrderEvent orderEvent) {
        System.out.println("Publicando evento de orden creada: " + orderEvent);
        // convertAndSend serializa el objeto OrderEvent a JSON por defecto (si Jackson está en classpath)
        rabbitTemplate.convertAndSend(EXCHANGE_NAME, ROUTING_KEY, orderEvent);
    }
}

// Configuración de RabbitMQ para el publicador
// (En una clase @Configuration, ej. RabbitMQConfig.java)
// @Configuration
// public class RabbitMQConfig {
//
//     @Bean
//     public TopicExchange orderExchange() {
//         return new TopicExchange(OrderPublisher.EXCHANGE_NAME);
//     }
//
//     @Bean
//     public Queue emailQueue() {
//         return new Queue("email.queue", false); // Cola para el servicio de emails
//     }
//
//     @Bean
//     public Queue inventoryQueue() {
//         return new Queue("inventory.queue", false); // Cola para el servicio de inventario
//     }
//
//     @Bean
//     public Binding emailBinding(Queue emailQueue, TopicExchange orderExchange) {
//         return BindingBuilder.bind(emailQueue).to(orderExchange).with(OrderPublisher.ROUTING_KEY);
//     }
//
//     @Bean
//     public Binding inventoryBinding(Queue inventoryQueue, TopicExchange orderExchange) {
//         return BindingBuilder.bind(inventoryQueue).to(orderExchange).with(OrderPublisher.ROUTING_KEY);
//     }
//
//     // Opcional: configurar un MessageConverter para serialización/deserialización
//     @Bean
//     public MessageConverter jsonMessageConverter() {
//         return new Jackson2JsonMessageConverter();
//     }
//     @Bean
//     public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
//         RabbitTemplate template = new RabbitTemplate(connectionFactory);
//         template.setMessageConverter(jsonMessageConverter());
//         return template;
//     }
// }
*/

// Consumidor de RabbitMQ (servicio de "Email")
/*
package com.example.rabbitmqdemo.consumer;

import com.example.rabbitmqdemo.model.OrderEvent;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class EmailServiceConsumer {

    @RabbitListener(queues = "email.queue") // Escucha la cola 'email.queue'
    public void handleOrderCreatedEventForEmail(OrderEvent event) {
        System.out.println("Servicio de Email - Recibido OrderEvent: " + event);
        // Lógica para enviar un email de confirmación
        System.out.println("Enviando email para el pedido: " + event.getOrderId());
    }
}
*/

// Consumidor de RabbitMQ (servicio de "Inventario")
/*
package com.example.rabbitmqdemo.consumer;

import com.example.rabbitmqdemo.model.OrderEvent;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class InventoryServiceConsumer {

    @RabbitListener(queues = "inventory.queue") // Escucha la cola 'inventory.queue'
    public void handleOrderCreatedEventForInventory(OrderEvent event) {
        System.out.println("Servicio de Inventario - Recibido OrderEvent: " + event);
        // Lógica para decrementar el inventario del producto
        System.out.println("Decrementando stock para el producto: " + event.getProductCode() + ", cantidad: " + event.getQuantity());
    }
}
*/

// --- Parte 2: Kafka (Publicación y Consumo) ---

// Modelo de mensaje (DTO), puede ser el mismo o uno diferente
/*
package com.example.kafkapublisher.model;

public class UserRegisteredEvent {
    private String userId;
    private String username;
    private String timestamp;

    public UserRegisteredEvent() {}
    public UserRegisteredEvent(String userId, String username, String timestamp) {
        this.userId = userId;
        this.username = username;
        this.timestamp = timestamp;
    }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getTimestamp() { return timestamp; }
    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }

    @Override
    public String toString() {
        return "UserRegisteredEvent{" +
               "userId='" + userId + '\'' +
               ", username='" + username + '\'' +
               ", timestamp='" + timestamp + '\'' +
               '}';
    }
}
*/

// Productor de Kafka (servicio de "Usuarios")
/*
package com.example.kafkapublisher.producer;

import com.example.kafkapublisher.model.UserRegisteredEvent;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserEventProducer {

    private final KafkaTemplate<String, UserRegisteredEvent> kafkaTemplate;
    private static final String TOPIC_NAME = "user-events";

    public UserEventProducer(KafkaTemplate<String, UserRegisteredEvent> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void publishUserRegistered(UserRegisteredEvent event) {
        System.out.println("Publicando evento de usuario registrado: " + event);
        // La clave (key) se usa para garantizar el orden dentro de una partición (útil para eventos del mismo usuario)
        kafkaTemplate.send(TOPIC_NAME, event.getUserId(), event);
    }
}
*/

// Consumidor de Kafka (servicio de "Notificaciones")
/*
package com.example.kafkaconsumer.consumer;

import com.example.kafkapublisher.model.UserRegisteredEvent; // Usa el mismo DTO
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class NotificationServiceConsumer {

    @KafkaListener(topics = "user-events", groupId = "notification-group") // Un grupo de consumidores
    public void listenUserRegisteredForNotifications(UserRegisteredEvent event) {
        System.out.println("Servicio de Notificaciones - Recibido UserRegisteredEvent: " + event);
        // Lógica para enviar una notificación de bienvenida al nuevo usuario
        System.out.println("Enviando notificación de bienvenida a: " + event.getUsername());
    }
}
*/

// Consumidor de Kafka (servicio de "Analytics")
/*
package com.example.kafkaconsumer.consumer;

import com.example.kafkapublisher.model.UserRegisteredEvent; // Usa el mismo DTO
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class AnalyticsServiceConsumer {

    @KafkaListener(topics = "user-events", groupId = "analytics-group") // OTRO grupo de consumidores
    public void listenUserRegisteredForAnalytics(UserRegisteredEvent event) {
        System.out.println("Servicio de Analytics - Recibido UserRegisteredEvent: " + event);
        // Lógica para registrar el evento en un sistema de analíticas
        System.out.println("Registrando evento de registro de usuario para analíticas: " + event.getUserId());
    }
}
*/

/* Incorrecto (Manejo manual de la serialización/deserialización o la gestión de conexiones):
   Intentar enviar o recibir mensajes como cadenas de texto crudas sin un convertidor
   o gestionar las conexiones a los brokers manualmente en cada servicio.
*/
/*
// En el productor, si no usaras convertAndSend o KafkaTemplate:
// rabbitTemplate.send("my-exchange", "order.created", new Message("{}".getBytes(), new MessageProperties()));
// Esto sería más complejo y propenso a errores.

// En el consumidor, si tuvieras que deserializar manualmente:
// @RabbitListener(queues = "my-queue")
// public void receiveRawMessage(Message message) {
//     String json = new String(message.getBody());
//     // Deserializar JSON manualmente a OrderEvent
// }
// Spring Boot y sus integraciones hacen esto por ti de forma automática.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Comunicación Asíncrona',
    'topic': 'Eventos y Procesamiento Asíncrono',
    'subtopic': 'Uso de @Async y @EventListener.',
    'definition': '''
En el desarrollo de aplicaciones, a menudo te encuentras con tareas que pueden llevar tiempo (como enviar un correo electrónico, procesar un archivo grande o realizar una llamada a una API externa). Si estas tareas se ejecutan en el hilo principal de la aplicación, pueden bloquear la respuesta al usuario, lo que lleva a una mala experiencia. Aquí es donde entra en juego el procesamiento asíncrono con `@Async` y `@EventListener` en Spring Boot.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a mejorar la experiencia de usuario.

Pensemos por un momento en un escenario donde un usuario se registra en tu aplicación. Después de guardar sus datos, necesitas enviarle un correo de bienvenida. Si el envío del correo tarda 2 segundos y lo haces de forma síncrona, el usuario tendrá que esperar 2 segundos más para ver el mensaje de "registro exitoso".

Aquí te va la aclaración:

1.  **`@Async`**:
    * **Propósito**: Esta anotación le dice a Spring que el método anotado debe ejecutarse en un hilo separado, no en el hilo que lo llamó. Es decir, el método que llama a un método `@Async` no espera a que este termine; continúa su ejecución inmediatamente.
    * **Uso**: La pones directamente sobre un método en un componente Spring (como un `@Service`). Para que `@Async` funcione, debes habilitar la capacidad de ejecución asíncrona en tu aplicación Spring Boot, generalmente con la anotación `@EnableAsync` en una clase de configuración.
    * **Ventajas**:
        * **No bloquea**: Libera el hilo principal (ej. el hilo de la petición HTTP) para que pueda responder rápidamente al cliente.
        * **Mejora la UX**: La aplicación se siente más rápida y reactiva para el usuario final.
        * **Paralelización**: Permite que múltiples tareas se ejecuten concurrentemente.

2.  **`@EventListener`**:
    * **Propósito**: Esta anotación te permite crear métodos que reaccionan a eventos específicos publicados dentro de tu aplicación Spring. Es un patrón de diseño "observador" o "publicador-suscriptor" implementado directamente en Spring.
    * **Uso**: Lo aplicas sobre un método en cualquier componente Spring. El método tomará como argumento el tipo de evento que desea escuchar. Cuando ese tipo de evento es publicado por el `ApplicationEventPublisher` de Spring, tu método `@EventListener` se ejecutará.
    * **Ventajas**:
        * **Desacoplamiento**: El publicador de un evento no necesita saber nada sobre los consumidores. Solo publica el evento. Los oyentes pueden ser añadidos o eliminados sin afectar al publicador.
        * **Modularidad**: Ayuda a mantener las responsabilidades claras; un servicio se encarga de su tarea principal y publica eventos para que otros servicios reaccionen a ellos.
        * **Procesamiento Asíncrono**: Puedes combinar `@EventListener` con `@Async` para que el manejo del evento ocurra en un hilo separado, evitando bloqueos.

Ambas anotaciones son herramientas poderosas para mejorar la reactividad y el rendimiento de tus aplicaciones Spring Boot, especialmente cuando tienes tareas que no necesitan ser ejecutadas en tiempo real o que son propensas a ser lentas.
''',
    'code_example': r'''
// Ejemplo de uso de @Async y @EventListener en Spring Boot

// 1. Habilitar el soporte asíncrono y de eventos
// En tu clase principal o una clase de configuración:
/*
package com.example.asynceventdemo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync; // Habilita @Async

@Configuration
@EnableAsync // Activa la capacidad de Spring para ejecutar métodos asíncronos
public class AsyncConfig {
    // Puedes configurar un ThreadPoolTaskExecutor personalizado aquí si necesitas
    // controlar el pool de hilos para @Async
}
*/

// 2. Un Servicio con un método @Async (ej. para enviar emails)
/*
package com.example.asynceventdemo.service;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Async // Este método se ejecutará en un hilo separado
    public void sendWelcomeEmail(String userEmail) {
        System.out.println("DEBUG: Iniciando envío de email de bienvenida a: " + userEmail + " en hilo: " + Thread.currentThread().getName());
        try {
            Thread.sleep(3000); // Simula un trabajo pesado (ej. llamada a un servicio de email)
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        System.out.println("DEBUG: Email de bienvenida enviado a: " + userEmail + " en hilo: " + Thread.currentThread().getName());
    }

    @Async
    public void sendNotification(String to, String subject, String body) {
        System.out.println("DEBUG: Iniciando envío de notificación a: " + to + " en hilo: " + Thread.currentThread().getName());
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        System.out.println("DEBUG: Notificación enviada a: " + to + " en hilo: " + Thread.currentThread().getName());
    }
}
*/

// 3. Un Evento personalizado
/*
package com.example.asynceventdemo.event;

import org.springframework.context.ApplicationEvent;

// Un evento simple que lleva información del usuario
public class UserRegisteredEvent extends ApplicationEvent {
    private String username;
    private String email;

    public UserRegisteredEvent(Object source, String username, String email) {
        super(source); // 'source' es el objeto que originó el evento (puede ser 'this')
        this.username = username;
        this.email = email;
    }

    public String getUsername() { return username; }
    public String getEmail() { return email; }

    @Override
    public String toString() {
        return "UserRegisteredEvent{" +
               "username='" + username + '\'' +
               ", email='" + email + '\'' +
               '}';
    }
}
*/

// 4. Un Publicador de eventos (ej. en un servicio de registro de usuarios)
/*
package com.example.asynceventdemo.service;

import com.example.asynceventdemo.event.UserRegisteredEvent;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final ApplicationEventPublisher eventPublisher;

    public UserService(ApplicationEventPublisher eventPublisher) {
        this.eventPublisher = eventPublisher;
    }

    public String registerUser(String username, String email) {
        // Lógica para guardar el usuario en la base de datos
        System.out.println("DEBUG: Registrando usuario: " + username);

        // Publicar el evento después de registrar el usuario
        // El evento se publica en el hilo actual por defecto
        eventPublisher.publishEvent(new UserRegisteredEvent(this, username, email));

        return "Usuario " + username + " registrado con éxito.";
    }
}
*/

// 5. Oyentes de eventos con @EventListener (uno síncrono, otro asíncrono)
/*
package com.example.asynceventdemo.listener;

import com.example.asynceventdemo.event.UserRegisteredEvent;
import com.example.asynceventdemo.service.EmailService;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class UserEventListener {

    private final EmailService emailService;

    public UserEventListener(EmailService emailService) {
        this.emailService = emailService;
    }

    // Este listener se ejecuta síncronamente en el mismo hilo que publicó el evento
    @EventListener
    public void handleUserRegistrationSync(UserRegisteredEvent event) {
        System.out.println("DEBUG: Listener SÍNCRONO - Procesando evento de registro para: " + event.getUsername() + " en hilo: " + Thread.currentThread().getName());
        // Lógica ligera que no bloquea
        System.out.println("DEBUG: Verificando políticas para: " + event.getUsername());
    }

    // Este listener se ejecuta asíncronamente en un hilo separado debido a @Async
    @EventListener
    @Async // Este método se ejecutará en un hilo diferente al que publicó el evento
    public void handleUserRegistrationAsync(UserRegisteredEvent event) {
        System.out.println("DEBUG: Listener ASÍNCRONO - Procesando evento de registro para: " + event.getUsername() + " en hilo: " + Thread.currentThread().getName());
        // Delegar la tarea pesada al EmailService (que también es @Async)
        emailService.sendWelcomeEmail(event.getEmail());
        System.out.println("DEBUG: Listener ASÍNCRONO - Terminado de procesar evento para: " + event.getUsername());
    }
}
*/

// 6. Un Controlador para probar
/*
package com.example.asynceventdemo.controller;

import com.example.asynceventdemo.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public String register(@RequestParam String username, @RequestParam String email) {
        // La llamada a registerUser regresará de inmediato, mientras el email se envía en segundo plano
        String response = userService.registerUser(username, email);
        return response + " (El email de bienvenida se está enviando en segundo plano).";
    }
}
*/

/* Incorrecto (Bloquear el hilo principal con tareas pesadas o acoplamiento fuerte):
   Realizar operaciones de I/O o cálculos intensivos directamente en el hilo de la petición HTTP,
   o hacer que los servicios se llamen directamente para notificaciones en lugar de eventos.
*/
/*
// Si UserService llamara directamente a EmailService de forma síncrona:
// @Service
// public class BadUserService {
//     @Autowired
//     private EmailService emailService;

//     public String registerUser(String username, String email) {
//         // ... guardar usuario
//         emailService.sendWelcomeEmail(email); // Esto bloquearía hasta que el email se envíe
//         return "Usuario registrado.";
//     }
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Comunicación Asíncrona',
    'topic': 'Eventos y Procesamiento Asíncrono',
    'subtopic': 'Manejo de tareas en segundo plano.',
    'definition': '''
El manejo de tareas en segundo plano es un concepto fundamental cuando hablamos de aplicaciones que necesitan ser reactivas y eficientes. No todas las operaciones tienen que ejecutarse en el momento exacto en que un usuario las solicita. Algunas pueden diferirse para más tarde o ejecutarse en paralelo para no bloquear la experiencia del usuario.

Esto tiene una explicación, y es porque las aplicaciones modernas necesitan ser "no bloqueantes" para proporcionar una experiencia de usuario fluida.

Pensemos por un momento en las operaciones que se ejecutan en segundo plano:

* **¿Qué son?**: Son procesos o tareas que se ejecutan de forma independiente del flujo principal de ejecución de tu aplicación. Esto significa que la solicitud original que desencadenó la tarea puede completarse y responder al usuario mientras la tarea en segundo plano sigue trabajando.
* **¿Por qué son importantes?**:
    * **Mejora de la capacidad de respuesta**: El usuario no tiene que esperar a que se completen todas las operaciones secundarias. Por ejemplo, en una tienda online, el usuario puede recibir una confirmación de su pedido inmediatamente, mientras que el envío de emails de confirmación y la actualización del inventario se hacen en segundo plano.
    * **Optimización de recursos**: Permite que las tareas pesadas o de larga duración no monopolicen los recursos de la aplicación principal.
    * **Resiliencia**: Si una tarea en segundo plano falla, no necesariamente afecta la operación principal o la experiencia del usuario. Además, se pueden implementar mecanismos de reintento para estas tareas.
    * **Escalabilidad**: Las tareas en segundo plano a menudo pueden ser distribuidas y ejecutadas por diferentes trabajadores o servicios, lo que facilita escalar la aplicación.

**Formas comunes de manejar tareas en segundo plano en Spring Boot**:

1.  **Hilos explícitos (Thread)**: Aunque posible, manejar hilos directamente puede ser complejo y propenso a errores (problemas de concurrencia, gestión de recursos). Spring ofrece abstracciones que lo hacen más fácil.
2.  **`@Async` (como vimos antes)**: Para métodos individuales que deben ejecutarse en un pool de hilos separado. Es ideal para tareas rápidas que no necesitan una gran durabilidad.
3.  **Tareas programadas (`@Scheduled`)**: Para ejecutar tareas repetitivas a intervalos fijos, o en momentos específicos (ej. un cron job para generar reportes diarios). Spring Boot tiene un excelente soporte para esto.
4.  **Colas de mensajes (RabbitMQ, Kafka)**: Para tareas que necesitan ser procesadas de forma asíncrona por otros servicios o en momentos diferentes. Los mensajes actúan como un "buffer" entre el productor y el consumidor. Son ideales para comunicación entre microservicios o para garantizar la entrega de tareas.
5.  **Frameworks de procesamiento de trabajos (Job Processing Frameworks)**: Para tareas más complejas que requieren persistencia, reintentos, monitoreo y gestión de errores, puedes usar frameworks como Spring Batch o plataformas externas como Apache Airflow.

El manejo efectivo de tareas en segundo plano es una de las características que distinguen a las aplicaciones modernas y eficientes de las que son lentas y bloqueantes. Permite construir sistemas más robustos, escalables y con una mejor experiencia de usuario, un principio que empresas con alta concurrencia como redes sociales o plataformas de comercio electrónico aplican constantemente.
''',
    'code_example': r'''
// Ejemplo de manejo de tareas en segundo plano en Spring Boot

// 1. Uso de @Async (ya visto, pero aquí con un ejemplo más concreto)
// Asegúrate de que @EnableAsync está en tu configuración.

/*
package com.example.backgroundtasks.service;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import java.util.concurrent.CompletableFuture; // Para resultados asíncronos

@Service
public class ComplexCalculationService {

    @Async
    public CompletableFuture<Long> performLongCalculation(int input) {
        System.out.println("DEBUG: Iniciando cálculo pesado para " + input + " en hilo: " + Thread.currentThread().getName());
        try {
            Thread.sleep(5000); // Simula un cálculo que tarda 5 segundos
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        long result = (long) input * input * 12345;
        System.out.println("DEBUG: Cálculo pesado terminado para " + input + ", resultado: " + result + " en hilo: " + Thread.currentThread().getName());
        return CompletableFuture.completedFuture(result); // Envuelve el resultado en CompletableFuture
    }
}
*/

// 2. Uso de Tareas Programadas con @Scheduled
//    Añadir @EnableScheduling en tu clase principal o una clase de configuración

/*
package com.example.backgroundtasks.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling; // Habilita las tareas programadas

@Configuration
@EnableScheduling // Activa la capacidad de Spring para ejecutar tareas programadas
public class SchedulingConfig {
    // Puedes configurar un TaskScheduler personalizado si necesitas
    // controlar el pool de hilos para @Scheduled
}
*/

/*
package com.example.backgroundtasks.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;

@Component
public class ReportScheduler {

    // Ejecuta este método cada 10 segundos después de la finalización de la ejecución anterior
    @Scheduled(fixedDelay = 10000)
    public void generateDailyReport() {
        System.out.println("DEBUG: Generando reporte diario a las: " + LocalDateTime.now() + " en hilo: " + Thread.currentThread().getName());
        // Lógica para generar y guardar un reporte
        try {
            Thread.sleep(2000); // Simula el tiempo de generación del reporte
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        System.out.println("DEBUG: Reporte diario generado.");
    }

    // Ejecuta este método cada minuto, empezando 5 segundos después del inicio de la aplicación
    @Scheduled(initialDelay = 5000, fixedRate = 60000)
    public void cleanTempFiles() {
        System.out.println("DEBUG: Limpiando archivos temporales a las: " + LocalDateTime.now() + " en hilo: " + Thread.currentThread().getName());
        // Lógica para limpiar directorios temporales
        System.out.println("DEBUG: Archivos temporales limpiados.");
    }

    // Ejecuta este método a una hora específica usando una expresión cron
    // (Ejemplo: cada día a las 2 AM)
    // cron = "0 0 2 * * ?"
    // cron = "segundo minuto hora díaDelMes mes díaDeLaSemana"
    @Scheduled(cron = "0 0 2 * * ?") // Cada día a las 2 AM
    public void performNightlyBackup() {
        System.out.println("DEBUG: Realizando backup nocturno a las: " + LocalDateTime.now() + " en hilo: " + Thread.currentThread().getName());
        // Lógica para hacer backup de la base de datos o archivos
        System.out.println("DEBUG: Backup nocturno completado.");
    }
}
*/

// 3. Un Controlador para activar tareas asíncronas
/*
package com.example.backgroundtasks.controller;

import com.example.backgroundtasks.service.ComplexCalculationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

@RestController
public class TaskController {

    @Autowired
    private ComplexCalculationService calculationService;

    @GetMapping("/start-calculation")
    public String startCalculation(@RequestParam int number) {
        System.out.println("DEBUG: Petición recibida para iniciar cálculo para " + number + " en hilo: " + Thread.currentThread().getName());
        // Llamada asíncrona. La petición HTTP no esperará por el resultado del cálculo.
        CompletableFuture<Long> futureResult = calculationService.performLongCalculation(number);

        // Puedes hacer algo más aquí mientras el cálculo se ejecuta en segundo plano.

        // Si necesitas el resultado más tarde (ej. en otro endpoint o para una notificación push)
        // Puedes esperar por él, pero esto bloqueará el hilo actual si se hace aquí.
        // long result = futureResult.get(); // ¡NO HACER ESTO EN EL HILO DE LA PETICIÓN!
        return "Cálculo para " + number + " iniciado en segundo plano. Puedes consultar el estado o esperar la notificación.";
    }

    // Un endpoint para obtener el resultado si la tarea asíncrona ya completó
    // Esto es un ejemplo, en un escenario real, el resultado se guardaría o se notificaría.
    @GetMapping("/get-calculation-result")
    public String getCalculationResult() {
        // En un escenario real, necesitarías una forma de mapear un ID de tarea al CompletableFuture
        // Este es solo un ejemplo conceptual muy simplificado.
        return "Para obtener el resultado, necesitas una lógica que persista el estado de la tarea asíncrona.";
    }
}
*/

/* Incorrecto (Bloquear peticiones de usuario con tareas de larga duración):
   Ejecutar una tarea que tarda mucho tiempo directamente en el método de un controlador
   que responde a una petición HTTP, haciendo que el usuario espere.
*/
/*
// En un controlador sin @Async:
// @RestController
// public class BadController {
//     @GetMapping("/process-report-sync")
//     public String processReport() {
//         System.out.println("DEBUG: Iniciando procesamiento de reporte (SÍNCRONO) en hilo: " + Thread.currentThread().getName());
//         try {
//             Thread.sleep(10000); // ¡Esto bloquea la petición por 10 segundos!
//         } catch (InterruptedException e) { }
//         System.out.println("DEBUG: Reporte procesado.");
//         return "Reporte generado (síncrono).";
//     }
// }
*/
'''
  });
}

Future<void> insertSpringbootMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Pruebas y Calidad de Código',
    'topic': 'Pruebas de Integración',
    'subtopic':
        'Uso de @SpringBootTest y pruebas con bases de datos en memoria.',
    'definition': '''
Cuando construyes aplicaciones con Spring Boot, es crucial asegurarte de que los diferentes componentes de tu sistema (como los controladores, servicios y repositorios) trabajan juntos correctamente. Aquí es donde las "pruebas de integración" entran en juego, y Spring Boot nos da herramientas poderosas como `@SpringBootTest` y la facilidad de usar bases de datos en memoria para hacer estas pruebas.

Pensemos por un momento en por qué esto es tan importante. Las pruebas unitarias validan piezas pequeñas de código de forma aislada, pero no te dicen si tu servicio puede comunicarse con la base de datos o si un controlador puede llamar a un servicio. Las pruebas de integración cierran esa brecha, validando que las interacciones entre los componentes funcionan como se espera.

Aquí te va la aclaración:

1.  **`@SpringBootTest`**:
    * **Propósito**: Esta anotación es la piedra angular de las pruebas de integración en Spring Boot. Le dice a JUnit (el framework de pruebas de Java) que inicie una aplicación Spring Boot completa (o parte de ella) para la prueba.
    * **Funcionalidad**: Al usar `@SpringBootTest`, Spring cargará el contexto de la aplicación, incluyendo todos tus beans, configuraciones y dependencias. Esto te permite inyectar y probar componentes como si la aplicación estuviera ejecutándose normalmente.
    * **Modos de uso**: Puedes configurar `@SpringBootTest` para cargar el contexto completo, iniciar un servidor web real en un puerto aleatorio, o incluso solo cargar una parte específica de tu configuración.

2.  **Pruebas con bases de datos en memoria (H2, HSQLDB)**:
    * **Propósito**: Para las pruebas de integración que involucran la capa de persistencia (repositorios que interactúan con una base de datos), usar una base de datos en memoria es extremadamente útil.
    * **Ventajas**:
        * **Velocidad**: Son increíblemente rápidas porque no requieren una instalación de base de datos externa ni operaciones de disco. La base de datos se crea en la memoria RAM y se destruye al finalizar las pruebas.
        * **Aislamiento**: Cada ejecución de prueba comienza con una base de datos limpia, evitando que los datos de una prueba afecten a otra. Esto es crucial para la reproducibilidad de las pruebas.
        * **Facilidad de configuración**: Spring Boot facilita su configuración, simplemente incluyendo la dependencia y, a veces, sobrescribiendo algunas propiedades.
    * **Ejemplos**: `H2` y `HSQLDB` son las opciones más comunes para bases de datos en memoria en entornos de prueba de Spring.

Al combinar `@SpringBootTest` con bases de datos en memoria, puedes escribir pruebas de integración completas y rápidas que validan el flujo de datos desde un controlador, pasando por un servicio, hasta el repositorio y la base de datos, todo ello sin necesidad de una infraestructura compleja o tardada. Esto acelera tu ciclo de desarrollo y te da mucha confianza en que tus componentes están bien integrados.
''',
    'code_example': r'''
// Ejemplo de uso de @SpringBootTest y bases de datos en memoria para pruebas de integración

// 1. Dependencias en pom.xml (Maven)
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
*/

// 2. Configuración para usar H2 en memoria para pruebas (src/test/resources/application.yml)
/*
spring:
  datasource:
    url: jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE # URL para DB en memoria
    driverClassName: org.h2.Driver
    username: sa
    password:
  jpa:
    hibernate:
      ddl-auto: create-drop # Crea el esquema y lo elimina después de cada prueba
    show-sql: true # Para ver las sentencias SQL en la consola de prueba
  # Configuración específica para el entorno de pruebas
  config:
    activate:
      on-profile: test # Activa esta configuración solo cuando el perfil 'test' está activo
*/

// 3. Entidad de ejemplo
/*
package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private double price;

    public Product() {}
    public Product(String name, double price) {
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
*/

// 4. Repositorio de ejemplo
/*
package com.example.demo.repository;

import com.example.demo.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findByName(String name);
}
*/

// 5. Servicio de ejemplo
/*
package com.example.demo.service;

import com.example.demo.entity.Product;
import com.example.demo.repository.ProductRepository;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public Product getProductByName(String name) {
        return productRepository.findByName(name);
    }

    public long countProducts() {
        return productRepository.count();
    }
}
*/

// 6. Prueba de Integración para el Servicio (usando @SpringBootTest y H2 en memoria)
/*
package com.example.demo.service;

import com.example.demo.entity.Product;
import com.example.demo.repository.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles; // Para activar el perfil 'test'

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest // Inicia el contexto completo de Spring Boot para la prueba
@ActiveProfiles("test") // Activa el perfil 'test' que usa la DB en memoria H2
public class ProductServiceIntegrationTest {

    @Autowired
    private ProductService productService; // Inyecta el servicio que queremos probar

    @Autowired
    private ProductRepository productRepository; // Inyecta el repositorio para limpieza/setup

    @BeforeEach // Se ejecuta antes de cada método de prueba
    void setUp() {
        productRepository.deleteAll(); // Limpia la base de datos antes de cada prueba para aislamiento
    }

    @Test
    void shouldSaveAndRetrieveProduct() {
        // GIVEN
        Product newProduct = new Product("Laptop Pro", 1500.0);

        // WHEN
        Product savedProduct = productService.saveProduct(newProduct);

        // THEN
        assertThat(savedProduct).isNotNull();
        assertThat(savedProduct.getId()).isNotNull();
        assertThat(savedProduct.getName()).isEqualTo("Laptop Pro");

        Product foundProduct = productService.getProductByName("Laptop Pro");
        assertThat(foundProduct).isNotNull();
        assertThat(foundProduct.getName()).isEqualTo("Laptop Pro");
    }

    @Test
    void shouldCountProductsCorrectly() {
        // GIVEN
        productService.saveProduct(new Product("Tablet", 500.0));
        productService.saveProduct(new Product("Monitor", 300.0));

        // WHEN
        long count = productService.countProducts();

        // THEN
        assertThat(count).isEqualTo(2);
    }
}
*/

/* Incorrecto (No usar una DB en memoria o no limpiar entre pruebas):
   1. Conectarse a una base de datos real durante las pruebas de integración: Esto las hace lentas,
      dependientes de la red y puede dejar datos "sucios" que afecten otras pruebas.
   2. No limpiar la base de datos entre cada prueba: Esto lleva a que las pruebas no sean
      independientes y puedan fallar aleatoriamente debido a los datos de pruebas anteriores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Pruebas y Calidad de Código',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Pruebas de endpoints y controladores.',
    'definition': '''
Cuando hablamos de probar una API REST, no solo nos interesa que las funciones internas trabajen bien, sino también que los "endpoints" (las URLs a las que los clientes hacen peticiones) y los "controladores" que los manejan funcionen correctamente. Esto significa validar que aceptan las peticiones esperadas, devuelven las respuestas correctas y manejan los errores de manera adecuada.

¿Te estás preguntando por qué esto importa tanto en una API?

Pensemos por un momento que tu API es como la interfaz pública de tu aplicación. Si esa interfaz no funciona bien, por mucho que el código interno esté perfecto, la experiencia para los desarrolladores que consumen tu API o para tus aplicaciones frontend será mala.

Aquí te va la aclaración:

Las pruebas de endpoints y controladores se centran en el comportamiento externo de tu API. Esto implica:

1.  **Mapeo de Rutas**: Asegurarse de que las URL (`/users`, `/products/{id}`) están mapeadas a los métodos correctos en tus controladores (`@GetMapping`, `@PostMapping`).
2.  **Manejo de Peticiones**: Validar que los controladores pueden procesar diferentes tipos de peticiones HTTP (GET, POST, PUT, DELETE) y que extraen correctamente los parámetros de ruta (`@PathVariable`), parámetros de consulta (`@RequestParam`) y cuerpos de petición (`@RequestBody`).
3.  **Formato de Petición/Respuesta**: Confirmar que la API acepta y devuelve datos en el formato esperado (generalmente JSON en aplicaciones REST), con las cabeceras HTTP correctas.
4.  **Códigos de Estado HTTP**: Verificar que la API responde con los códigos de estado HTTP apropiados (ej. `200 OK` para éxito, `201 Created` para recursos creados, `404 Not Found` para recursos inexistentes, `400 Bad Request` para peticiones inválidas, `500 Internal Server Error` para errores de servidor).
5.  **Validación de Datos**: Probar que las reglas de validación (ej. `@NotNull`, `@Size`) funcionan y que los errores de validación se manejan correctamente.
6.  **Seguridad (básica)**: Aunque la seguridad avanzada se prueba por separado, aquí puedes verificar que los endpoints protegidos devuelven `401 Unauthorized` o `403 Forbidden` si no se cumplen los requisitos de autenticación/autorización.

Para realizar estas pruebas en Spring Boot, la herramienta principal es `MockMvc`. `MockMvc` te permite simular peticiones HTTP a tus controladores sin necesidad de iniciar un servidor HTTP real. Es más rápido y ligero que iniciar un servidor completo, pero aun así te permite probar el "stack" web completo (filtros, interceptores, controladores, etc.). También puedes usar `@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)` junto con `TestRestTemplate` o `WebTestClient` para probar contra un servidor real si lo necesitas.

Probar tus endpoints y controladores es fundamental para garantizar que tu API es robusta, predecible y fácil de usar para sus consumidores.
''',
    'code_example': r'''
// Ejemplo de pruebas de endpoints y controladores en Spring Boot con MockMvc

// 1. Dependencias en pom.xml (Maven)
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
*/

// 2. Controlador de ejemplo
/*
package com.example.demo.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid; // Para validación

@RestController
@RequestMapping("/api/products")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public ResponseEntity<Product> createProduct(@Valid @RequestBody Product product) {
        Product savedProduct = productService.saveProduct(product);
        return new ResponseEntity<>(savedProduct, HttpStatus.CREATED);
    }

    @GetMapping("/{name}")
    public ResponseEntity<Product> getProductByName(@PathVariable String name) {
        Product product = productService.getProductByName(name);
        if (product != null) {
            return ResponseEntity.ok(product);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Long id) {
        // Asume que hay un método de eliminación en el servicio
        // productService.deleteProduct(id);
        return ResponseEntity.noContent().build();
    }
}
*/

// 3. Prueba de Integración para el Controlador (usando MockMvc)
/*
package com.example.demo.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper; // Para convertir objetos a JSON
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest; // Para probar solo la capa web
import org.springframework.boot.test.mock.mockito.MockBean; // Para simular dependencias
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ProductController.class) // Carga solo el contexto de Spring MVC para ProductController
public class ProductControllerTest {

    @Autowired
    private MockMvc mockMvc; // Objeto para simular peticiones HTTP

    @Autowired
    private ObjectMapper objectMapper; // Para serializar/deserializar JSON

    @MockBean // Simula el servicio ProductService, no carga el bean real
    private ProductService productService;

    private Product testProduct;

    @BeforeEach
    void setUp() {
        testProduct = new Product("TestProduct", 99.99);
        testProduct.setId(1L); // Asigna un ID para el producto guardado
    }

    @Test
    void shouldCreateProductSuccessfully() throws Exception {
        // GIVEN
        when(productService.saveProduct(any(Product.class))).thenReturn(testProduct); // Cuando se guarde, devuelve el producto de prueba

        // WHEN & THEN
        mockMvc.perform(post("/api/products") // Petición POST a /api/products
                .contentType(MediaType.APPLICATION_JSON) // Tipo de contenido JSON
                .content(objectMapper.writeValueAsString(testProduct))) // Cuerpo de la petición en JSON
                .andExpect(status().isCreated()) // Espera un status 201 CREATED
                .andExpect(jsonPath("$.id").exists()) // Espera que el JSON de respuesta tenga un campo 'id'
                .andExpect(jsonPath("$.name").value("TestProduct")); // Espera que 'name' sea 'TestProduct'
    }

    @Test
    void shouldReturnProductByName() throws Exception {
        // GIVEN
        when(productService.getProductByName("TestProduct")).thenReturn(testProduct);

        // WHEN & THEN
        mockMvc.perform(get("/api/products/TestProduct") // Petición GET a /api/products/TestProduct
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk()) // Espera un status 200 OK
                .andExpect(jsonPath("$.name").value("TestProduct"));
    }

    @Test
    void shouldReturnNotFoundForNonExistentProduct() throws Exception {
        // GIVEN
        when(productService.getProductByName("NonExistent")).thenReturn(null);

        // WHEN & THEN
        mockMvc.perform(get("/api/products/NonExistent")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound()); // Espera un status 404 NOT FOUND
    }

    @Test
    void shouldReturnBadRequestForInvalidProductCreation() throws Exception {
        // GIVEN
        Product invalidProduct = new Product("", 0.0); // Nombre vacío, lo cual podría fallar una validación @NotBlank

        // WHEN & THEN
        mockMvc.perform(post("/api/products")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(invalidProduct)))
                .andExpect(status().isBadRequest()); // Espera un status 400 BAD REQUEST por validación
    }
}
*/

/* Incorrecto (Probar controladores de forma unitaria sin el contexto web):
   Intentar probar los métodos del controlador directamente, sin simular el entorno HTTP
   completo. Esto no valida el mapeo de rutas, la serialización/deserialización HTTP,
   ni los filtros/interceptores de Spring MVC.
*/
/*
// @Test
// void shouldCreateProductUnitarily() {
//     ProductService mockService = Mockito.mock(ProductService.class);
//     ProductController controller = new ProductController(mockService);

//     Product newProduct = new Product("Unit Test", 10.0);
//     when(mockService.saveProduct(any(Product.class))).thenReturn(newProduct);

//     ResponseEntity<Product> response = controller.createProduct(newProduct);

//     // Aunque esto prueba la lógica del método, no valida el comportamiento HTTP real
//     // (ej. cómo Spring MVC maneja el @RequestBody o @Valid)
//     assertThat(response.getStatusCode()).isEqualTo(HttpStatus.CREATED);
//     assertThat(response.getBody().getName()).isEqualTo("Unit Test");
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Pruebas y Calidad de Código',
    'topic': 'Análisis Estático',
    'subtopic': 'Integración de herramientas como SonarQube.',
    'definition': '''
En el camino de construir software de calidad, no solo basta con que el código funcione; también es vital que esté bien escrito, sea mantenible y seguro. Aquí es donde entra en juego el "análisis estático de código", una práctica que nos permite identificar problemas de calidad, vulnerabilidades y deuda técnica sin necesidad de ejecutar la aplicación. Y entre las herramientas para esto, SonarQube es un gigante.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a mejorar nuestro código.

Pensemos por un momento en un escenario donde un equipo de desarrollo está construyendo una aplicación compleja. Si cada desarrollador escribe código a su manera, sin seguir ciertos estándares o sin revisar las buenas prácticas, el proyecto puede volverse un caos de errores ocultos, código duplicado y vulnerabilidades de seguridad.

Aquí te va la aclaración:

* **¿Qué es el Análisis Estático de Código?**: Es un proceso automatizado que examina tu código fuente sin ejecutarlo. Busca patrones, violaciones de reglas de codificación, posibles bugs, vulnerabilidades de seguridad, y calcula métricas de calidad. Es como un "linter" súper poderoso que te da una radiografía completa de la salud de tu código.
* **SonarQube**: Es una plataforma de código abierto líder para la "calidad de código continua". Funciona como un servidor centralizado que analiza el código de tus proyectos, almacena los resultados y presenta un dashboard con métricas detalladas y recomendaciones.

**Cómo se integra SonarQube en un proyecto Spring Boot**:

1.  **Servidor SonarQube**: Necesitas tener una instancia de SonarQube ejecutándose (puede ser local para pruebas o en un servidor para equipos).
2.  **SonarScanner**: Es una herramienta de línea de comandos (o plugins para Maven/Gradle) que se ejecuta en tu proyecto Spring Boot. Este escáner analiza tu código y envía los resultados al servidor SonarQube.
3.  **Configuración del Proyecto**: En tu `pom.xml` (Maven) o `build.gradle` (Gradle), añades el plugin de SonarQube y configuras las propiedades necesarias (como la URL del servidor SonarQube y el token de autenticación).
4.  **Ejecución del Análisis**: Generalmente, esto se integra en tu pipeline de Integración Continua (CI/CD). Cada vez que hay un nuevo push o merge de código, el SonarScanner se ejecuta, analiza los cambios y actualiza el estado de calidad en SonarQube.

**Beneficios de usar SonarQube**:
* **Identificación temprana de problemas**: Atrapa bugs y vulnerabilidades antes de que lleguen a producción.
* **Cumplimiento de estándares**: Asegura que el equipo sigue las mejores prácticas y las reglas de codificación definidas.
* **Reducción de deuda técnica**: Ayuda a visualizar y gestionar la deuda técnica (código complicado, poco mantenible).
* **Mejora continua**: Proporciona un feedback constante sobre la calidad del código, fomentando una cultura de mejora.

Grandes organizaciones y proyectos de código abierto utilizan SonarQube para mantener la higiene de su código, permitiendo que equipos distribuidos mantengan altos estándares de calidad y seguridad en sus aplicaciones.
''',
    'code_example': r'''
// Ejemplo de integración de SonarQube con un proyecto Spring Boot (Maven)

// 1. Añadir el plugin de SonarQube en tu pom.xml
//    Dentro de la sección <build><plugins> de tu pom.xml:

/*
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
        <plugin>
            <groupId>org.sonarsource.scanner.maven</groupId>
            <artifactId>sonar-maven-plugin</artifactId>
            <version>3.10.0.2594</version> </plugin>
    </plugins>
</build>
*/

// 2. Configuración de propiedades de SonarQube en pom.xml (opcional, o se pueden pasar por línea de comandos)
//    Dentro de la sección <properties> de tu pom.xml:

/*
<properties>
    <java.version>17</java.version>
    <sonar.organization>tu-organizacion-sonar</sonar.organization> <sonar.host.url>http://localhost:9000</sonar.host.url> <sonar.login>tu-token-de-sonar</sonar.login> <sonar.projectKey>my-springboot-app</sonar.projectKey> <sonar.sourceEncoding>UTF-8</sonar.sourceEncoding>
</properties>
*/

// 3. Ejecución del análisis (desde la línea de comandos en la raíz de tu proyecto Spring Boot)
//    Asegúrate de que tu servidor SonarQube esté corriendo (ej. en http://localhost:9000).
//    Navega a la raíz de tu proyecto (donde está pom.xml) y ejecuta:

/*
mvn clean verify sonar:sonar
*/

//    Explicación del comando:
//    - `mvn clean`: Limpia el proyecto.
//    - `mvn verify`: Compila y ejecuta las pruebas unitarias e de integración (si están configuradas).
//    - `sonar:sonar`: Ejecuta el SonarScanner, analiza el código y envía los resultados al servidor SonarQube.

// 4. Integración con Gradle (ejemplo en build.gradle)
/*
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.2.5'
    id 'io.spring.dependency-management' version '1.1.4'
    id "org.sonarqube" version "4.4.1.3373" // Plugin de SonarQube para Gradle
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'

java {
    sourceCompatibility = '17'
}

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

// Configuración de SonarQube en Gradle
sonarqube {
    properties {
        property "sonar.projectKey", "my-springboot-app-gradle"
        property "sonar.host.url", "http://localhost:9000"
        property "sonar.login", "tu-token-de-sonar"
        // Puedes añadir más propiedades aquí
    }
}
*/

// Ejecución del análisis con Gradle:
/*
./gradlew clean build sonarqube
*/

/* Incorrecto (Ignorar el análisis estático o solo usar linters básicos en IDE):
   - No integrar SonarQube (o herramientas similares) en el proceso de desarrollo.
   - Confiar únicamente en las advertencias del IDE, que son menos completas que un análisis estático profundo.
   - Realizar revisiones de código puramente manuales para encontrar todos los problemas de calidad, lo cual es ineficiente y propenso a errores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Pruebas y Calidad de Código',
    'topic': 'Análisis Estático',
    'subtopic': 'Revisión de código y métricas de calidad.',
    'definition': '''
El análisis estático, y específicamente herramientas como SonarQube, no solo escanean el código, sino que también nos brindan una serie de "métricas de calidad" y facilitan la "revisión de código". Estos elementos son fundamentales para mantener un código limpio, seguro y fácil de mantener a lo largo del tiempo.

Esto tiene una explicación, y es porque, aunque el código funcione, si no es de buena calidad, puede convertirse en una pesadilla a largo plazo.

Aquí te va la aclaración:

1.  **Revisión de Código (Code Review)**:
    * **¿Qué es?**: Es el proceso en el que otros desarrolladores (comúnmente un compañero de equipo o un líder técnico) revisan el código que has escrito antes de que se fusione con la rama principal del proyecto.
    * **Propósito**: Va más allá de encontrar errores de sintaxis. Busca:
        * **Bugs lógicos**: Problemas que las pruebas automatizadas podrían no detectar.
        * **Mejoras de diseño**: Formas más eficientes o elegantes de resolver un problema.
        * **Cumplimiento de estándares**: Asegurarse de que el código sigue las guías de estilo y las mejores prácticas del equipo.
        * **Claridad y legibilidad**: Un código que otros puedan entender y mantener fácilmente.
        * **Seguridad**: Identificar posibles vulnerabilidades.
    * **Relación con el Análisis Estático**: El análisis estático actúa como una primera capa de revisión. Detecta automáticamente muchos problemas repetitivos o fáciles de pasar por alto, dejando que la revisión humana se enfoque en aspectos más complejos y de diseño. Un buen informe de SonarQube puede ser el punto de partida para una revisión de código más efectiva.

2.  **Métricas de Calidad de Código**:
    * Estas son medidas cuantificables que te dan una idea de la salud y el mantenimiento de tu código. Herramientas como SonarQube calculan automáticamente estas métricas y las presentan en un dashboard.
    * **Ejemplos de métricas clave**:
        * **Deuda Técnica (Technical Debt)**: Una estimación del tiempo y el costo necesarios para limpiar el código y llevarlo a un estado de calidad deseado.
        * **Bugs**: Errores confirmados en el código.
        * **Vulnerabilidades**: Agujeros de seguridad potenciales.
        * **Code Smells (Malos olores de código)**: Indicadores de posibles problemas de diseño, mantenibilidad o legibilidad (ej. métodos demasiado largos, clases con demasiadas responsabilidades).
        * **Complejidad Ciclomática**: Mide la complejidad de un método o una clase, indicando cuántos caminos independientes existen en su código (un número alto sugiere que es difícil de entender y probar).
        * **Cobertura de Pruebas**: El porcentaje de tu código que está cubierto por pruebas unitarias o de integración.
        * **Duplicación de Código**: La cantidad de código idéntico o muy similar en diferentes partes de tu proyecto.

Las métricas de calidad y la revisión de código son pilares de la ingeniería de software moderna. No solo te ayudan a identificar y corregir problemas, sino que también fomentan una cultura de mejora continua y conocimiento compartido dentro del equipo de desarrollo, asegurando que el software que entregas no solo funciona, sino que es de alta calidad y sostenible a largo plazo.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo las métricas de calidad se reflejan en el código
// y cómo una revisión de código podría actuar.

// NO hay código directamente ejecutable aquí, ya que se trata de conceptos
// y la interacción con herramientas de análisis estático y procesos humanos.

// 1. Ejemplo de "Code Smell" y cómo SonarQube lo detectaría:
//    Método con alta complejidad ciclomática y muchos parámetros.

/*
package com.example.qualitydemo.service;

import java.util.List;

public class OrderProcessor {

    // Este método es un ejemplo de "Code Smell": demasiados parámetros, demasiada lógica.
    // SonarQube lo marcaría por alta complejidad ciclomática y "Long Parameter List"
    public String processComplexOrder(String orderId, List<String> productIds,
                                      String customerId, double discount,
                                      boolean applyTax, String shippingAddress,
                                      String paymentMethod, boolean notifyCustomer) {
        // Lógica de validación compleja
        if (orderId == null || orderId.isEmpty()) {
            return "Invalid Order ID";
        }
        if (productIds == null || productIds.isEmpty()) {
            return "No products in order";
        }

        // Lógica de cálculo de precios
        double totalPrice = 0;
        for (String productId : productIds) {
            // Suponiendo un servicio de producto
            double productPrice = getProductPrice(productId);
            totalPrice += productPrice;
        }

        // Aplicar descuento
        if (discount > 0) {
            totalPrice -= discount;
        }

        // Aplicar impuestos
        if (applyTax) {
            totalPrice *= 1.16; // 16% tax
        }

        // Procesar pago
        boolean paymentSuccess = processPayment(customerId, paymentMethod, totalPrice);
        if (!paymentSuccess) {
            return "Payment failed";
        }

        // Actualizar inventario
        updateInventory(productIds);

        // Organizar envío
        arrangeShipping(orderId, shippingAddress);

        // Notificar cliente
        if (notifyCustomer) {
            sendOrderConfirmationEmail(customerId, orderId, totalPrice);
        }

        return "Order " + orderId + " processed successfully.";
    }

    // Métodos auxiliares simulados
    private double getProductPrice(String productId) { return 100.0; }
    private boolean processPayment(String customerId, String paymentMethod, double amount) { return true; }
    private void updateInventory(List<String> productIds) { /* ... */ }
    private void arrangeShipping(String orderId, String address) { /* ... */ }
    private void sendOrderConfirmationEmail(String customerId, String orderId, double total) { /* ... */ }
}
*/

// 2. Cómo una "Revisión de Código" o SonarQube sugerirían mejoras:
//    Se podría refactorizar el método anterior usando el patrón Command o Builder,
//    o dividiéndolo en métodos más pequeños y específicos.
//    SonarQube emitiría advertencias como:
//    - "Reduce the number of parameters of this method (Maximum allowed 7)."
//    - "Refactor this method to reduce its Cognitive Complexity from X to Y."
//    - "Method has 10 branches (max 5)." (Alta complejidad ciclomática)

//    Un revisor humano podría decir:
//    "Este método `processComplexOrder` está haciendo demasiadas cosas.
//    Podríamos extraer la lógica de cálculo de precios en un método separado,
//    la lógica de envío en otro, y la notificación en un evento asíncrono.
//    Además, considera usar un objeto `OrderRequest` como parámetro en lugar de tantos individuales."

// 3. Ejemplo de métrica de "Duplicación de Código":
//    Si tuvieras bloques de código casi idénticos en diferentes partes de tu aplicación.
//    SonarQube los detectaría y te daría un porcentaje de código duplicado.

/*
// En ServiceA.java
public void doSomethingSimilar(String data) {
    // Bloque de código casi idéntico al de ServiceB
    System.out.println("Processing data: " + data);
    if (data.contains("error")) {
        logError(data);
    } else {
        logInfo(data);
    }
}

// En ServiceB.java
public void performAnotherSimilarTask(String info) {
    // Bloque de código casi idéntico al de ServiceA
    System.out.println("Processing info: " + info);
    if (info.contains("fail")) {
        logError(info);
    } else {
        logInfo(info);
    }
}
*/

// La métrica de duplicación te diría que tienes un X% de código duplicado,
// sugiriendo que extraigas la lógica común a un método o clase auxiliar.

// 4. Cobertura de Pruebas:
//    SonarQube mostraría un porcentaje (ej. 75%) de tu código cubierto por pruebas.
//    Si un método tiene una cobertura del 0%, te indicaría que necesitas escribir pruebas para él.

/* Incorrecto (Ignorar los reportes de calidad o no tomar acciones):
   - Ejecutar SonarQube pero nunca revisar el dashboard o tomar acciones sobre los "code smells" o bugs detectados.
   - Realizar revisiones de código sin herramientas de apoyo, lo que las hace subjetivas e inconsistentes.
   - Enfocarse solo en la funcionalidad y no en la mantenibilidad o seguridad del código.
*/
'''
  });
}

Future<void> insertSpringbootMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Monitoreo y Observabilidad',
    'topic': 'Spring Boot Actuator',
    'subtopic': 'Exposición de métricas y puntos de control.',
    'definition': '''
Cuando tus aplicaciones Spring Boot empiezan a crecer, especialmente en un entorno de microservicios, necesitas saber qué está pasando dentro de ellas. ¿Están saludables? ¿Hay errores? ¿Cuánta memoria están usando? Aquí es donde Spring Boot Actuator entra en juego, dándote una ventana a la "caja negra" de tu aplicación.

Seguramente pensarás de qué va todo esto y cómo nos ayuda a mantener nuestras aplicaciones bajo control.

Pensemos por un momento en un escenario donde tienes varios microservicios ejecutándose. Si uno de ellos empieza a consumir mucha memoria o deja de responder, ¿cómo te enteras? Si no tienes las herramientas adecuadas, puede pasar desapercibido hasta que sea demasiado tarde.

Aquí te va la aclaración:

* **¿Qué es Spring Boot Actuator?**: Es un módulo de Spring Boot que proporciona una serie de "puntos de control" o "endpoints" listos para usar, que exponen información operacional sobre la aplicación que se está ejecutando. Piensa en ellos como pequeñas APIs internas que te dan datos sobre la salud, métricas, información del entorno, etc.

* **Métricas**: Son datos numéricos que describen el comportamiento de tu aplicación a lo largo del tiempo. Actuator, con la ayuda de Micrometer (una fachada de métricas), expone automáticamente métricas clave como:
    * **Uso de CPU y memoria**: Te dice cuántos recursos está consumiendo tu aplicación.
    * **Tráfico HTTP**: Cuántas peticiones está recibiendo tu API, los tiempos de respuesta y los códigos de estado.
    * **Métricas de base de datos**: Cuántas conexiones se están usando, el tiempo de ejecución de consultas.
    * **Métricas personalizadas**: Puedes añadir tus propias métricas para rastrear cualquier cosa que sea relevante para tu negocio (ej. número de usuarios registrados, cantidad de pedidos procesados). Estas métricas se pueden exportar a sistemas de monitoreo como Prometheus para visualizarlas en dashboards como Grafana.

* **Puntos de Control (Endpoints)**: Son URLs específicas que Actuator habilita y a las que puedes hacer peticiones HTTP para obtener información. Algunos de los más comunes son:
    * `/actuator/health`: Te dice si la aplicación está "viva" y saludable, basándose en la conexión a la base de datos, colas de mensajes, etc. (importante para orquestadores como Kubernetes).
    * `/actuator/info`: Muestra información general sobre la aplicación (versión, descripción, etc., que puedes configurar).
    * `/actuator/metrics`: Lista todas las métricas disponibles. Puedes acceder a métricas específicas como `/actuator/metrics/jvm.memory.used`.
    * `/actuator/beans`: Muestra todos los beans que Spring ha cargado en el contexto de la aplicación.
    * `/actuator/env`: Muestra todas las propiedades de entorno configuradas.
    * `/actuator/loggers`: Permite inspeccionar y cambiar los niveles de log en tiempo de ejecución.

**Exposición de Endpoints**: Por seguridad, no todos los endpoints están expuestos por defecto. Debes configurarlos explícitamente en tu `application.yml` o `application.properties` para decidir cuáles quieres exponer a través de JMX o HTTP.

Actuator es una herramienta invaluable para la observabilidad, permitiéndote diagnosticar problemas rápidamente, entender el comportamiento de tus aplicaciones en producción y tomar decisiones informadas para escalar o optimizar tus sistemas. Compañías como Pivotal (creadores de Spring) y muchas otras que usan Spring Boot dependen de Actuator para mantener sus operaciones bajo control.
''',
    'code_example': r'''
// Ejemplo de configuración y uso de Spring Boot Actuator

// 1. Añadir la dependencia en pom.xml (Maven)
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-registry-prometheus</artifactId>
    <scope>runtime</scope>
</dependency>
*/

// 2. Configuración en application.yml para exponer endpoints (src/main/resources/application.yml)
/*
management:
  endpoints:
    web:
      exposure:
        include: 'health,info,metrics,beans,env' # Expone estos endpoints HTTP
        # Para exponer todos los endpoints: include: '*'
  endpoint:
    health:
      show-details: always # Muestra detalles completos del estado de salud
    metrics:
      enabled: true # Habilita el endpoint /metrics
  metrics:
    tags:
      application: my-demo-app # Etiqueta todas las métricas con el nombre de tu aplicación
    export:
      prometheus:
        enabled: true # Habilita el endpoint /actuator/prometheus
*/

// 3. Ejemplo de cómo se vería la información en los endpoints (acceso vía navegador/curl)

// Para acceder a la salud de la aplicación:
// GET http://localhost:8080/actuator/health
// Respuesta ejemplo:
/*
{
  "status": "UP",
  "components": {
    "db": {
      "status": "UP",
      "details": {
        "database": "H2",
        "validationQuery": "isValid()"
      }
    },
    "diskSpace": {
      "status": "UP",
      "details": {
        "total": 249767223296,
        "free": 17871223296,
        "threshold": 10485760
      }
    },
    "ping": {
      "status": "UP"
    }
  }
}
*/

// Para acceder a las métricas disponibles:
// GET http://localhost:8080/actuator/metrics
// Respuesta ejemplo:
/*
{
  "names": [
    "jvm.memory.used",
    "jvm.gc.memory.allocated",
    "http.server.requests",
    "process.cpu.usage",
    "system.cpu.usage",
    "hikaricp.connections.active",
    // ... muchas más métricas
  ]
}
*/

// Para acceder a una métrica específica (ej. uso de memoria JVM):
// GET http://localhost:8080/actuator/metrics/jvm.memory.used
// Respuesta ejemplo:
/*
{
  "name": "jvm.memory.used",
  "description": "The amount of used memory",
  "baseUnit": "bytes",
  "measurements": [
    {
      "statistic": "VALUE",
      "value": 1.1601712E8
    }
  ],
  "availableTags": [
    {
      "tag": "area",
      "values": ["heap", "nonheap"]
    },
    {
      "tag": "id",
      "values": ["G1 Old Gen", "G1 Eden Space", "G1 Survivor Space", "Metaspace", "Compressed Class Space"]
    }
  ]
}
*/

// Para acceder a todas las métricas en formato Prometheus (si se habilitó el registro de Prometheus):
// GET http://localhost:8080/actuator/prometheus
// Esto devolverá un formato de texto plano que los scrapeadores de Prometheus pueden consumir.
/*
# HELP jvm_memory_used_bytes The amount of used memory
# TYPE jvm_memory_used_bytes gauge
jvm_memory_used_bytes{application="my-demo-app",area="heap",id="G1 Old Gen",} 1.1601712E8
jvm_memory_used_bytes{application="my-demo-app",area="heap",id="G1 Eden Space",} 3.456789E7
# HELP http_server_requests_seconds
# TYPE http_server_requests_seconds summary
http_server_requests_seconds_count{application="my-demo-app",exception="none",method="GET",outcome="SUCCESS",status="200",uri="/actuator/health",} 1.0
*/

// 4. Inyectar y usar MeterRegistry para métricas personalizadas
/*
package com.example.demo.service;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    private final Counter orderCreatedCounter;
    private final MeterRegistry meterRegistry; // Inyectar MeterRegistry

    public OrderService(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;
        // Registrar un contador personalizado
        this.orderCreatedCounter = Counter.builder("orders.created.total") // Nombre de la métrica
                                        .description("Total number of orders created")
                                        .tags("status", "success") // Etiquetas para filtrar
                                        .register(meterRegistry);
    }

    public void createOrder(String orderId) {
        // Lógica para crear una orden
        System.out.println("Order " + orderId + " created.");
        orderCreatedCounter.increment(); // Incrementar el contador
        // También puedes usar Gauges, Timers, etc.
        // meterRegistry.gauge("active.orders", getActiveOrdersCount());
    }
}
*/

/* Incorrecto (No usar Actuator y depender de logs para monitoreo o construir tus propios endpoints de métricas):
   - Intentar obtener el estado de la aplicación solo leyendo logs o depurando.
   - Desarrollar endpoints personalizados para cada métrica que necesitas, lo cual es redundante y menos robusto.
   - No tener visibilidad sobre el rendimiento, la memoria o el comportamiento del hilo en producción, lo que dificulta la depuración.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Monitoreo y Observabilidad',
    'topic': 'Spring Boot Actuator',
    'subtopic': 'Personalización de endpoints de monitoreo.',
    'definition': '''
Spring Boot Actuator es genial porque te da un montón de información útil "de caja", pero lo más interesante es que no te obliga a conformarte con lo que viene por defecto. Puedes personalizar los endpoints existentes, e incluso crear los tuyos propios, para exponer exactamente la información que necesitas sobre el estado y el rendimiento de tu aplicación.

No sé tú, pero a mí esto al principio me costó un poco entender cómo funcionaba la creación de endpoints personalizados y por qué era tan útil.

Aquí te va la aclaración:

La personalización de los endpoints de monitoreo de Actuator te permite adaptar la información que tu aplicación expone a tus necesidades específicas de monitoreo y operación.

1.  **Personalización de Endpoints Existentes**:
    * **Cambiar rutas**: Puedes modificar la URL de un endpoint si la ruta por defecto no te gusta. Por ejemplo, cambiar `/actuator/health` a `/monitor/apphealth`.
    * **Controlar la exposición**: Decides qué endpoints están disponibles y cómo (vía HTTP o JMX). Esto es crucial para la seguridad, ya que no querrás exponer información sensible públicamente.
    * **Detalles del `health` endpoint**: Puedes configurar si el endpoint `/actuator/health` muestra detalles completos del estado de salud de los componentes (base de datos, disco, etc.) o solo un estado `UP`/`DOWN`.
    * **Información de `info` endpoint**: Puedes añadir información personalizada al endpoint `/actuator/info` (ej. la versión del código, el nombre del equipo de desarrollo, la fecha de despliegue) a través de propiedades en `application.yml` o inyectando beans `InfoContributor`.

2.  **Creación de Endpoints Personalizados**:
    * **¿Para qué?**: A veces, la información que necesitas monitorear es muy específica de tu dominio de negocio y no encaja en las métricas o puntos de control estándar. Por ejemplo, podrías querer un endpoint que muestre el número de usuarios activos conectados en tiempo real, el estado de una cola de procesamiento específica, o la configuración de alguna característica particular.
    * **Cómo se hace**: Spring Boot facilita la creación de endpoints personalizados usando la anotación `@Endpoint`. Simplemente creas una clase, la anotas con `@Endpoint` y defines un ID para tu endpoint (ej. `myCustomEndpoint`). Dentro de esta clase, puedes usar anotaciones como `@ReadOperation`, `@WriteOperation` y `@DeleteOperation` en tus métodos para definir cómo se accede a la información o cómo se realizan operaciones a través de HTTP (GET, POST, DELETE).
    * **Ejemplo**: Un `@ReadOperation` en un endpoint personalizado se mapearía a una petición GET a `/actuator/your-custom-id`. Un `@WriteOperation` se mapearía a una petición POST.

**Ventajas de la Personalización**:
* **Relevancia**: Expones solo la información que es relevante para tu equipo de operaciones y tus herramientas de monitoreo.
* **Seguridad**: Controlas estrictamente qué información es accesible y por quién.
* **Flexibilidad**: Puedes adaptar Actuator a la complejidad y las necesidades específicas de tu arquitectura y negocio.

La capacidad de personalizar Actuator es una de las razones por las que Spring Boot es tan popular en entornos empresariales y de microservicios. Te permite tener una visión profunda y adaptada del comportamiento de tus aplicaciones en producción, lo cual es vital para la resolución de problemas y la toma de decisiones informadas.
''',
    'code_example': r'''
// Ejemplo de personalización de endpoints de monitoreo en Spring Boot Actuator

// 1. Configuración de exposición y personalización en application.yml
/*
management:
  endpoints:
    web:
      exposure:
        include: '*' # Expone todos los endpoints para este ejemplo, pero sé selectivo en producción
      base-path: /manage # Cambia el prefijo de los endpoints de /actuator a /manage
  endpoint:
    health:
      show-details: always
      group: # Puedes agrupar chequeos de salud
        custom:
          include: diskSpace,db # Solo incluye estos en /manage/health/custom
    info:
      enabled: true # Asegúrate de que el endpoint /info esté habilitado
*/

// 2. Añadir información personalizada al endpoint /info
//    Puedes hacerlo en application.yml o con un bean InfoContributor.

//    En application.yml:
/*
info:
  app:
    name: MyCoolApp
    description: A demo Spring Boot application
    version: 1.0.0
    build-date: @project.build.outputTimestamp@ # Se llena en tiempo de build con Maven/Gradle
*/

//    O con un bean InfoContributor (más dinámico):
/*
package com.example.demo.config;

import org.springframework.boot.actuate.info.Info;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;

@Component
public class CustomInfoContributor implements InfoContributor {

    @Override
    public void contribute(Info.Builder builder) {
        builder.withDetails(
                "lastUpdateTime", LocalDateTime.now().toString())
                .withDetail("activeUsers", 150) // Ejemplo de métrica en tiempo real
                .withDetail("contact", "support@mycoolapp.com");
    }
}
*/
//    Acceso: GET http://localhost:8080/manage/info (si base-path es /manage)

// 3. Crear un Endpoint Personalizado con @Endpoint, @ReadOperation, @WriteOperation

/*
package com.example.demo.actuator;

import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.boot.actuate.endpoint.annotation.WriteOperation;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component // Importante para que Spring lo detecte como un bean
@Endpoint(id = "featureToggle") // ID único para tu endpoint: /actuator/featureToggle
public class FeatureToggleEndpoint {

    private Map<String, Boolean> features = new HashMap<>();

    public FeatureToggleEndpoint() {
        features.put("newFeatureA", false);
        features.put("maintenanceMode", false);
    }

    // Un @ReadOperation para obtener el estado de las features (GET /actuator/featureToggle)
    @ReadOperation
    public Map<String, Boolean> getFeatureToggles() {
        return features;
    }

    // Un @ReadOperation con parámetro para obtener una feature específica (GET /actuator/featureToggle/{name})
    @ReadOperation
    public Boolean getFeatureToggle(@org.springframework.boot.actuate.endpoint.annotation.Selector String name) {
        return features.get(name);
    }

    // Un @WriteOperation para cambiar el estado de una feature (POST /actuator/featureToggle)
    // El cuerpo de la petición sería JSON: {"name": "newFeatureA", "enabled": true}
    @WriteOperation
    public String setFeatureToggle(String name, Boolean enabled) {
        if (features.containsKey(name)) {
            features.put(name, enabled);
            return "Feature '" + name + "' set to " + enabled;
        }
        return "Feature '" + name + "' not found.";
    }

    // Un @DeleteOperation para eliminar una feature (DELETE /actuator/featureToggle/{name})
    @WriteOperation // Se usa WriteOperation para DELETE también si modifica el estado
    public String deleteFeatureToggle(@org.springframework.boot.actuate.endpoint.annotation.Selector String name) {
        if (features.containsKey(name)) {
            features.remove(name);
            return "Feature '" + name + "' removed.";
        }
        return "Feature '" + name + "' not found.";
    }
}
*/
//    Para probar este endpoint (usando `manage` como base-path):
//    GET http://localhost:8080/manage/featureToggle
//    GET http://localhost:8080/manage/featureToggle/newFeatureA
//    POST http://localhost:8080/manage/featureToggle  (Body: {"name": "newFeatureA", "enabled": true})
//    DELETE http://localhost:8080/manage/featureToggle/newFeatureA (realmente es un POST con @WriteOperation)

/* Incorrecto (No personalizar Actuator cuando es necesario o exponer todo sin control):
   - Dejar todos los endpoints de Actuator expuestos por defecto en producción, lo que puede ser un riesgo de seguridad.
   - No crear endpoints personalizados para información crítica del negocio que sería útil para el monitoreo.
   - Ignorar la capacidad de agrupar o filtrar la información que Actuator proporciona.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Monitoreo y Observabilidad',
    'topic': 'Integración con Herramientas de Monitoreo',
    'subtopic': 'Uso de Micrometer y Prometheus.',
    'definition': '''
Tener métricas es un buen primer paso, pero para que sean realmente útiles, necesitas recolectarlas y almacenarlas de forma eficiente. Aquí es donde entra la combinación de Micrometer y Prometheus, dos herramientas clave que te permiten recopilar, almacenar y consultar datos de monitoreo de tus aplicaciones Spring Boot de manera robusta y escalable.

Seguramente pensarás de qué va todo esto y cómo funciona la magia detrás del monitoreo.

Pensemos por un momento en un escenario donde tu aplicación está en producción y necesitas saber cómo se está comportando en tiempo real: ¿hay picos de latencia en las peticiones? ¿está creciendo el uso de memoria de manera inusual? Sin una infraestructura adecuada para recolectar y consultar estas métricas, estarías a ciegas.

Aquí te va la aclaración:

1.  **Micrometer**:
    * **Propósito**: Micrometer es una fachada de métricas agnóstica del proveedor para JVM. Esto significa que te permite instrumentar tu código una sola vez para recoger métricas, y luego puedes "exportarlas" a diferentes sistemas de monitoreo sin cambiar tu código. Es como un traductor universal de métricas.
    * **Integración con Spring Boot**: Spring Boot Actuator ya integra Micrometer por defecto. Esto significa que, con solo añadir las dependencias de los registradores de Micrometer (como `micrometer-registry-prometheus`), tu aplicación empezará a exponer automáticamente métricas de JVM, HTTP, base de datos, y más, en el formato que Prometheus espera.
    * **Métricas Personalizadas**: Puedes usar la API de Micrometer directamente para crear contadores, medidores, temporizadores y gauges personalizados en tu código, instrumentando la lógica de negocio que te interese monitorear (ej. cuántas veces se ejecuta una función crítica, cuánto tiempo toma una operación específica).

2.  **Prometheus**:
    * **Propósito**: Prometheus es un sistema de monitoreo y alertas de código abierto. Está diseñado para recolectar métricas de tus aplicaciones e infraestructura de una manera eficiente y flexible.
    * **Modelo "Pull"**: A diferencia de otros sistemas que esperan que las aplicaciones "empujen" las métricas, Prometheus opera con un modelo "pull". Esto significa que Prometheus "raspa" (scrapes) periódicamente los endpoints de métricas de tus aplicaciones (como el endpoint `/actuator/prometheus` que expone Spring Boot Actuator) para recolectar los datos.
    * **Lenguaje de Consulta (PromQL)**: Prometheus tiene su propio lenguaje de consulta, PromQL, que es muy potente para realizar agregaciones, filtrados y cálculos complejos sobre las métricas recolectadas. Esto te permite crear consultas que responden preguntas específicas sobre el comportamiento de tu sistema.
    * **Almacenamiento y Durabilidad**: Almacena las métricas como series de tiempo, lo que te permite ver el historial del comportamiento de tu aplicación. También incluye una funcionalidad de alerta integrada que puede notificarte si ciertas condiciones de las métricas se cumplen.

La combinación de Micrometer y Prometheus es una solución muy popular y efectiva para el monitoreo de aplicaciones Spring Boot, especialmente en arquitecturas de microservicios. Micrometer facilita la instrumentación de tus aplicaciones, y Prometheus proporciona un backend robusto para la recolección, almacenamiento y consulta de esas métricas, lo que te da una visión clara de la salud y el rendimiento de tu sistema. Empresas como SoundCloud (donde se originó Prometheus) y muchas otras organizaciones basadas en la nube lo usan extensivamente.
''',
    'code_example': r'''
// Ejemplo de uso de Micrometer y Prometheus en Spring Boot

// 1. Añadir dependencias en pom.xml (Maven)
/*
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-registry-prometheus</artifactId>
    <scope>runtime</scope> </dependency>
*/

// 2. Configuración en application.yml (src/main/resources/application.yml)
/*
management:
  endpoints:
    web:
      exposure:
        include: 'prometheus,health,info' # Asegúrate de exponer el endpoint 'prometheus'
  metrics:
    tags:
      application: my-web-app # Etiqueta todas las métricas con el nombre de tu app
    enable:
      all: true # Habilita todas las métricas por defecto
    export:
      prometheus:
        enabled: true # Asegura que el exportador de Prometheus está activo
*/

// 3. Crear métricas personalizadas con Micrometer en tu código
/*
package com.example.demo.service;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Timer;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
public class BusinessService {

    private final Counter processedItemsCounter;
    private final Timer operationTimer;
    private final MeterRegistry meterRegistry; // Puedes inyectar MeterRegistry para crear métricas

    public BusinessService(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;
        // Crear un contador: mide la cantidad de veces que algo ocurre
        this.processedItemsCounter = Counter.builder("business.items.processed")
                                            .description("Number of items processed by the business logic")
                                            .tags("type", "data_processing") // Etiquetas adicionales
                                            .register(meterRegistry);

        // Crear un temporizador: mide la duración de operaciones
        this.operationTimer = Timer.builder("business.operation.duration")
                                   .description("Duration of a specific business operation")
                                   .tags("method", "process")
                                   .register(meterRegistry);

        // Ejemplo de Gauge (mide el valor actual de algo)
        // Puedes registrar un Gauge para una variable o un método que retorne un valor
        meterRegistry.gauge("active.users", this, BusinessService::getActiveUserCount);
    }

    private int activeUsers = 0; // Simula usuarios activos

    public void processItem(String item) {
        // Lógica de negocio
        System.out.println("Processing item: " + item);
        processedItemsCounter.increment(); // Incrementar el contador cada vez que se procesa un ítem
    }

    public void performLongOperation() {
        Timer.Sample sample = Timer.start(meterRegistry); // Inicia el temporizador
        try {
            Random random = new Random();
            int sleepTime = random.nextInt(2000) + 500; // Entre 0.5 y 2.5 segundos
            Thread.sleep(sleepTime); // Simula una operación que tarda
            activeUsers++; // Aumenta usuarios activos temporalmente
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            sample.stop(operationTimer); // Detiene el temporizador y registra la duración
            activeUsers--; // Disminuye usuarios activos
        }
    }

    public int getActiveUserCount() {
        return activeUsers;
    }
}
*/

// 4. Acceder al endpoint de Prometheus desde tu aplicación Spring Boot
//    Una vez que tu aplicación está corriendo, abre tu navegador o usa `curl`:
//    GET http://localhost:8080/actuator/prometheus
//    Verás las métricas en el formato que Prometheus puede raspar (scrape), incluyendo las personalizadas:
/*
# HELP business_items_processed_total Number of items processed by the business logic
# TYPE business_items_processed_total counter
business_items_processed_total{application="my-web-app",type="data_processing",} 10.0
# HELP business_operation_duration_seconds Duration of a specific business operation
# TYPE business_operation_duration_seconds summary
business_operation_duration_seconds_count{application="my-web-app",method="process",} 5.0
business_operation_duration_seconds_sum{application="my-web-app",method="process",} 7.5
# HELP active_users__value
# TYPE active_users_ _value gauge
active_users_value{application="my-web-app",} 1.0
*/

// 5. Configuración básica de Prometheus (prometheus.yml)
//    Necesitas un archivo prometheus.yml para que Prometheus sepa dónde raspar tus métricas.
/*
global:
  scrape_interval: 15s # Raspa métricas cada 15 segundos

scrape_configs:
  - job_name: 'spring-boot-app'
    metrics_path: '/actuator/prometheus' # Ruta al endpoint de métricas de Actuator
    static_configs:
      - targets: ['localhost:8080'] # La dirección de tu aplicación Spring Boot
*/
//    Para ejecutar Prometheus, descarga el binario y ejecuta: `./prometheus --config.file=prometheus.yml`

/* Incorrecto (No usar una solución de monitoreo dedicada o exportar métricas en formatos propietarios):
   - Confiar solo en los logs para entender el rendimiento o los problemas de tu aplicación.
   - Construir tu propio sistema de recolección de métricas desde cero, lo cual es complejo y propenso a errores.
   - Usar formatos de métricas propietarios que dificulten la integración con herramientas de visualización estándar.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Monitoreo y Observabilidad',
    'topic': 'Integración con Herramientas de Monitoreo',
    'subtopic': 'Visualización de métricas con Grafana.',
    'definition': '''
Recolectar métricas con Micrometer y Prometheus es el primer paso para la observabilidad, pero ver esos números crudos no es muy práctico para entender lo que realmente está pasando. Aquí es donde Grafana entra en escena: es la herramienta perfecta para transformar esos datos de métricas en dashboards visuales e interactivos que te permiten monitorear la salud y el rendimiento de tus aplicaciones de un vistazo.

Esto tiene una explicación, y es que los humanos procesamos la información visual mucho más rápido. Un gráfico que muestra un pico repentino en la latencia te alertará mucho antes que revisar líneas y líneas de texto.

Pensemos por un momento en un centro de control de operaciones. No querrías ver filas de números parpadeando; preferirías una pantalla con gráficos claros que te muestren el estado de todos tus sistemas en tiempo real. Grafana es precisamente eso para tus métricas.

Aquí te va la aclaración:

* **¿Qué es Grafana?**: Es una plataforma de código abierto para análisis y visualización de datos de series temporales. No es una base de datos de métricas en sí misma, sino que se conecta a diversas fuentes de datos (como Prometheus, InfluxDB, Elasticsearch, etc.) y te permite construir paneles de control (dashboards) dinámicos y personalizables.

* **Cómo funciona con Prometheus y Spring Boot**:
    1.  **Fuente de Datos**: Configuras Grafana para que use tu instancia de Prometheus como fuente de datos. Grafana sabe cómo comunicarse con Prometheus y usar su lenguaje de consulta (PromQL) para extraer los datos de métricas.
    2.  **Paneles de Control (Dashboards)**: Dentro de Grafana, creas dashboards. Cada dashboard puede tener múltiples "paneles". Un panel es un widget visual (un gráfico de línea, un diagrama de barras, un "gauge", etc.) que muestra una métrica o un conjunto de métricas.
    3.  **Consultas PromQL**: Para cada panel, escribes consultas en PromQL para seleccionar y agregar las métricas que quieres visualizar. Por ejemplo, podrías querer ver la `http_server_requests_seconds_count` (peticiones HTTP) de tu aplicación Spring Boot, o la `jvm_memory_used_bytes` (uso de memoria JVM).
    4.  **Personalización**: Grafana te permite personalizar casi todo: los tipos de gráficos, los rangos de tiempo, los colores, los títulos, y puedes añadir variables para hacer tus dashboards dinámicos (ej. seleccionar la aplicación o el entorno).
    5.  **Alertas**: Además de la visualización, Grafana también tiene un potente sistema de alertas. Puedes configurar reglas para que te notifique (por email, Slack, PagerDuty, etc.) si una métrica supera un umbral o se comporta de manera anómala.

**Beneficios de usar Grafana**:
* **Visibilidad**: Transforma datos crudos en información comprensible, lo que te permite identificar tendencias, anomalías y cuellos de botella rápidamente.
* **Diagnóstico Rápido**: Facilita la depuración de problemas al mostrar el comportamiento del sistema antes, durante y después de un incidente.
* **Colaboración**: Los dashboards se pueden compartir fácilmente entre equipos, asegurando que todos tengan la misma visión de la salud del sistema.
* **Automatización**: Puedes integrar Grafana con tus sistemas de despliegue para tener dashboards automáticamente para nuevas instancias de aplicaciones.

Muchas empresas, desde startups hasta grandes corporaciones, usan Grafana como su herramienta principal para la visualización de métricas, ya que es flexible, potente y compatible con una vasta cantidad de fuentes de datos. Es un pilar fundamental en cualquier estrategia de observabilidad.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo Grafana visualiza métricas de Spring Boot desde Prometheus

// NO hay código directamente ejecutable aquí, ya que se trata de configuración de herramientas
// y visualización. Este bloque muestra la interacción entre ellos.

// 1. Asume que tu aplicación Spring Boot está corriendo y exponiendo métricas de Prometheus
//    en http://localhost:8080/actuator/prometheus (como se configuró en el subtema anterior).

// 2. Asume que Prometheus está corriendo y scrapeando las métricas de tu aplicación
//    (usando el prometheus.yml de ejemplo del subtema anterior).

// 3. Pasos para configurar Grafana (requiere una instalación de Grafana, por ejemplo, vía Docker)

//    a. Iniciar Grafana (ejemplo con Docker):
/*
docker run -d --name grafana -p 3000:3000 grafana/grafana-oss
*/
//    Accede a Grafana en http://localhost:3000 (usuario/contraseña por defecto: admin/admin)

//    b. Añadir Prometheus como fuente de datos en Grafana:
//       - En el menú lateral de Grafana, haz clic en "Connections" -> "Data sources" -> "Add new data source".
//       - Selecciona "Prometheus".
//       - En "HTTP" -> "URL", introduce la URL de tu instancia de Prometheus (ej. `http://localhost:9090`).
//       - Guarda y prueba la conexión.

//    c. Crear un nuevo Dashboard en Grafana:
//       - En el menú lateral, haz clic en "Dashboards" -> "New dashboard" -> "Add a new panel".

//    d. Configurar un Panel (Gráfico) para una métrica de Spring Boot:
//       - En la sección "Query", selecciona tu fuente de datos "Prometheus".
//       - En el campo "PromQL", introduce una consulta para la métrica que quieres visualizar.

//       Ejemplos de consultas PromQL para métricas de Spring Boot:

//       i. Uso de CPU del proceso de la aplicación:
//          `process_cpu_usage{application="my-web-app"}`
//          Este gráfico mostrará la evolución del uso de CPU de tu aplicación.

//       ii. Total de peticiones HTTP con código de estado 200 (OK):
//          `sum by (uri) (http_server_requests_seconds_count{application="my-web-app",status="200"})`
//          Este gráfico podría mostrar un contador acumulativo de peticiones exitosas por cada URL.

//       iii. Latencia promedio de las peticiones HTTP (ej. en milisegundos):
//            `rate(http_server_requests_seconds_sum{application="my-web-app"}[5m]) / rate(http_server_requests_seconds_count{application="my-web-app"}[5m]) * 1000`
//            Esto calcula la latencia promedio en los últimos 5 minutos y la convierte a milisegundos.

//       iv. Memoria Heap usada por la JVM:
//           `jvm_memory_used_bytes{application="my-web-app",area="heap"}`
//           Este gráfico mostrará cómo cambia el uso de la memoria heap a lo largo del tiempo.

//       v. Conexiones activas de HikariCP (si usas JPA con HikariCP):
//          `hikaricp_connections_active{application="my-web-app",pool="HikariPool-1"}`
//          Muestra el número de conexiones activas a tu base de datos.

//       vi. Tu métrica personalizada (del subtema anterior): `business_items_processed_total`
//           `business_items_processed_total{application="my-web-app"}`
//           Muestra el contador de ítems procesados.

//       - Configura las opciones de visualización (tipo de gráfico, leyenda, etc.).
//       - Añade más paneles para construir un dashboard completo que muestre la salud de tu aplicación.

// 4. Ejemplo de un panel de alertas en Grafana:
//    - Dentro de un panel, ve a la pestaña "Alert".
//    - Define una condición, por ejemplo:
//      "Si `avg(rate(http_server_requests_seconds_count{status='500'}[5m])) > 0` por 1 minuto"
//      (Si hay errores HTTP 500 en los últimos 5 minutos).
//    - Configura el "Notification channel" (email, Slack, etc.) para recibir la alerta.

/* Incorrecto (Solo recolectar métricas sin visualizarlas o sin establecer alertas):
   - Tener métricas almacenadas en Prometheus pero nunca construir dashboards para entenderlas.
   - Esperar a que los usuarios reporten problemas en lugar de usar alertas proactivas.
   - Crear dashboards estáticos que no permitan explorar los datos o filtrar por períodos de tiempo.
*/
'''
  });
}

Future<void> insertSpringbootMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Contenedores y Docker',
    'subtopic': 'Dockerización de aplicaciones Spring Boot.',
    'definition': '''
El despliegue de aplicaciones, especialmente en entornos de microservicios, puede ser un dolor de cabeza si no tienes las herramientas adecuadas. Aquí es donde Docker entra en escena, permitiéndonos empaquetar nuestras aplicaciones Spring Boot de una manera consistente y portátil. La "dockerización" es el proceso de convertir tu aplicación en una imagen de Docker, lista para ejecutarse en cualquier lugar que tenga Docker instalado.

Seguramente pensarás de qué va todo esto y por qué es tan revolucionario para el despliegue.

Pensemos por un momento en un escenario donde desarrollas una aplicación Spring Boot en tu máquina con Java 17, una base de datos PostgreSQL, y un montón de librerías. Luego, intentas desplegarla en un servidor de pruebas que tiene Java 11 y MySQL. ¡Boom! 💥 Problemas de compatibilidad, dependencias faltantes, configuraciones diferentes. Docker resuelve este "funciona en mi máquina" problema.

Aquí te va la aclaración:

* **¿Qué es Docker?**: Docker es una plataforma para desarrollar, enviar y ejecutar aplicaciones en contenedores. Un contenedor es una unidad de software estandarizada que empaqueta el código de tu aplicación y todas sus dependencias (bibliotecas, configuraciones, etc.) para que se ejecute de forma rápida y confiable de un entorno informático a otro.
* **La "Dockerización"**: Es el proceso de crear un "Dockerfile" para tu aplicación. Un Dockerfile es un script con una serie de instrucciones que le dice a Docker cómo construir una imagen de contenedor de tu aplicación.

**¿Por qué Dockerizar una aplicación Spring Boot?**

1.  **Consistencia del Entorno**: Garantiza que tu aplicación siempre se ejecute en el mismo entorno, desde tu máquina de desarrollo hasta producción. Olvídate de los problemas de "funciona en mi máquina".
2.  **Aislamiento**: Los contenedores aíslan tu aplicación y sus dependencias del sistema operativo subyacente y de otras aplicaciones. Esto evita conflictos de versiones y asegura la estabilidad.
3.  **Portabilidad**: Una vez que tu aplicación está en un contenedor, puedes ejecutarla en cualquier máquina que tenga Docker instalado, ya sea un laptop, un servidor en la nube, o un clúster de Kubernetes.
4.  **Escalabilidad**: Es mucho más fácil escalar aplicaciones dockerizadas. Simplemente lanzas más instancias del mismo contenedor.
5.  **Eficiencia de Recursos**: Los contenedores son más ligeros que las máquinas virtuales, lo que significa que puedes ejecutar más aplicaciones en el mismo hardware.

**Pasos clave para Dockerizar una aplicación Spring Boot**:

* **Dockerfile**: Crear un archivo llamado `Dockerfile` (sin extensión) en la raíz de tu proyecto. Este archivo contendrá las instrucciones para construir la imagen.
* **Imagen Base**: Elegir una imagen base adecuada (ej. una imagen de OpenJDK para Java).
* **Copia de Archivos**: Copiar tu JAR ejecutable de Spring Boot y cualquier otro recurso necesario dentro de la imagen.
* **Comando de Ejecución**: Especificar el comando que Docker debe usar para iniciar tu aplicación dentro del contenedor.

La dockerización es una práctica fundamental en el mundo de DevOps y la computación en la nube. Permite a los equipos acelerar el ciclo de desarrollo, probar con confianza y desplegar aplicaciones de manera más eficiente. Empresas como Google y Netflix han sido pioneras en el uso de contenedores para gestionar sus vastas infraestructuras.
''',
    'code_example': r'''
# Ejemplo de Dockerización de una aplicación Spring Boot

# 1. Crear un JAR ejecutable de tu aplicación Spring Boot
#    Asegúrate de que tu aplicación Spring Boot tiene el plugin `spring-boot-maven-plugin` (Maven)
#    o `spring-boot` plugin (Gradle) para generar un JAR "fat" o "uber" que incluye todas las dependencias.

#    Para Maven:
#    mvn clean package
#    Esto generará un archivo JAR en `target/your-app-name-0.0.1-SNAPSHOT.jar`

#    Para Gradle:
#    ./gradlew clean build
#    Esto generará un archivo JAR en `build/libs/your-app-name-0.0.1-SNAPSHOT.jar`

# 2. Crear un Dockerfile en la raíz de tu proyecto
#    (Ejemplo de Dockerfile optimizado para Spring Boot)

/*
# Usa una imagen base de OpenJDK, ligera y específica para JRE
# La versión debe coincidir con la que usas en tu proyecto
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el JAR ejecutable de tu aplicación al contenedor
# Asume que el JAR se llama 'my-springboot-app.jar' y está en 'target/' o 'build/libs/'
# Cambia 'my-springboot-app.jar' por el nombre real de tu JAR
COPY target/my-springboot-app.jar app.jar

# Expone el puerto en el que la aplicación Spring Boot escuchará
# (Por defecto, Spring Boot usa el puerto 8080)
EXPOSE 8080

# Comando para ejecutar la aplicación cuando el contenedor se inicia
# Usa `java -jar` para ejecutar el JAR
# Puedes añadir opciones de JVM aquí, como `-Xmx512m` para limitar la memoria
ENTRYPOINT ["java", "-jar", "app.jar"]

# Dockerfile para una aplicación Spring Boot (alternativa usando Jib plugin)
# Jib es un plugin de Maven/Gradle que simplifica la creación de imágenes Docker
# sin Dockerfile ni Docker daemon.
# Si usas Jib, solo necesitas la configuración en pom.xml/build.gradle y luego construir.
*/

# 3. Construir la imagen de Docker
#    Abre tu terminal en la raíz de tu proyecto (donde está el Dockerfile) y ejecuta:

/*
docker build -t my-springboot-app-image .
*/

#    Explicación del comando:
#    - `docker build`: Comando para construir una imagen.
#    - `-t my-springboot-app-image`: Asigna un nombre (tag) a la imagen.
#      Puedes añadir una versión: `my-springboot-app-image:1.0`
#    - `.`: Indica que el Dockerfile está en el directorio actual.

# 4. Ejecutar la aplicación en un contenedor Docker
#    Una vez que la imagen está construida, puedes ejecutarla:

/*
docker run -p 8080:8080 my-springboot-app-image
*/

#    Explicación del comando:
#    - `docker run`: Comando para ejecutar un contenedor desde una imagen.
#    - `-p 8080:8080`: Mapea el puerto 8080 del contenedor al puerto 8080 de tu máquina host.
#      Esto permite acceder a la aplicación desde tu navegador en `http://localhost:8080`.
#    - `my-springboot-app-image`: El nombre de la imagen que quieres ejecutar.

# 5. Verificar que la aplicación está corriendo
#    Abre tu navegador y ve a `http://localhost:8080` (o el endpoint de tu app).
#    También puedes ver los logs del contenedor:
/*
docker logs <container_id_o_nombre>
*/

# Incorrecto (No dockerizar o usar Dockerfile ineficiente):
# - No usar Docker y desplegar directamente el JAR en un servidor, lidiando con problemas de dependencias y entornos.
# - Usar un Dockerfile no optimizado, por ejemplo:
#   - `FROM openjdk:17`: Usar la imagen JDK completa en lugar de `jdk-slim` o `jre-slim` (que es más ligera).
#   - `COPY . .`: Copiar todo el directorio del proyecto, incluyendo cosas innecesarias como `.git` o `target/`.
#   - No usar las capas de Docker de manera eficiente (cada instrucción en el Dockerfile crea una capa;
#     si copias todo el JAR en una capa nueva después de cambios menores, el caché de Docker se invalida fácilmente).
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Contenedores y Docker',
    'subtopic': 'Creación de imágenes y despliegue en contenedores.',
    'definition': '''
El proceso de "dockerización" de una aplicación Spring Boot culmina en la "creación de imágenes" y el "despliegue en contenedores". Una vez que tienes tu Dockerfile bien definido y has construido tu imagen, el siguiente paso es entender cómo se gestiona y distribuye esa imagen para que tu aplicación pueda ejecutarse en cualquier entorno Docker, desde tu laptop hasta un clúster en la nube.

¿Te estás preguntando por qué esto importa y cómo se diferencia de simplemente ejecutar el JAR?

Pensemos por un momento en un escenario de software a gran escala. No basta con que tu aplicación "funcione". Necesitas que se despliegue de forma repetible, rápida y que sea fácil de escalar. La gestión de imágenes y el despliegue en contenedores son los pilares para lograrlo.

Aquí te va la aclaración:

1.  **Creación de Imágenes Docker**:
    * **Imágenes vs. Contenedores**: Una "imagen" Docker es una plantilla de solo lectura que contiene el código de tu aplicación, el entorno de ejecución, las librerías, dependencias y cualquier configuración necesaria. Es como un "plano" o una "clase". Un "contenedor" es una instancia ejecutable de esa imagen; es como el "objeto" o la "ejecución" de ese plano.
    * **Proceso de Construcción**: La imagen se construye a partir de un Dockerfile, usando el comando `docker build`. Docker lee cada instrucción del Dockerfile, ejecuta el comando (ej. copiar archivos, instalar dependencias) y crea una nueva capa en la imagen. Estas capas son inmutables y se cachean, lo que hace que las construcciones posteriores sean muy rápidas si solo cambian unas pocas capas.
    * **Etiquetado (Tagging)**: Al construir una imagen, le das una "etiqueta" (tag), que normalmente incluye el nombre de la aplicación y una versión (ej. `my-app:1.0`, `my-app:latest`). Esto te permite identificar y gestionar diferentes versiones de tu aplicación.
    * **Registros de Imágenes (Registries)**: Una vez construida, una imagen se almacena localmente en tu máquina. Para compartirla o desplegarla en otros servidores, necesitas subirla a un "registro de imágenes" (Docker Hub, Google Container Registry, AWS ECR, Azure Container Registry o tu propio registro privado). Es como un repositorio de código (ej. GitHub) pero para imágenes Docker.

2.  **Despliegue en Contenedores**:
    * **Ejecución de Contenedores**: Una vez que la imagen está en un registro (o localmente), puedes usar el comando `docker run` para crear y ejecutar un contenedor a partir de esa imagen.
    * **Mapeo de Puertos**: Como tu aplicación Spring Boot escuchará en un puerto dentro del contenedor (ej. 8080), necesitas "mapear" ese puerto a un puerto en la máquina host para que sea accesible desde fuera del contenedor (ej. `-p 8080:8080`).
    * **Variables de Entorno**: Es una práctica común usar variables de entorno para la configuración sensible o específica del entorno (ej. credenciales de base de datos, URLs de servicios externos). Puedes pasar estas variables al contenedor al momento de ejecutarlo (ej. `-e DB_HOST=my-db`).
    * **Volúmenes**: Para la persistencia de datos (si tu aplicación escribe archivos o logs que deben sobrevivir a la vida del contenedor), puedes usar "volúmenes" para montar directorios del host dentro del contenedor.
    * **Orquestación de Contenedores**: En entornos de producción con múltiples contenedores y microservicios, el despliegue manual se vuelve inviable. Aquí es donde entran las "herramientas de orquestación de contenedores" como Docker Compose (para entornos de desarrollo/pruebas con múltiples servicios) y, más importante, **Kubernetes** (para producción, escala y alta disponibilidad). Estas herramientas automatizan el despliegue, escalado, balanceo de carga y autocuración de tus contenedores.

La creación de imágenes y el despliegue en contenedores son los pilares de las arquitecturas modernas basadas en microservicios y la metodología DevOps. Permiten una entrega de software más rápida, consistente y confiable, facilitando la vida tanto a desarrolladores como a equipos de operaciones. Compañías como Spotify y Shopify son ejemplos de cómo la adopción de estas prácticas ha habilitado su escala masiva.
''',
    'code_example': r'''
# Ejemplo de Creación de Imágenes y Despliegue en Contenedores

# 1. Reutilizamos el Dockerfile del subtema anterior.
#    Asumimos que el Dockerfile y el JAR de tu aplicación Spring Boot están listos.

# 2. Construir la imagen de Docker (recordatorio del comando):
/*
docker build -t my-springboot-app:1.0 .
*/
#    Aquí, asignamos la etiqueta `1.0` a la imagen.

# 3. Listar las imágenes locales para verificar:
/*
docker images
*/
#    Deberías ver `my-springboot-app` con la etiqueta `1.0`.

# 4. Subir la imagen a un registro de Docker (ej. Docker Hub)
#    Primero, inicia sesión en Docker Hub (o tu registro privado):
/*
docker login
*/
#    Luego, etiqueta tu imagen con tu nombre de usuario de Docker Hub:
/*
docker tag my-springboot-app:1.0 your_dockerhub_username/my-springboot-app:1.0
*/
#    Finalmente, sube la imagen al registro:
/*
docker push your_dockerhub_username/my-springboot-app:1.0
*/
#    Ahora, esta imagen está disponible públicamente (o privadamente si es un registro privado)
#    para que cualquiera la descargue y ejecute.

# 5. Ejecutar la aplicación desde la imagen en un contenedor (recordatorio del comando):
/*
docker run -d -p 8080:8080 --name my-app-instance my-springboot-app:1.0
*/
#    - `-d`: Ejecuta el contenedor en modo "detached" (en segundo plano).
#    - `--name my-app-instance`: Asigna un nombre fácil de recordar al contenedor.

# 6. Ver los contenedores en ejecución:
/*
docker ps
*/
#    Deberías ver tu contenedor `my-app-instance` listado.

# 7. Pasar variables de entorno al contenedor:
#    Si tu aplicación Spring Boot usa variables de entorno para configuración (ej. DB_URL):
/*
docker run -d -p 8080:8080 \
  -e SPRING_DATASOURCE_URL="jdbc:postgresql://host.docker.internal:5432/mydb" \
  -e SPRING_DATASOURCE_USERNAME="user" \
  -e SPRING_DATASOURCE_PASSWORD="password" \
  --name my-app-with-env \
  my-springboot-app:1.0
*/
#    -e: Establece una variable de entorno dentro del contenedor.
#    `host.docker.internal` es un nombre de host especial que permite al contenedor
#    acceder a servicios que se ejecutan en la máquina host.

# 8. Ejemplo de Docker Compose (para orquestar múltiples servicios localmente)
#    Crear un archivo `docker-compose.yml` en la raíz de tu proyecto:
/*
version: '3.8'
services:
  app:
    image: my-springboot-app:1.0 # Usa la imagen que construiste
    ports:
      - "8080:8080"
    environment: # Variables de entorno para el servicio 'app'
      SPRING_DATASOURCE_URL: jdbc:postgresql://db:5432/mydb
      SPRING_DATASOURCE_USERNAME: user
      SPRING_DATASOURCE_PASSWORD: password
    depends_on: # Define dependencias entre servicios (el app depende de la DB)
      - db
  db:
    image: postgres:13
    environment: # Variables de entorno para el servicio 'db' (PostgreSQL)
      POSTGRES_DB: mydb
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432" # Opcional: para acceder a la DB desde fuera de Docker
*/
#    Para iniciar los servicios definidos en `docker-compose.yml`:
/*
docker-compose up -d
*/
#    Para detenerlos:
/*
docker-compose down
*/

# Incorrecto (Errores comunes en la creación y despliegue de imágenes):
# - No usar versiones específicas en las etiquetas (`my-app:latest` es riesgoso en producción).
# - Almacenar credenciales sensibles directamente en el Dockerfile (usar variables de entorno o secretos).
# - No exponer el puerto de la aplicación en el Dockerfile o no mapearlo al ejecutar.
# - No considerar la persistencia de datos y que los datos dentro del contenedor se perderán al eliminarlo.
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Integración Continua y Despliegue Continuo (CI/CD)',
    'subtopic': 'Configuración de pipelines con Jenkins o GitHub Actions.',
    'definition': '''
En el mundo del desarrollo de software moderno, especialmente con Spring Boot y los microservicios, el ciclo de vida del software va más allá de solo escribir código. Aquí es donde la Integración Continua (CI) y el Despliegue Continuo (CD) se vuelven indispensables. Un "pipeline" de CI/CD es una serie automatizada de pasos que llevan tu código desde el repositorio hasta un entorno de producción, garantizando calidad y eficiencia.

Seguramente pensarás de qué va todo esto y por qué la automatización es tan crucial.

Pensemos por un momento en un escenario sin CI/CD: cada vez que quieres desplegar una nueva versión, tienes que compilar el código manualmente, ejecutar las pruebas (si es que las ejecutas), construir la imagen de Docker, subirla a un registro, y luego desplegarla en el servidor. Esto es lento, propenso a errores humanos y un dolor de cabeza, especialmente si despliegas varias veces al día.

Aquí te va la aclaración:

* **Integración Continua (CI)**:
    * **Propósito**: Se trata de fusionar (integrar) los cambios de código de todos los desarrolladores en una rama compartida (generalmente `main` o `develop`) con mucha frecuencia (varias veces al día).
    * **Beneficios**: Detecta conflictos y errores de integración temprano, reduce la "deuda de integración", mejora la calidad del código y da feedback rápido a los desarrolladores.
    * **Proceso típico**: Cada vez que un desarrollador sube cambios (push), la CI automáticamente compila el código, ejecuta pruebas unitarias e de integración, y realiza análisis estático de código. Si todo pasa, el código se integra.

* **Despliegue Continuo (CD)**:
    * **Propósito**: Va un paso más allá de la CI. Si la CI pasa con éxito, el CD automáticamente empaqueta la aplicación (ej. crea la imagen Docker) y la despliega en uno o más entornos (desarrollo, pruebas, staging, producción).
    * **Beneficios**: Permite lanzamientos más rápidos y frecuentes, reduce el riesgo de los despliegues (al ser pequeños y frecuentes), y libera al equipo de operaciones de tareas manuales repetitivas.

* **Pipelines de CI/CD**: Son las secuencias automatizadas de pasos que definen cómo se ejecuta la CI y el CD. Cada paso (ej. compilar, probar, construir imagen, desplegar) es una "etapa" en el pipeline.

**Herramientas populares para construir pipelines de CI/CD**:

1.  **Jenkins**:
    * **Descripción**: Es una de las herramientas de automatización de código abierto más antiguas y maduras. Es altamente extensible a través de plugins y puede ejecutarse en casi cualquier entorno.
    * **Configuración**: Se define a través de "Jenkinsfiles" (scripts en Groovy que describen el pipeline) o mediante la interfaz gráfica.
    * **Ventajas**: Extremadamente flexible, gran comunidad y ecosistema de plugins.
    * **Desventajas**: Puede ser complejo de configurar y mantener, requiere infraestructura propia.

2.  **GitHub Actions**:
    * **Descripción**: Es una característica de GitHub que te permite automatizar flujos de trabajo directamente desde tu repositorio de GitHub. Es una solución nativa de la nube, basada en YAML.
    * **Configuración**: Los pipelines se definen en archivos `.github/workflows/*.yml` en tu repositorio.
    * **Ventajas**: Fácil de usar, se integra perfectamente con GitHub (Pull Requests, Issues), infraestructura gestionada por GitHub (no tienes que mantener servidores).
    * **Desventajas**: Menos personalizable que Jenkins en algunos aspectos, ligado al ecosistema de GitHub.

La configuración de pipelines con herramientas como Jenkins o GitHub Actions transforma la forma en que los equipos desarrollan y entregan software. No solo acelera el proceso, sino que también establece un estándar de calidad y consistencia que es difícil de lograr con procesos manuales. Empresas líderes en tecnología como Amazon, Google y Microsoft confían en la automatización CI/CD para entregar software a una velocidad y escala impresionantes.
''',
    'code_example': r'''
# Ejemplo de Configuración de Pipelines CI/CD para una aplicación Spring Boot

# Asumiremos que tu aplicación Spring Boot ya tiene un Dockerfile
# y que se puede construir y empaquetar con Maven (`mvn clean package`).

# 1. Ejemplo de un Jenkinsfile (Pipeline como código para Jenkins)
#    (Colocar este archivo llamado `Jenkinsfile` en la raíz de tu proyecto)

/*
// Jenkinsfile para un pipeline de Spring Boot con Docker
pipeline {
    agent any // Define dónde se ejecutará el pipeline (cualquier agente disponible)

    environment {
        // Variables de entorno para el pipeline
        DOCKER_IMAGE = 'your_dockerhub_username/my-springboot-app'
        DOCKER_TAG = "v${env.BUILD_NUMBER}" // Usa el número de build de Jenkins como tag
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building Spring Boot application...'
                // Ejecuta el comando Maven para limpiar y empaquetar la aplicación
                sh 'mvn clean package -DskipTests' // -DskipTests para no ejecutar unitarias aquí, sino en la etapa de Test
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit and integration tests...'
                // Ejecuta las pruebas (incluye jacoco para cobertura, opcional)
                sh 'mvn test'
                // Opcional: Generar reporte de cobertura de código
                // junit '**/target/surefire-reports/*.xml'
                // jacoco agent: 'pre-main', destFile: 'target/jacoco.exec', html: 'target/site/jacoco'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo "Building Docker image ${DOCKER_IMAGE}:${DOCKER_TAG}..."
                script {
                    // Construye la imagen Docker
                    // Asegúrate de que el Dockerfile está en la raíz del proyecto
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}", '-f Dockerfile .')
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image ${DOCKER_IMAGE}:${DOCKER_TAG} to Docker Hub..."
                script {
                    // Inicia sesión en Docker Hub usando credenciales de Jenkins
                    // (Necesitas configurar las credenciales de Docker Hub en Jenkins)
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
        stage('Deploy to Staging') {
            when {
                // Solo despliega si la rama es 'main' o 'master'
                branch 'main'
            }
            steps {
                echo "Deploying ${DOCKER_IMAGE}:${DOCKER_TAG} to Staging environment..."
                // Aquí irían los comandos para desplegar en tu entorno de staging,
                // por ejemplo, usando SSH para ejecutar comandos en un servidor,
                // o comandos de Kubernetes (kubectl apply -f deployment.yaml).
                sh "echo 'kubectl apply -f staging-deployment.yaml --image ${DOCKER_IMAGE}:${DOCKER_TAG}'"
            }
        }
        stage('Deploy to Production') {
            when {
                // Despliega a producción solo si la rama es 'main' y después de una aprobación manual
                branch 'main'
                environment 'production'
            }
            steps {
                input message: 'Approve deployment to Production?'
                echo "Deploying ${DOCKER_IMAGE}:${DOCKER_TAG} to Production environment..."
                sh "echo 'kubectl apply -f production-deployment.yaml --image ${DOCKER_IMAGE}:${DOCKER_TAG}'"
            }
        }
    }
    post {
        always {
            // Pasos que se ejecutan siempre, al final del pipeline
            echo 'Pipeline finished.'
        }
        failure {
            // Pasos que se ejecutan si el pipeline falla
            echo 'Pipeline failed! Sending notification...'
            // mail to: 'devs@example.com', subject: "Build failed: ${env.JOB_NAME}", body: "See ${env.BUILD_URL}"
        }
        success {
            // Pasos que se ejecutan si el pipeline es exitoso
            echo 'Pipeline succeeded!'
        }
    }
}
*/

# 2. Ejemplo de un Workflow de GitHub Actions
#    (Colocar este archivo como `.github/workflows/ci-cd-pipeline.yml` en tu repositorio)

/*
name: Spring Boot CI/CD Pipeline

on:
  push:
    branches:
      - main
      - develop
  pull_request:
    branches:
      - main
      - develop

jobs:
  build-and-test:
    runs-on: ubuntu-latest # Sistema operativo del runner
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4 # Paso para clonar el repositorio

      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'
          cache: 'maven' # Cacha dependencias de Maven para builds más rápidos

      - name: Build with Maven
        run: mvn -B package --file pom.xml -DskipTests # Construye el JAR, `-B` para modo batch

      - name: Run Tests
        run: mvn test # Ejecuta las pruebas unitarias e de integración

      - name: Analyze with SonarCloud (Optional)
        # Necesitas configurar SONAR_TOKEN en los secretos de tu repositorio
        # Y el plugin de SonarCloud en tu pom.xml
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
        run: mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar

      - name: Build & Push Docker Image
        if: github.ref == 'refs/heads/main' # Solo construye y empuja si es la rama main
        env:
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }} # Tus credenciales de Docker Hub
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
        run: |
          docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
          docker build -t $DOCKER_USERNAME/my-springboot-app:${{ github.sha }} . # Usa el SHA del commit como tag
          docker push $DOCKER_USERNAME/my-springboot-app:${{ github.sha }}
          docker tag $DOCKER_USERNAME/my-springboot-app:${{ github.sha }} $DOCKER_USERNAME/my-springboot-app:latest
          docker push $DOCKER_USERNAME/my-springboot-app:latest

  deploy:
    needs: build-and-test # Este job depende del éxito del job 'build-and-test'
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main' # Solo despliega si es la rama main
    environment: production # Define el entorno de despliegue (para control de acceso, variables)
    steps:
      - name: Deploy to Kubernetes
        # Aquí irían los comandos para desplegar en tu clúster de Kubernetes,
        # por ejemplo, usando kubectl. Necesitarás configurar las credenciales de K8s como secretos.
        run: |
          echo "Deploying $DOCKER_USERNAME/my-springboot-app:${{ github.sha }} to production..."
          # kubectl apply -f kubernetes/deployment.yaml
          # kubectl set image deployment/my-springboot-app my-springboot-app=$DOCKER_USERNAME/my-springboot-app:${{ github.sha }}
*/

# Incorrecto (Procesos manuales o pipelines ineficientes):
# - No usar CI/CD y depender de pasos manuales para compilar, probar y desplegar.
# - Un pipeline que no ejecuta todas las pruebas (unitarias, integración).
# - Un pipeline que no construye imágenes Docker de forma automatizada.
# - Un pipeline que no automatiza el despliegue y requiere intervención manual constante.
# - No usar el caché para las dependencias de Maven/Gradle en CI, lo que ralentiza las builds.
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Despliegue y DevOps',
    'topic': 'Integración Continua y Despliegue Continuo (CI/CD)',
    'subtopic': 'Automatización de pruebas y despliegues.',
    'definition': '''
El corazón de la Integración Continua y el Despliegue Continuo (CI/CD) es la "automatización". Si bien ya hablamos de configurar pipelines con herramientas como Jenkins o GitHub Actions, el verdadero poder reside en lo que automatizamos dentro de esos pipelines: las pruebas y los despliegues. Estos dos pilares son los que garantizan que el software que entregamos no solo llega rápido, sino que también es de alta calidad.

Esto tiene una explicación, y es porque la automatización de pruebas y despliegues es lo que realmente permite a las empresas como Netflix realizar miles de despliegues al día con confianza.

Aquí te va la aclaración:

1.  **Automatización de Pruebas**:
    * **¿Por qué es crucial?**: Las pruebas manuales son lentas, caras y propensas a errores. Al automatizarlas, puedes ejecutarlas de forma repetida, rápida y consistente cada vez que hay un cambio en el código, sin intervención humana.
    * **Tipos de Pruebas a Automatizar en un Pipeline CI/CD**:
        * **Pruebas Unitarias**: Son la base. Validan las unidades más pequeñas de código (métodos, clases) de forma aislada. Son muy rápidas y se ejecutan en cada push.
        * **Pruebas de Integración**: Verifican que los diferentes componentes de tu aplicación Spring Boot (controladores, servicios, repositorios, bases de datos) trabajan bien juntos. Son más lentas que las unitarias, pero cruciales.
        * **Pruebas de Contrato (Contract Testing)**: Especialmente relevantes en microservicios. Aseguran que la API de un servicio cumple con las expectativas de los servicios que lo consumen, evitando sorpresas cuando se integran.
        * **Análisis Estático de Código**: Herramientas como SonarQube (ya lo vimos) se ejecutan automáticamente para detectar "code smells", bugs y vulnerabilidades sin ejecutar el código.
        * **Pruebas de Seguridad (SAST/DAST)**: Pueden integrarse herramientas de Static Application Security Testing (SAST) y Dynamic Application Security Testing (DAST) para escanear el código y la aplicación en ejecución en busca de vulnerabilidades.
        * **Pruebas de Rendimiento/Carga (Performance/Load Testing)**: Aunque a veces se ejecutan en un pipeline separado, se pueden integrar para simular tráfico real y detectar cuellos de botella antes del despliegue en producción.
    * **Beneficios**: Detección temprana de bugs, reducción de regresiones, aumento de la confianza en el código, retroalimentación instantánea a los desarrolladores.

2.  **Automatización de Despliegues**:
    * **¿Por qué es crucial?**: El despliegue manual es una fuente importante de errores y retrasos. La automatización elimina la intervención humana en los pasos de despliegue, haciéndolos repetibles, rápidos y menos propensos a errores.
    * **Proceso típico**:
        * **Construcción de Artefactos**: Después de que las pruebas pasan, el pipeline construye el artefacto desplegable (ej. un JAR ejecutable de Spring Boot o, más comúnmente, una imagen de Docker).
        * **Almacenamiento de Artefactos**: El artefacto se sube a un repositorio centralizado (ej. Docker Hub para imágenes, Nexus/Artifactory para JARs).
        * **Despliegue a Entornos**: El pipeline orquesta el despliegue del artefacto en diferentes entornos (desarrollo, pruebas, staging, producción). Esto puede implicar:
            * Actualizar un clúster de Kubernetes con la nueva imagen.
            * Ejecutar un script de despliegue en un servidor virtual.
            * Actualizar una función Serverless.
        * **Validación Post-Despliegue**: Después del despliegue, se pueden ejecutar pruebas de humo o chequeos de salud automatizados para asegurar que la aplicación arrancó correctamente y está respondiendo.
    * **Estrategias de Despliegue**: Los pipelines de CD pueden implementar estrategias avanzadas como:
        * **Despliegues Canary**: Desplegar la nueva versión solo a un pequeño porcentaje de usuarios para monitorear su comportamiento antes de un despliegue completo.
        * **Despliegues Blue/Green**: Mantener dos entornos idénticos (uno con la versión antigua, otro con la nueva) y cambiar el tráfico al nuevo una vez que se valida.
        * **Despliegues por Fases**: Desplegar la nueva versión gradualmente a diferentes grupos de servidores o regiones.
    * **Beneficios**: Despliegues más rápidos y frecuentes, reducción de errores en producción, menor tiempo de inactividad, mayor satisfacción del cliente.

La automatización de pruebas y despliegues es lo que convierte un pipeline de CI/CD en una máquina de entrega de software de alta velocidad y calidad. Es un principio central de DevOps que permite a los equipos innovar más rápido y con mayor confianza.
''',
    'code_example': r'''
# Ejemplos conceptuales de Automatización de Pruebas y Despliegues en un Pipeline CI/CD

# Este bloque se basa en los Jenkinsfile y GitHub Actions del subtema anterior,
# detallando cómo se ejecutarían las pruebas y el despliegue automatizado.

# 1. Automatización de Pruebas (ya incluida en los ejemplos anteriores, pero enfatizando)

# En un Jenkinsfile (dentro de la etapa 'Test'):
/*
        stage('Test') {
            steps {
                echo 'Running unit and integration tests...'
                // Ejecuta todas las pruebas de Maven, incluyendo Spring Boot tests
                sh 'mvn test'
                // Opcional: Generar reporte de cobertura de código
                junit '**/target/surefire-reports/*.xml' // Publica resultados de JUnit
                jacoco agent: 'pre-main', destFile: 'target/jacoco.exec', html: 'target/site/jacoco' // Publica cobertura JaCoCo
                echo 'Running SonarCloud analysis...'
                // Ejecuta el análisis estático
                withSonarQubeEnv('SonarQubeServer') { // Configura SonarQube en Jenkins
                    sh 'mvn sonar:sonar'
                }
            }
        }
*/

# En un Workflow de GitHub Actions (dentro del job 'build-and-test'):
/*
      - name: Run Unit and Integration Tests
        run: mvn test

      - name: Run SonarCloud Analysis
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
        run: mvn -B verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar

      - name: Code Coverage Report (example with JaCoCo)
        # Assuming JaCoCo is configured in your pom.xml to generate report
        # You might use an action like `madrapps/jacoco-report@v1` for easy publishing
        run: |
          echo "Generate JaCoCo report if not already part of 'mvn test'"
          # mvn jacoco:report
          # ls target/site/jacoco/jacoco.xml
*/

# 2. Automatización de Despliegues

# a. Ejemplo de Despliegue en Kubernetes (dentro de un Jenkinsfile o GitHub Actions)

# En un Jenkinsfile (dentro de la etapa 'Deploy to Staging/Production'):
/*
        stage('Deploy to Staging') {
            steps {
                echo "Deploying to Kubernetes Staging..."
                // Ejecutar comandos kubectl para actualizar el despliegue
                // Asume que kubectl está configurado en el agente de Jenkins
                withCredentials([kubeconfig(credentialsId: 'k8s-staging-kubeconfig', context: 'my-staging-cluster')]) {
                    sh "kubectl set image deployment/my-springboot-app my-springboot-app=${DOCKER_IMAGE}:${DOCKER_TAG} -n staging-namespace"
                    sh "kubectl rollout status deployment/my-springboot-app -n staging-namespace --timeout=300s"
                    sh "kubectl get pods -n staging-namespace -l app=my-springboot-app"
                }
                echo "Running smoke tests after deployment..."
                // Aquí podrías ejecutar pruebas de humo (ej. cURL a un endpoint /health)
                sh "curl -f http://staging.my-app.com/actuator/health"
            }
        }
*/

# En un Workflow de GitHub Actions (dentro del job 'deploy'):
/*
      - name: Configure Kubeconfig
        uses: azure/k8s-set-context@v3 # Ejemplo para Azure Kubernetes Service
        with:
          method: kubeconfig
          kubeconfig: ${{ secrets.K8S_KUBECONFIG_PROD }} # Secreto con el contenido del kubeconfig

      - name: Deploy to Production Kubernetes
        run: |
          echo "Updating Kubernetes deployment for production..."
          # Reemplaza la imagen en el deployment existente
          kubectl set image deployment/my-springboot-app my-springboot-app=${{ secrets.DOCKER_USERNAME }}/my-springboot-app:${{ github.sha }} -n production-namespace
          # Espera a que el rollout del despliegue se complete
          kubectl rollout status deployment/my-springboot-app -n production-namespace --timeout=300s
          echo "Deployment successful. Running post-deployment health check..."
          # Ejecutar un chequeo de salud del endpoint
          curl -f http://prod.my-app.com/actuator/health
*/

# b. Ejemplo de despliegue en un servidor VM con SSH (conceptual)

# En un Jenkinsfile (dentro de una etapa de despliegue):
/*
        stage('Deploy to VM') {
            steps {
                echo "Deploying to VM via SSH..."
                // Usa un plugin SSH para ejecutar comandos remotos
                sshagent(credentials: ['ssh-server-credentials-id']) {
                    sh 
                        ssh user@your-vm-ip "
                            sudo systemctl stop my-springboot-app
                            sudo rm /opt/my-app/app.jar
                            sudo curl -L -o /opt/my-app/app.jar http://your-nexus-repo/my-springboot-app.jar # Descargar nuevo JAR
                            sudo systemctl start my-springboot-app
                            sudo systemctl status my-springboot-app
                        "
                    
                }
            }
        }
*/

# Incorrecto (Fallas comunes en la automatización de pruebas/despliegues):
# - No ejecutar pruebas en cada cambio de código.
# - Desplegar sin pruebas de integración completas.
# - Depender de intervenciones manuales para el despliegue final.
# - No tener chequeos de salud o pruebas de humo después del despliegue.
# - Ausencia de estrategias de despliegue avanzadas para minimizar el riesgo en producción.
'''
  });
}
