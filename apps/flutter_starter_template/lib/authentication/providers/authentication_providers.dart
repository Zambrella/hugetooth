import 'package:auth_core/auth_core.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authenticationRepositoryProvider).getUser();
}

@Riverpod(keepAlive: true)
AppUser? currentUser(CurrentUserRef ref) {
  return ref.watch(authStateChangesProvider).value;
}
