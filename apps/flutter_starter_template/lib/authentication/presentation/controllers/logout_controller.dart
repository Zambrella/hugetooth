import 'package:flutter_starter_template/authentication/providers/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_controller.g.dart';

@riverpod
class LogoutController extends _$LogoutController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      final _ = await ref.watch(authenticationRepositoryProvider).logOut();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
