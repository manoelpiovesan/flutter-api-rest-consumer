import 'package:api_rest_front_flutter/screens/home_screen.dart';
import 'package:api_rest_front_flutter/screens/user_create_form_screen.dart';
import 'package:api_rest_front_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.amber,
        ),
      ),
      home: const HomeScreen(),

      routes: {
        AppRoutes.CREATE_USER_FORM: (ctx) => const UserCreateFormScreen(),
      },
    );
  }
}
