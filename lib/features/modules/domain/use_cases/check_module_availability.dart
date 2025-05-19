// lib/features/home/domain/use_cases/check_module_availability.dart
import 'package:rutacode/core/services/shared_preferences_service.dart';

class CheckModuleAvailability {
  final SharedPreferencesService sharedPreferencesService;

  CheckModuleAvailability(this.sharedPreferencesService);

  Future<bool> isModuleEnabled(String moduleName) async {
    switch (moduleName) {
      case 'Jr':
        return true; // El módulo JR siempre está disponible
      case 'Mid':
        return await sharedPreferencesService.isExamCompleted('Jr');
      case 'Sr':
        return await sharedPreferencesService.isExamCompleted('Mid');
      default:
        return false;
    }
  }
}
