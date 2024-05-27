import 'package:auth_core/auth_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@riverpod
AuthRepository authenticationRepository(
  AuthenticationRepositoryRef ref,
) {
  return FakeAuthRepository();
}
