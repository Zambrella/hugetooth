import 'package:flutter/material.dart';
import 'package:flutter_starter_template/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(AppRoute.login.name);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
