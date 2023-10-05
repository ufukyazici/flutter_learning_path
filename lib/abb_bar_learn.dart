import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String title = 'Welcome Back';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        // transparan yapar
        backgroundColor: Colors.transparent,
        // gölgeyi kaldırır
        elevation: 0,
        // sistem işaretleri rengini değiştirir
        systemOverlayStyle: SystemUiOverlayStyle.light,
        // actions tema ayarları.
        actionsIconTheme: const IconThemeData(color: Colors.red),

        // sol taraf icin
        leading: const Icon(Icons.chevron_left),
        // sag taraf icin
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          //yükleme işareti

          const Center(
              child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ))
        ],
      ),
    );
  }
}
