import 'package:auth_core/src/auth_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// {@template app_user}
/// A class representing a user of the application.
/// Can be serialized to/from JSON.
/// {@endtemplate}
@freezed
class AppUser with _$AppUser {
  /// {@macro app_user}
  const factory AppUser({
    required String id,
    required AuthMethod authMethod,
    String? email,
    String? name,
    String? photoUrl,
  }) = _AppUser;

  /// Converts a [Map<String, dynamic>] to an [AppUser].
  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(
        json,
      );
}
