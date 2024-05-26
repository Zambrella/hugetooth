import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<SharedPreferences> sharedPreferences(
  SharedPreferencesRef ref,
) async {
  return SharedPreferences.getInstance();
}
