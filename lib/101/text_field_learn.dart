import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            // fillColor: Colors.white,
            // filled: true,
            // focus node textinputaction textfield aralarında klavyeden geçiş yapmamızı sağlıyor
            focusNode: focusNode1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formatter],
            maxLength: 20,
            buildCounter: (context, {int? currentLength, bool? isFocused, maxLength}) {
              return Row(
                children: [_animatedContainer(currentLength)],
              );
            },
            decoration: _InputDecorator().emailInput,
          ),
          TextField(
            focusNode: focusNode2,
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      alignment: Alignment.centerLeft,
      duration: const Duration(seconds: 1),
      width: 10.0 * (currentLength ?? 0),
      height: 10,
      color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    return newValue;
  });
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mail,
  );
}
