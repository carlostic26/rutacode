// lib/core/providers/shared_preferences_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rutacode/common/core/services/shared_preferences_service.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) {
  throw UnimplementedError('SharedPreferencesServiceProvider not initialized');
});

final sharedPreferencesInitializedProvider =
    StateProvider<bool>((ref) => false);

Future<void> initializeSharedPreferences(WidgetRef ref) async {
  final prefs =
      await SharedPreferences.getInstance(); // Obtén SharedPreferences
  final service = SharedPreferencesService(prefs); // Crea el servicio
  sharedPreferencesServiceProvider
      .overrideWithValue(service); // Inicializa el provider
  ref.read(sharedPreferencesInitializedProvider.notifier).state =
      true; // Marca como inicializado
}
