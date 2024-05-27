import 'dart:async';

import 'package:auth_core/src/app_user.dart';
import 'package:auth_core/src/auth_method.dart';
import 'package:auth_core/src/auth_repository.abs.dart';
import 'package:auth_core/src/auth_social.dart';

/// A fake implementation of [AuthRepository] for testing.
class FakeAuthRepository implements AuthRepository {
  /// A fake implementation of [AuthRepository] for testing.
  FakeAuthRepository() {
    _currentUser = null;
    _userController = StreamController<AppUser?>.broadcast();
  }

  static final _fakeDelay = Future<void>.delayed(const Duration(seconds: 1));

  AppUser? _currentUser;
  late final StreamController<AppUser?> _userController;

  @override
  Future<void> deleteAccount() async {
    await _fakeDelay;
    _currentUser = null;
    _userController.add(_currentUser);
    return;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _fakeDelay;
    return;
  }

  @override
  Stream<AppUser?> getUser() {
    return _userController.stream;
  }

  @override
  Future<AppUser?> logIn({
    required String email,
    required String password,
  }) async {
    await _fakeDelay;
    final user = AppUser(
      email: email,
      authMethod: AuthMethod.email,
      id: 'fake_id',
      name: 'Fake User',
    );
    _currentUser = user;
    _userController.add(_currentUser);
    return user;
  }

  @override
  Future<AppUser?> logInWithSocial(AuthSocial socialMethod) async {
    await _fakeDelay;
    final user = AppUser(
      email: 'FakeEmail@test.com',
      authMethod: switch (socialMethod) {
        AuthSocial.facebook => AuthMethod.facebook,
        AuthSocial.google => AuthMethod.google,
        AuthSocial.apple => AuthMethod.apple,
      },
      id: 'fake_id',
      name: socialMethod.name,
    );
    _currentUser = user;
    _userController.add(_currentUser);
    return user;
  }

  @override
  Future<void> logOut() async {
    await _fakeDelay;
    _currentUser = null;
    _userController.add(_currentUser);
  }

  @override
  Future<AppUser?> signUp({
    required String email,
    required String password,
  }) async {
    await _fakeDelay;
    const user = AppUser(
      email: 'FakeEmail@test.com',
      authMethod: AuthMethod.email,
      id: 'fake_id',
      name: 'Fake User',
    );
    _currentUser = user;
    _userController.add(_currentUser);
    return user;
  }

  @override
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    await _fakeDelay;
    return;
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await _fakeDelay;
    return;
  }
}
