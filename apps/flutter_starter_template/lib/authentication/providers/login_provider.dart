import 'package:flutter_starter_template/app_dependencies.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_providers.dart';
import 'package:flutter_starter_template/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<void> login(LoginRef ref) async {
  final userId = ref.read(currentUserProvider)?.id;
  if (userId == null) {
    throw AssertionError('User is not logged in and this function should not be called');
  }
  await ref.read(purchasesRepositoryProvider).setUserId(userId);
  await ref.read(errorLoggingRepositoryProvider).setUserId(userId);
  await ref.read(analyticsRepositoryProvider).setUserId(userId);
}
