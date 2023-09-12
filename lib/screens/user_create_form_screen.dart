// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';

class UserCreateFormScreen extends StatefulWidget {
  const UserCreateFormScreen({super.key});

  @override
  State<UserCreateFormScreen> createState() => _UserCreateFormScreenState();
}

class _UserCreateFormScreenState extends State<UserCreateFormScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {

                      final Map<String, dynamic> user = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "password": _passwordController.text,
                      };

                      await UserController().create(user);

                      Navigator.of(context).pop();
                    },
                    child: const Text('Salvar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
