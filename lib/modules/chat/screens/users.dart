import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// External libraries
import 'package:pull_to_refresh/pull_to_refresh.dart';
// Providers
import 'package:flutter_02_chat/modules/auth/providers/_providers.dart';
// Widgets
import 'package:flutter_02_chat/modules/chat/widgets/_widgets.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          authProvider.getUsername,
          style: const TextStyle(color: Colors.blueAccent),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const SizedBox(
          child: Icon(
            Icons.check_circle,
            color: Color.fromARGB(255, 60, 223, 65),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.blueAccent),
            onPressed: () {
              authProvider.logout();
              Navigator.pushReplacementNamed(context, "login");
            },
          )
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        header: const WaterDropHeader(
          complete: Icon(Icons.check),
          waterDropColor: Colors.blue,
        ),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => const FriendsList(),
        ),
      ),
    );
  }

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // TODO: Call the data
    refreshController.refreshCompleted();
  }
}
