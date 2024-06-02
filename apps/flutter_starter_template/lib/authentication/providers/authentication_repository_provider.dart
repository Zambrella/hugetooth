import 'package:auth_core/auth_core.dart';
import 'package:flutter_starter_template/authentication/repository/fake_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authenticationRepository(AuthenticationRepositoryRef ref) {
  return FakeAuthRepository();
}
