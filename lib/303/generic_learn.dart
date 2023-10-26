class UserManagement {
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var money in users) {
      sum += money.money;
    }
    final sumMoney = users.map((e) => e.money).fold(0, (previousValue, element) => previousValue + element);
    final sumMoney2 = users.fold(0, (previousValue, element) => previousValue + element.money);
    print(sumMoney);
    print(sumMoney2);
    return sum;
  }
}

class GenericUser {
  final String name;
  final int id;
  final int money;

  GenericUser({required this.name, required this.id, required this.money});
}
