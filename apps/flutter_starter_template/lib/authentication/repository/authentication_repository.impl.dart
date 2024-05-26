import 'package:flutter_starter_template/authentication/domain/app_user.dart';
import 'package:flutter_starter_template/authentication/domain/authentication_repository.abs.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Stream<AppUser?> get onAuthStateChanged => Stream.fromIterable(
        [
          const AppUser(
            id: '1',
            authMethod: AuthMethod.anonymous,
          ),
        ],
      );
}
