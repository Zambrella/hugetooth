import 'package:analytics_core/analytics_core.dart';
import 'package:auth_core/auth_core.dart';
import 'package:error_logging_core/error_logging_core.dart';
import 'package:flutter_starter_template/authentication/repository/fake_auth_repository.dart';
import 'package:purchases_core/purchases_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<SharedPreferences> sharedPreferences(
  SharedPreferencesRef ref,
) async {
  return SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
ErrorLoggingRepository errorLoggingRepository(ErrorLoggingRepositoryRef ref) {
  return FakeErrorLoggingRepository();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return FakeAuthRepository();
}

@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  return FakeAnalyticsRepository();
}

@Riverpod(keepAlive: true)
PurchasesRepository purchasesRepository(PurchasesRepositoryRef ref) {
  return FakePurchasesRepository();
}
