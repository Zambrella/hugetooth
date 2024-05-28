import 'package:error_logging_core/src/error_logging_repository.abs.dart';

/// {@template fake_error_logging_repository}
/// {@endtemplate}
class FakeErrorLoggingRepository implements ErrorLoggingRepository {
  /// {@macro fake_error_logging_repository}
  FakeErrorLoggingRepository();

  final List<String> _loggedMessages = [];
  final List<String> _loggedExceptions = [];
  String? _userId;
  bool _loggingEnabled = false;

  @override
  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) async {
    // ignore: avoid_print, lines_longer_than_80_chars
    print('Logging exception: $message, error: $error, stackTrace: $stackTrace');
    _loggedExceptions.add(message);
  }

  @override
  Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
  }) async {
    // ignore: avoid_print
    print('Logging message: $message, stackTrace: $stackTrace');
    _loggedMessages.add(message);
  }

  @override
  Future<void> enableLogging({required bool enable}) async {
    _loggingEnabled = enable;
    // ignore: avoid_print
    print('Logging enabled: $_loggingEnabled');
  }

  @override
  Future<void> setUserId(String userId) async {
    _userId = userId;
    // ignore: avoid_print
    print('Setting user ID: $_userId');
  }

  /// Dumps the logs and user ID to a string.
  String dumpLogs() {
    // ignore: lines_longer_than_80_chars
    return 'Logged messages: $_loggedMessages\nLogged exceptions: $_loggedExceptions\nUser ID: $_userId\nLogging enabled: $_loggingEnabled';
  }
}
