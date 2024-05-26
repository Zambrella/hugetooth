import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_starter_template/flavors.dart';
import 'package:flutter_starter_template/logging/domain/logging_repository.abs.dart';
import 'package:logger/logger.dart';

class AppLogFilter extends LogFilter {
  AppLogFilter(this._flavor);

  final Flavor _flavor;

  @override
  bool shouldLog(LogEvent event) {
    if (_flavor == Flavor.dev || _flavor == Flavor.staging) {
      return true;
    } else if (event.level.value >= Level.error.value) {
      return true;
    } else {
      return false;
    }
  }
}

class AppLogOutput extends LogOutput {
  AppLogOutput(this._loggingRepository);

  final LoggingRepository _loggingRepository;

  @override
  void output(OutputEvent event) {
    if (event.level.value >= Level.error.value) {
      unawaited(
        _loggingRepository
            .logException(
          event.origin.message.toString(),
          error: event.origin.error,
          stackTrace: event.origin.stackTrace,
        )
            .catchError((_) {
          debugPrint('Failed to log exception');
        }),
      );
    }
    for (final line in event.lines) {
      debugPrint(line);
    }
  }
}
