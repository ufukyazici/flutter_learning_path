import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSingleton {
  SharedPreferences? _preferences;

  SharedSingleton._();

  static final SharedSingleton instance = SharedSingleton._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await _preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    await _preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(SharedKeys key) {
    return _preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    return _preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await _preferences?.remove(key.name)) ?? false;
  }
}
