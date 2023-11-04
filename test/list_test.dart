import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_application_1/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("Best of List", () {
    List<GenericUser> users = [
      GenericUser(name: "ali", id: 3, money: 10),
      GenericUser(name: "veli", id: 3, money: 20),
      GenericUser(name: "sülü", id: 3, money: 30),
      GenericUser(name: "recep", id: 3, money: 40),
    ];
    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split("").toList());
    }).toList();
    users.singleWhere((element) => element.name == "veli");
  });
}
