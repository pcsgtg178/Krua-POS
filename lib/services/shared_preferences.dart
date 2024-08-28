import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  Preference._privateConstructor();

  static Preference? _instance;

  static Future<Preference> get instance async {
    if (_instance == null) {
      _instance = Preference._privateConstructor();
      await _instance!._init();
    }
    return _instance!;
  }

  SharedPreferences? _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  

  Future<String?> getValue(String key) async {
    return _prefs?.getString(key);
  }

  Future<void> setValue(String key, String? value) async {
    if (value == null) return;
    await _prefs?.setString(key, value);
  }
}