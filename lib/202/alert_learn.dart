import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/form_learn_view.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const _UpdateDialog();
            },
          );
          if (result == true) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const FormLearnView();
              },
            ));
          }
        },
        child: const Icon(Icons.show_chart),
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Version update"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("UPDATE")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'))
      ],
    );
  }
}

class UpdateDialog extends AlertDialog {
   UpdateDialog({super.key,required BuildContext context})
  :super(
    key: key,
    title: const Text("Version update"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("UPDATE")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'))
      ],
    );
  )
    
}
