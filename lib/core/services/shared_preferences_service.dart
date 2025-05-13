import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  Future<void> markExamAsCompleted(String examName) async {
    await _prefs.setBool('$examName-completed', true);
  }

  Future<bool> isExamCompleted(String examName) async {
    return _prefs.getBool('$examName-completed') ?? false;
  }
}
