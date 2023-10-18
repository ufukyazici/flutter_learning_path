import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/accounts_storage/account_model.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _mailPasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(labelText: "Username")),
                      TextField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: "Password")),
                      TextField(
                          controller: _mailController,
                          decoration: const InputDecoration(labelText: "Mail")),
                      TextField(
                          controller: _mailPasswordController,
                          decoration: const InputDecoration(
                              labelText: "Mail Password")),
                      TextField(
                          controller: _dobController,
                          decoration: const InputDecoration(
                              labelText: "Date of birth")),
                      DropdownButtonFormField(
                        value: "Diamond-1",
                        items: const [
                          DropdownMenuItem(
                              value: "Diamond-1", child: Text("Diamond-1")),
                          DropdownMenuItem(
                              value: "Diamond-2", child: Text("Diamond-2")),
                          DropdownMenuItem(
                              value: "Diamond-3", child: Text("Diamond-3")),
                          DropdownMenuItem(
                              value: "Ascendant-1", child: Text("Ascendant-1")),
                          DropdownMenuItem(
                              value: "Ascendant-2", child: Text("Ascendant-2")),
                          DropdownMenuItem(
                              value: "Ascendant-3", child: Text("Ascendant-3")),
                          DropdownMenuItem(
                              value: "Immortal-1", child: Text("Immortal-1")),
                          DropdownMenuItem(
                              value: "Immortal-2", child: Text("Immortal-2")),
                          DropdownMenuItem(
                              value: "Immortal-3", child: Text("Immortal-3")),
                        ],
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.save_outlined),
                            label: const Text("Save")),
                      )
                    ],
                  ),
                );
              },
            );
          },
          label: const Text("Add Account")),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.black12,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                leading: Image.asset("assets/png/${accounts[index].rank}.png"),
                title: Text("${accounts[index].username}"),
                subtitle: Text("${accounts[index].mail}"),
                trailing: Wrap(children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text:
                                "Username : ${accounts[index].username} | Password : ${accounts[index].password}} | Mail : ${accounts[index].mail} | Mail Password : ${accounts[index].mailPassword} | Rank : ${accounts[index].rank} | Date of Birth : ${accounts[index].dob}"));
                      },
                      icon: const Icon(Icons.copy_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete_outlined))
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
