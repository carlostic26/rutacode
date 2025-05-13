import 'package:flutter/material.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });

  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightScreen * 0.28,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Imagen de fondo
              Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.5),
              ),

              // Degradado tipo Netflix
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(213, 0, 0, 0),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Texto encima del degradado
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
                        ).createShader(bounds),
                        child: const Text(
                          'Bienvenido a RutaCode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const Text(
                        'Tu guía de rutas para repasar o aprender programación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: heightScreen * 0.05),

        // Tarjeta con características
        Center(
          child: Container(
            width: widthScreen * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              children: [
                _buildFeatureItem(
                    '🌍', 'Repasa cualquier lenguaje de programación'),
                const Divider(color: Colors.white24, height: 20),
                _buildFeatureItem('🧭', 'Rutas adaptadas a tu nivel actual'),
                const Divider(color: Colors.white24, height: 20),
                _buildFeatureItem('🚦', 'Contenido para Junior, Mid y Senior'),
                const Divider(color: Colors.white24, height: 20),
                _buildFeatureItem(
                    '💡', 'Aprende, practica y evalúa tu conocimiento'),
              ],
            ),
          ),
        ),

        SizedBox(height: heightScreen * 0.03),

        // Texto final
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'De la sintaxis básica a conceptos avanzados\n'
            'Tu viaje de aprendizaje comienza ahora',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        SizedBox(height: heightScreen * 0.05),
      ],
    );
  }

  Widget _buildFeatureItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
