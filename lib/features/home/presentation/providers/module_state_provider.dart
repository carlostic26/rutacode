import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/core/providers/shared_preferences_provider.dart';

final moduleStateProvider = FutureProvider<Map<String, bool>>((ref) async {
  final isInitialized = ref.read(sharedPreferencesInitializedProvider);
  if (!isInitialized) {
    throw Exception('SharedPreferencesServiceProvider not initialized');
  }

  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);

  final isJrCompleted = await sharedPreferencesService.isExamCompleted('Jr');
  final isMidCompleted = await sharedPreferencesService.isExamCompleted('Mid');
  final isSrCompleted = await sharedPreferencesService.isExamCompleted('Sr');

  return {
    'Jr': true, // El módulo Jr siempre está habilitado
    'Mid': isJrCompleted, // Mid depende de Jr
    'Sr': isMidCompleted, // Sr depende de Mid
  };
});
