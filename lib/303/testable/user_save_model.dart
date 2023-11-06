import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getData(String key, IStore preferences) {
    final result = preferences.getString(key);
    return result;
  }
}

abstract class IStore {
  bool getString(String key);
}

class SharedPrefStore extends IStore {
  final SharedPreferences preferences;

  SharedPrefStore(this.preferences);
  @override
  bool getString(String key) {
    final result = preferences.getString(key);
    if (result?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}

class MockStore extends IStore {
  @override
  bool getString(String key) {
    return false;
  }
}
