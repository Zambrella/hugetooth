abstract class LoggingRepository {
  const LoggingRepository();

  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  });

  Future<void> logMessage(String message, {StackTrace? stackTrace});
}
