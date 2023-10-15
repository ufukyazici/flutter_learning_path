import 'dart:convert';

import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager({required this.sharedManager});

  Future<void> saveItems(List<User> items) async {
    final itemsList = items.map((e) => jsonEncode(e.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, itemsList);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringItems(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((e) {
        final jsonObject = jsonDecode(e);
        return User(name: "name", description: "description", url: "url");
      }).toList();
    }
    return null;
  }
}
