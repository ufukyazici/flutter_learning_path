import 'package:collection/collection.dart';
import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("Best of List", () {
    List<GenericUser> users = [
      const GenericUser(name: "ali", id: 3, money: 10),
      const GenericUser(name: "veli", id: 3, money: 20),
      const GenericUser(name: "sülü", id: 3, money: 30),
      const GenericUser(name: "recep", id: 3, money: 40),
    ];
    // List<HighCard> highCards = users.map((e) {
    //   return HighCard(items: e.name.split("").toList());
    // }).toList();
    try {
      final response = users.singleWhere(
        (element) => element.checkUserExists("veli11"),
        orElse: () {
          return const GenericUser(name: "name", id: 0, money: 0);
        },
      );
      print(response);
    } catch (e) {
      print(e);
    }
    print("${users.where((element) => element.money > 25)}");
    users.addAll([const GenericUser(name: "name", id: 5, money: 3)]);
    users.lastWhere((element) => element.name == "name");
    users.take(5);
    users.removeWhere((element) => element.name == "name");
    users.removeAt(2);
    users.remove(const GenericUser(name: "name", id: 5, money: 3));
    users.indexOf(const GenericUser(name: "name", id: 5, money: 3));
    users.indexWhere((element) => element.id == 5);
    users.map((e) => e.money).where((element) => element > 10);
    users.expand((element) => [const GenericUser(name: "name", id: 6, money: 33)]);
  });

  test("Best of List with collection", () {
    List<GenericUser> users = [
      const GenericUser(name: "ali", id: 3, money: 10),
      const GenericUser(name: "veli", id: 3, money: 20),
      const GenericUser(name: "sülü", id: 3, money: 30),
      const GenericUser(name: "recep", id: 3, money: 40),
    ];
    try {
      final response = users.singleWhereOrNull((element) => element.checkUserExists("name"));
      print(response);
    } catch (e) {
      print(e);
    }

    users.forEachIndexed((index, element) {});
    users.lastWhereOrNull((element) => element.name == "name");
    users.sample(3);
    users.contains(const GenericUser(name: "name", id: 5, money: 3));
    users.any((element) => element.money > 5);
  });
}
