import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get wrongPassword => 'Wrong password';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get userDisabled => 'Your account has been disabled';

  @override
  String get userNotFound => 'Account not found';

  @override
  String get emailInUse => 'Email is already in use';

  @override
  String get weakPassword => 'Password is too weak';

  @override
  String get invalidCredential => 'Information provided is invalid';

  @override
  String get requiredReauthentication => 'You need to reauthenticate';

  @override
  String get unknownAuthError => 'An unknown error occurred';

  @override
  String get unknownError => 'An unknown error occurred';
}
