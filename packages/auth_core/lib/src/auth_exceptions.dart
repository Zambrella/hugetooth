/// {@template auth_exception}
/// Base class for all authentication exceptions.
/// {@endtemplate}
abstract class AuthException implements Exception {
  /// {@macro auth_exception}
  const AuthException(this.message, {this.stackTrace});

  /// A message describing the error.
  final String message;

  /// An optional stack trace for the error.
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

/// User provided a password that does not match the password on record.
sealed class WrongPasswordException extends AuthException {
  const WrongPasswordException({super.stackTrace}) : super('Wrong password');
}

/// User provided an invalid email.
sealed class InvalidEmailException extends AuthException {
  const InvalidEmailException({super.stackTrace}) : super('Invalid email');
}

/// User has been disabled so cannot be authenticated.
sealed class UserDisabledException extends AuthException {
  const UserDisabledException({super.stackTrace}) : super('User disabled');
}

/// User not found in the database when trying to log in.
sealed class UserNotFoundException extends AuthException {
  const UserNotFoundException({super.stackTrace}) : super('User not found');
}

/// Email is already in use by another account.
sealed class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException({super.stackTrace})
      : super(
          'Email already in use',
        );
}

/// Password is too weak.
sealed class WeakPasswordException extends AuthException {
  const WeakPasswordException({super.stackTrace}) : super('Weak password');
}

/// Thrown if the credential is malformed or has expired.
sealed class InvalidCredentialException extends AuthException {
  const InvalidCredentialException({super.stackTrace})
      : super(
          'Invalid credential',
        );
}

/// Thrown if the verification code provided is invalid.
sealed class InvalidVerificationCode extends AuthException {
  const InvalidVerificationCode({super.stackTrace})
      : super(
          'Invalid verification code',
        );
}

/// Thrown as a general authentication error that is not covered by any other.
sealed class UnknownAuthException extends AuthException {
  const UnknownAuthException(super.message, {super.stackTrace});
}
