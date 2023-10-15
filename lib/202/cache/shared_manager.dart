import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(SharedKeys key) {
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await preferences?.remove(key.name)) ?? false;
  }
}
