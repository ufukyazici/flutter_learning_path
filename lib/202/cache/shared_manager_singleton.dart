import 'package:shared_preferences/shared_preferences.dart';

enum SharedManagerSingletonKeys { counter, users }

class SharedManagerSingleton {
  SharedManagerSingleton._();

  SharedPreferences? _preferences;

  static final SharedManagerSingleton instance = SharedManagerSingleton._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedManagerSingletonKeys key, String value) async {
    await _preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedManagerSingletonKeys key, List<String> value) async {
    await _preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(SharedManagerSingletonKeys key) {
    return _preferences?.getStringList(key.name);
  }

  String? getString(SharedManagerSingletonKeys key) {
    return _preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedManagerSingletonKeys key) async {
    return (await _preferences?.remove(key.name)) ?? false;
  }
}
