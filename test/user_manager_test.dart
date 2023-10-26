import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser(name: "ali", id: 3, money: 10),
      GenericUser(name: "veli", id: 3, money: 20),
      GenericUser(name: "sülü", id: 3, money: 30),
      GenericUser(name: "recep", id: 3, money: 40),
    ];
    final result = UserManagement(admin: AdminUser(1, name: "name", id: 3, money: 20)).calculateMoney(users);
    final adminUser = UserManagement(admin: AdminUser(1, name: "name", id: 3, money: 33));
    final response = adminUser.showNames<String>(users);
    print(response);
    expect(result, 120);
  });
}
