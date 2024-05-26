import 'package:flutter_starter_template/logging/domain/logging_repository.abs.dart';

class LoggingRepositoryImpl implements LoggingRepository {
  const LoggingRepositoryImpl();

  @override
  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> logMessage(String message, {StackTrace? stackTrace}) {
    // TODO: implement logMessage
    throw UnimplementedError();
  }
}
