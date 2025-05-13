import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definimos un enum para las secciones
enum AppBarSection { definition, code }

// Creamos un StateProvider para manejar la sección activa
final appBarSectionProvider = StateProvider<AppBarSection>(
  (ref) => AppBarSection.definition, // Estado inicial: "Definición"
);

// Provider para el PageController
final pageControllerItemsProvider = Provider<PageController>((ref) {
  final controller = PageController(initialPage: 0);
  ref.onDispose(() => controller.dispose());
  return controller;
});

// Provider para el PageController
final pageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController(initialPage: 0);
  ref.onDispose(() => controller.dispose());
  return controller;
});
