import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              showCustomSheet(context, const ListViewLearn());
            },
            child: const Text("show")),
      ),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            builder: (context) {
              return _SheetExample(backgroundColor: _backgroundColor);
            },
          );
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.deepOrange;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class _SheetExample extends StatefulWidget {
  const _SheetExample({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);

  @override
  State<_SheetExample> createState() => _SheetExampleState();
}

class _SheetExampleState extends State<_SheetExample> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Divider(
                    color: Colors.black26,
                    thickness: 3,
                    indent: MediaQuery.of(context).size.width * 0.45,
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                      right: 10,
                      top: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        ),
                      ))
                ],
              ),
            ),
            const Text("data"),
            Image.network(
              "https://picsum.photos/200",
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.yellow;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text("send"))
          ],
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return _CustomMainSheet(child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _BaseSheetHeader(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Colors.black26,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
              right: 10,
              top: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              ))
        ],
      ),
    );
  }
}
