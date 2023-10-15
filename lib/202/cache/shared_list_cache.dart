import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_cache/user_cache_manager.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  late final UserCacheManager userCacheManager;

  @override
  void initState() {
    super.initState();
    userCacheManager = UserCacheManager(sharedManager: SharedManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      body: _UserListView(),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView();

  final List<User> users = Users().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].description),
            trailing: Text(users[index].url,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}
