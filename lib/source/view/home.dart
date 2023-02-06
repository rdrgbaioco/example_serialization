import 'package:example_serialization/source/models/user.dart';
import 'package:example_serialization/source/repository/repository.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  final _users = ValueNotifier<List<User>>([]);
  final _repository = RepositoryImpl();

  @override
  Future<void> didChangeDependencies() async {
    final users = await _repository.getAllUsers();
    _users.value = users;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _users.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Serialization"),
      ),
      body: Center(
        child: ValueListenableBuilder<List<User>>(
          valueListenable: _users,
          builder: (context, users, child) {
            return RefreshIndicator(
              onRefresh: () async {
                final users = await _repository.getAllUsers();
                _users.value = users;
              },
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name ?? ""),
                    subtitle: Text(users[index].email ?? ""),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
