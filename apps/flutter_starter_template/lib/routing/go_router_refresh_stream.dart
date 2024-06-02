import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This class was imported from the migration guide for GoRouter 5.0
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// A [ChangeNotifier] wrapper around a [StreamProvider] that notifiers listeners when the stream emits a value.
class GoRouterRefreshStreamProvider extends ChangeNotifier {
  GoRouterRefreshStreamProvider(StreamProvider<dynamic> streamProvider, Ref ref) {
    ref.watch(streamProvider).whenData((_) {
      notifyListeners();
    });
  }
}
