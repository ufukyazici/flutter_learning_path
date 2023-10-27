class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement({required this.admin});
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int initialValue = admin.role == 1 ? admin.money : 0;
    // int sum = 0;
    // for (var money in users) {
    //   sum += money.money;
    // }
    // final sumMoney = users.map((e) => e.money).fold(0, (previousValue, element) => previousValue + element);
    final sumMoney2 = users.fold(initialValue, (previousValue, element) => previousValue + element.money);
    return sumMoney2;
  }

  Iterable<R>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => e.name);
      return names.cast<R>();
    }
    return null;
  }
}

class UYModel<T> {
  final String name = 'uy';
  final List<T> items;

  UYModel({required this.items});
}

class GenericUser {
  final String name;
  final int id;
  final int money;

  GenericUser({required this.name, required this.id, required this.money});
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(this.role, {required super.name, required super.id, required super.money});
}
