import 'dart:convert';

import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager({required this.sharedManager});

  Future<void> saveItems(List<User> items) async {
    final items0 = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, items0);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringItems(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User(description: "", name: "", url: "");
      }).toList();
    }
    return null;
  }
}
