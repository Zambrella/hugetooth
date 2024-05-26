import 'package:flutter_starter_template/authentication/domain/app_user.dart';

abstract class AuthenticationRepository {
  Stream<AppUser?> get onAuthStateChanged;
}
