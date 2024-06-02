import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/authentication/presentation/controllers/logout_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(logoutControllerProvider, (prev, next) {
      if (next is AsyncData) {
        print('User logged out');
        // context.goNamed(AppRoute.login.name);
      }

      if (next is AsyncLoading) {
        print('Loading...');
      }
    });

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(logoutControllerProvider.notifier).logout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
