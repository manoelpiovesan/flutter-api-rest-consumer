import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserController().read(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                    title: Text(snapshot.data?[index]['name']),
                    subtitle: Text(snapshot.data?[index]['email']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await UserController()
                                .delete(snapshot.data?[index]['_id']);
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ));
              });
        });
  }
}
