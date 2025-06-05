import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  Future<void> markExamAsCompleted(String language, String module) async {
    await _prefs.setBool('$language-$module-completed', true);
  }

  Future<bool> isExamCompleted(String language, String module) async {
    return _prefs.getBool('$language-$module-completed') ?? false;
  }
}
