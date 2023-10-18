import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/accounts_storage/account_model.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final List<AccountModel> accounts = [
    AccountModel(
        username: "haydar123",
        password: "haydar123",
        mail: "haydar123@gmail.com",
        mailPassword: "haydar123",
        rank: "ascendant1",
        dob: "01.01.1999"),
    AccountModel(
        username: "haydar123",
        password: "haydar123",
        mail: "haydar123@gmail.com",
        mailPassword: "haydar123",
        rank: "ascendant1",
        dob: "01.01.1999"),
    AccountModel(
        username: "haydar123",
        password: "haydar123",
        mail: "haydar123@gmail.com",
        mailPassword: "haydar123",
        rank: "ascendant1",
        dob: "01.01.1999"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: const Text("Add Account")),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset("assets/png/${accounts[index].rank}.png"),
              title: Text("${accounts[index].username}"),
              subtitle: Text("${accounts[index].mail}"),
              trailing: Wrap(children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text:
                              "Username : ${accounts[index].username} | Password : ${accounts[index].password}} | Mail : ${accounts[index].mail} | Mail Password : ${accounts[index].mailPassword} | Rank : ${accounts[index].rank} | Date of Birth : ${accounts[index].dob}"));
                    },
                    icon: const Icon(Icons.copy_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outlined))
              ]),
            ),
          );
        },
      ),
    );
  }
}
