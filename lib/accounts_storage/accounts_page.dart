import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts Storage"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              "assets/png/lock.png",
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text("Add Account")),
    );
  }
}
