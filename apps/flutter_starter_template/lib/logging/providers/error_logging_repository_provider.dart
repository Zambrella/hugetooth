import 'package:error_logging_core/error_logging_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_logging_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ErrorLoggingRepository errorLoggingRepository(ErrorLoggingRepositoryRef ref) {
  return FakeErrorLoggingRepository();
}
