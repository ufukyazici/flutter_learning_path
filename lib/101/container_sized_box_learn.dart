import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Row(
        children: [
            const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/57.jpg"),),
          ),
          Container(width: 20,height: 20,color: Colors.red,margin: const EdgeInsets.all(100),child: const Text("sa"),)
          
        ],
      ),
    );
  }
}
