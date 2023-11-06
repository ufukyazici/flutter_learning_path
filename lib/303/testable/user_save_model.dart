import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getData(String key, SharedPreferences preferences) {
    final result = preferences.getString(key);
    if (result?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
