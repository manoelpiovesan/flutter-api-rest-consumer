import 'package:api_rest_front_flutter/utils/app_routes.dart';
import 'package:api_rest_front_flutter/widgets/app_drawer.dart';
import 'package:api_rest_front_flutter/widgets/user_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CREATE_USER_FORM);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('Usuários'),
      ),
      drawer: const AppDrawer(),
      body: const UserListWidget(),
    );
  }
}
