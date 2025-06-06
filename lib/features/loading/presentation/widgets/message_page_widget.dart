import 'dart:math';
import 'package:flutter/material.dart';

class MessagePageWidget extends StatelessWidget {
  const MessagePageWidget({
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
          height: heightScreen * 0.35,
          child: Stack(
            fit: StackFit.expand,
            children: [
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.indigoAccent, Colors.indigo],
                        ).createShader(bounds),
                        child: const Text(
                          '\nRutaCode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'Puedes medir tus conocimientos en pruebas técnicas simuladas, sin importar si eres principiante, intermedio o avanzado.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            'Repasemos y mejoremos tu nivel de conocimientos juntos.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: widthScreen, // Ancho total del conjunto de imágenes
          height: heightScreen *
              0.42, // Altura suficiente para las imágenes rotadas
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Segunda imagen (girada a la derecha)
              Positioned(
                right: widthScreen * 0.12,
                child: Transform.rotate(
                  angle: 0.15, // Más rotación
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(-5, 5),
                        )
                      ],
                    ),
                    child: Image.network(
                      'https://blogger.googleusercontent.com/img/a/AVvXsEjNljI6W-7vSeSd8OdBRJ8itGrrpAJ5qXJWOLsxhr-vFV84YCssIOXM2-pvEYnV-2chdGB0-WOimOEx-Pua1DGtBQgr3NM2OvI-n9f6Vnru9rf2RUm6MULAHZZnWmByaTgjNNHTQyu4ks8kNh_3M1bu_XGEO6aEAeN6h5PLmByuLGRZ5pdiOgXsF5z-pw=w205-h400',
                      width: widthScreen * 0.44,
                      height: heightScreen * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Primera imagen (girada a la izquierda)
              Positioned(
                left: widthScreen * 0.12,
                child: Transform.rotate(
                  angle: -0.15, // Más rotación
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(5, 5),
                        )
                      ],
                    ),
                    child: Image.network(
                      'https://blogger.googleusercontent.com/img/a/AVvXsEiHawtsoA1mDy2OyYavAU0bZsbKvBs_TH4A3Bs6gWM0bBaytYK_F5ZqHhjS9uxrwDbEJ-ZgHgfo02kZC80nLRPTHTg2xrSTZGZQJxhGv4X2RRpRQ6RzSwDwyraMAJjPAvriw_KEievhqVDsUVRnOOdJA2TLHlyP-ll-peabsg5OvNQNBKE9K-O7ZO5AjA=w210-h400',
                      width: widthScreen * 0.44,
                      height: heightScreen * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
