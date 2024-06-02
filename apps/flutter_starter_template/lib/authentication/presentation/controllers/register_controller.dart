import 'package:flutter_starter_template/authentication/providers/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> register() async {
    state = const AsyncLoading();
    try {
      final _ = await ref.watch(authenticationRepositoryProvider).signUp(
            email: '1234@test.com',
            password: '123456',
          );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
