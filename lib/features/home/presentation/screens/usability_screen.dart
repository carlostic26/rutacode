import 'package:flutter/material.dart';

class UsabilityScreen extends StatelessWidget {
  const UsabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        title: const Text(
          'Usabilidad',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('¿Qué es RutaCode?'),
            _buildSectionContent(
                'RutaCode es una aplicación diseñada para vencer el sindrome del impostor mediante la gamificación, a traves de repasos por modulos de conocimiento sobre diversos lenguajes de programación o tecnologias, de manera estructurada y progresiva. '
                'La app te guía a través de diferentes niveles de conocimiento, desde conceptos básicos hasta avanzados, '
                'permitiéndote evaluar tu progreso mediante exámenes y seguimiento de puntajes.'),
            const SizedBox(height: 30),
            _buildSectionTitle('¿Por qué se creó?'),
            _buildSectionContent(
                'Esta aplicación fue desarrollada para solucionar problemas de aprendizajes fragmentados que muchos '
                'desarrolladores enfrentan al aprender alguna tecnologia. Ofrece una ruta de aprendizaje clara, con contenido '
                'organizado y evaluaciones que miden tu comprensión real de los conceptos.'),
            const SizedBox(height: 30),
            _buildSectionTitle('Estructura de aprendizaje'),
            _buildFeatureItem(Icons.star, 'Módulos de conocimiento',
                'Jr, Mid y Sr según tu conocimiento'),
            _buildFeatureItem(Icons.list, 'Tópicos',
                'Cada nivel contiene tópicos específicos'),
            _buildFeatureItem(Icons.subject, 'Subtópicos',
                'Divisiones detalladas de cada tópico'),
            _buildFeatureItem(Icons.code, 'Detalle',
                'Explicación teórica + ejemplos de código'),
            const SizedBox(height: 30),
            _buildSectionTitle('Cómo usar la app'),
            _buildStepItem('1', 'Elige un lenguaje y un módulo inicial'),
            _buildStepItem('2', 'Explora los tópicos y subtópicos'),
            _buildStepItem('3', 'Estudia la teoría y los ejemplos'),
            _buildStepItem('4', 'Toma los exámenes finales'),
            _buildStepItem('5', 'Revisa tus resultados y mejora'),
            const SizedBox(height: 20),
            _buildSectionTitle('Sistema de puntajes'),
            _buildSectionContent(
                'Al completar actividades y exámenes ganarás puntos que reflejan tu dominio de cada módulo. '
                'Estos puntos se acumulan y puedes ver tu progreso en la sección "Mis Puntajes".'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
