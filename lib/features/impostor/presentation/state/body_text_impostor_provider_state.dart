import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleTextImpostorProvider = Provider<String>((ref) {
  return 'No eres exactamente lo que crees.';
});

final bodyTextImpostorProvider = Provider<String>((ref) {
  return 'Según Asana 2025, +60% de los programadores sienten que siempre les falta algo. Especialmente quienes están comenzando o llevan pocos años en esto.\n\nEntiende: el síndrome del impostor se debilita cuando tu mente logra ver con claridad una ruta, un camino, una estructura. Para eso hicimos esta app. Ya construimos las rutas por ti. Las tienes en cada sección del inicio.\n\nLo único que necesitas hacer es lo siguiente: si eres principiante, intermedio o avanzado, debes asegurarte de que dominas lo fundamental de cada tecnología, entra al módulo Junior de la ruta que elijas, repasa y avanza.Recorre todos los temas y apunta al 100%. Observa como va creciendo tu progreso en la gráfica de puntajes. Cuando llegues a ese 100%, algo bueno va a pasar en tu cabeza: ese monstruo llamado síndrome del impostor va a empezar a marchitarse.\n\nDespués de eso, sigue con el módulo Middle. Luego, el Senior.\n\nRecuerda: esto va de visualizar el todo. Tener claridad. Entender dónde estás y hacia dónde puedes ir.\nY si no sabes algo, al menos ahora sabes qué es lo que no sabes. Eso es avanzar, y asi se combate el problema.\n\nTodo depende de ti. La app está gamificada para ayudarte con eso. No esperes a que alguien más derrote ese monstruo por ti.';
});
