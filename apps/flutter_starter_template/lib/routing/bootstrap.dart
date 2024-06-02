// ignore:depend_on_referenced_packages
import 'package:error_logging_core/error_logging_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/analytics/providers/analytics_repository_provider.dart';
import 'package:flutter_starter_template/app.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_repository_provider.dart';
import 'package:flutter_starter_template/flavors.dart';
import 'package:flutter_starter_template/logging/app_logging/logger_config.dart';
import 'package:flutter_starter_template/logging/app_logging/provider_logger.dart';
import 'package:flutter_starter_template/logging/providers/error_logging_repository_provider.dart';
import 'package:flutter_starter_template/logging/providers/logger_provider.dart';
import 'package:flutter_starter_template/purchases/providers/purchases_repository_provider.dart';
import 'package:flutter_starter_template/repository_providers.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bootstrap.g.dart';

Future<void> bootstrap(Flavor flavor) async {
  //* turn off the # in the URLs on the web
  usePathUrlStrategy();

  final loggingRepository = FakeErrorLoggingRepository();

  final logger = Logger(
    filter: AppLogFilter(flavor),
    printer: PrettyPrinter(
      methodCount: 0,
    ),
    output: AppLogOutput(loggingRepository),
  );

  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers(logger);

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(logger),
      ],
      overrides: [
        loggerProvider.overrideWithValue(logger),
      ],
      child: App(
        appFlavor: flavor,
      ),
    ),
  );
}

void registerErrorHandlers(Logger logger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    logger.e(
      'Uncaught flutter error: ${details.exception}',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    logger.e('Platform error: $error', error: error, stackTrace: stack);
    return true;
  };

  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    logger.w(
      'Error building widget: ${details.exception}',
      error: details.exception,
      stackTrace: details.stack,
    );
    //? I think this should just be a widget, not a whole page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

/// This provider is used to initialize the app.
/// It should be watched in the same widget as the [MaterialApp] (or before).
/// All asynchronous app initialization code should belong here
/// including any future providers we want to access synchronously in the
/// future.
/// Providers that may change their state should not be eagerly initialized,
/// as this may trigger unwanted rebuilds.
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref, Flavor appFlavor) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref
      ..invalidate(sharedPreferencesProvider)
      ..invalidate(errorLoggingRepositoryProvider)
      ..invalidate(analyticsRepositoryProvider)
      ..invalidate(purchasesRepositoryProvider);
  });

  final logger = ref.read(loggerProvider);
  // ignore: cascade_invocations
  logger.i('Starting app initialization');

  // Simulating a long startup time
  await Future<void>.delayed(const Duration(seconds: 5));

  // ----- All asynchronous app initialization code should belong here -----
  await ref.watch(sharedPreferencesProvider.future);

  // Initialize services
  await ref.read(errorLoggingRepositoryProvider).init();
  await ref.read(analyticsRepositoryProvider).init();
  await ref.read(purchasesRepositoryProvider).init(isDebugMode: kDebugMode);

  logger.i('App initialization complete');
}
