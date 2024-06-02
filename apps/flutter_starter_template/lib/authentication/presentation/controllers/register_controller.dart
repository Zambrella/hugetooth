import 'package:analytics_core/analytics_core.dart';
import 'package:flutter_starter_template/logging/providers/logger_provider.dart';
import 'package:flutter_starter_template/repository_providers.dart';
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
      final _ = await ref.watch(authRepositoryProvider).signUp(
            email: '1234@test.com',
            password: '123456',
          );
      await ref.watch(analyticsRepositoryProvider).logCustomEvent(
            RegisterCustomEvent(email: '1234@test.com'),
          );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

class RegisterCustomEvent extends CustomAnalyticsEvent {
  RegisterCustomEvent({required String email}) : super('register', parameters: {'email': email});
}
