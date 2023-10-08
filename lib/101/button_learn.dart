import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            }
            return Colors.green;
          })),
          child: const Text("Save"),
        ),
        const ElevatedButton(onPressed: null, child: Text("Load")),
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.abc_sharp),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red, shape: const CircleBorder()),
            onPressed: () {},
            child: const Icon(Icons.access_alarm)),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm),
            label: const Text("Alarm Calıyor")),
        InkWell(
            onTap: () {},
            child: Text(
              "Button",
              style: Theme.of(context).textTheme.titleMedium,
            )),
        Container(
          height: 100,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 40, right: 40),
              child: Text("Place Bid",
                  style: Theme.of(context).textTheme.headlineMedium),
            )),
      ]),
    );
  }
}

// Borders:
// CircleBorder(),RoundedRectangleBorder()