import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          // TODO: Go to chat
        },
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text("USER".substring(0, 2)),
            ),
            title: const Text('User'),
            subtitle: const Text("Subtitle"),
            trailing: const Icon(
              Icons.check_circle,
              color: Color.fromARGB(255, 60, 223, 65),
            ),
          ),
        ),
      ),
    );
  }
}
