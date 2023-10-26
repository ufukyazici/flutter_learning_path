import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User calculate', () {
    final users = [
      GenericUser(name: "name", id: 3, money: 10),
      GenericUser(name: "name", id: 3, money: 20),
      GenericUser(name: "name", id: 3, money: 30),
      GenericUser(name: "name", id: 3, money: 40),
    ];
    final result = UserManagement().calculateMoney(users);

    expect(result, 100);
  });
}
