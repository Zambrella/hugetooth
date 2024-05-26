import 'package:flutter_starter_template/authentication/domain/authentication_repository.abs.dart';
import 'package:flutter_starter_template/authentication/repository/authentication_repository.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
  AuthenticationRepositoryRef ref,
) {
  return AuthenticationRepositoryImpl();
}
