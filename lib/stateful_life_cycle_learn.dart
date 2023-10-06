import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key, required this.message});
  final String message;

  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  String _message = "";
  late final bool _isOdd;
  // ekran çizilmeden önce initstateden sonra çalışır.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // eski veri ile yeni veri arasında fark olduğunda çalışır !!!!ÇOK ÖNEMLİ!!!!
  @override
  void didUpdateWidget(covariant LifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  // ekran değiştiğinde yani öldüğünde çağrılır aynı şekilde çok önemli
  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
  }

  void _computeName() {
    _isOdd == true ? (_message += " odd") : (_message += " even");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: Column(
        children: [ElevatedButton(onPressed: () {}, child: Text(_message))],
      ),
    );
  }
}
