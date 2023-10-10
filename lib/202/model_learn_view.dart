import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/model_learn.dart';

class ModelLearn extends StatefulWidget {
  const ModelLearn({super.key});

  @override
  State<ModelLearn> createState() => _ModelLearnState();
}

class _ModelLearnState extends State<ModelLearn> {
  final user1 = PostModel1();
  final user2 = PostModel2(1, 1, "title", "body2");
  final user3 = PostModel3(1, 2, "title3", "body3");
  final user4 = PostModel4(userId: 1, id: 2, title: "title4", body: "body4");
  final user5 = PostModel5(userId: 1, id: 2, title: "title5", body: "body5");
  final user6 = PostModel6(userId: 1, id: 2, title: "title6", body: "body6");
  final user7 = PostModel7(id: 1, body: "body7", title: "asdas");
  var user8 = PostModel8(userId: 0, id: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user8 = user8.copyWith(body: "ARTIK VAR");
        });
      }),
      body: Column(
        children: [
          Text(user2.body),
          Text(user3.body),
          Text(user4.body),
          Text(user5.userId.toString()),
          Text(user7.title),
          Text(user8.body ?? "NO DATA")
        ],
      ),
    );
  }
}
