import 'dart:math';
import 'package:flutter/material.dart';

class TutorialPageWidget extends StatelessWidget {
  const TutorialPageWidget({
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
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
                          'Elige un área o lenguaje de programación, luego avanza a través de 3 módulos de conocimiento en seniority, con información, ejemplos y evaluaciones para un aprendizaje completo y efectivo sobre cualquier tema seleccionado.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
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
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Stack(
                children: [
                  //flecha 1
                  Positioned(
                    left: widthScreen * 0.3,
                    top: heightScreen * 0.1,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: widthScreen * 0.4,
                        height: heightScreen * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.5,
                            image: AssetImage(
                                'assets/icons/flecha_level_tutorial.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //flecha 2
                  Positioned(
                    left: widthScreen * 0.3,
                    top: heightScreen * 0.25,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Container(
                        width: widthScreen * 0.4,
                        height: heightScreen * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.2,
                            image: AssetImage(
                                'assets/icons/flecha_level_tutorial.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //first level
                  Positioned(
                    left: widthScreen * 0.1,
                    top: heightScreen * 0.06,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Junior',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: widthScreen * 0.3,
                          height: heightScreen * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/jr_dev.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //second level
                  Positioned(
                    right: widthScreen * 0.13,
                    top: heightScreen * 0.22,
                    child: Container(
                      width: widthScreen * 0.3,
                      height: heightScreen * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/middle_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // opacity and text
                  Positioned(
                    right: widthScreen * 0.13,
                    top: heightScreen * 0.22,
                    child: Container(
                      width: widthScreen * 0.3,
                      height: heightScreen * 0.1,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black54,
                      ),
                      child: const Center(
                        child: Text(
                          'Middle',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  //third level
                  Positioned(
                    left: widthScreen * 0.1,
                    bottom: heightScreen * 0.18,
                    child: Container(
                      width: widthScreen * 0.3,
                      height: heightScreen * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sr_dev.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // opacity and text
                  Positioned(
                    left: widthScreen * 0.1,
                    bottom: heightScreen * 0.18,
                    child: Container(
                      width: widthScreen * 0.3,
                      height: heightScreen * 0.1,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black54,
                      ),
                      child: const Center(
                        child: Text(
                          'Senior',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
