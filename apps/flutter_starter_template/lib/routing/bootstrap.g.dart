// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootstrap.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartupHash() => r'1ab8e3032111ed0e7931a9236d9b3a1dc19e46e2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// This provider is used to initialize the app.
/// It should be watched in the same widget as the [MaterialApp] (or before).
/// All asynchronous app initialization code should belong here
/// including any future providers we want to access synchronously in the
/// future.
/// Providers that may change their state should not be eagerly initialized,
/// as this may trigger unwanted rebuilds.
///
/// Copied from [appStartup].
@ProviderFor(appStartup)
const appStartupProvider = AppStartupFamily();

/// This provider is used to initialize the app.
/// It should be watched in the same widget as the [MaterialApp] (or before).
/// All asynchronous app initialization code should belong here
/// including any future providers we want to access synchronously in the
/// future.
/// Providers that may change their state should not be eagerly initialized,
/// as this may trigger unwanted rebuilds.
///
/// Copied from [appStartup].
class AppStartupFamily extends Family<AsyncValue<void>> {
  /// This provider is used to initialize the app.
  /// It should be watched in the same widget as the [MaterialApp] (or before).
  /// All asynchronous app initialization code should belong here
  /// including any future providers we want to access synchronously in the
  /// future.
  /// Providers that may change their state should not be eagerly initialized,
  /// as this may trigger unwanted rebuilds.
  ///
  /// Copied from [appStartup].
  const AppStartupFamily();

  /// This provider is used to initialize the app.
  /// It should be watched in the same widget as the [MaterialApp] (or before).
  /// All asynchronous app initialization code should belong here
  /// including any future providers we want to access synchronously in the
  /// future.
  /// Providers that may change their state should not be eagerly initialized,
  /// as this may trigger unwanted rebuilds.
  ///
  /// Copied from [appStartup].
  AppStartupProvider call(
    Flavor appFlavor,
  ) {
    return AppStartupProvider(
      appFlavor,
    );
  }

  @override
  AppStartupProvider getProviderOverride(
    covariant AppStartupProvider provider,
  ) {
    return call(
      provider.appFlavor,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appStartupProvider';
}

/// This provider is used to initialize the app.
/// It should be watched in the same widget as the [MaterialApp] (or before).
/// All asynchronous app initialization code should belong here
/// including any future providers we want to access synchronously in the
/// future.
/// Providers that may change their state should not be eagerly initialized,
/// as this may trigger unwanted rebuilds.
///
/// Copied from [appStartup].
class AppStartupProvider extends FutureProvider<void> {
  /// This provider is used to initialize the app.
  /// It should be watched in the same widget as the [MaterialApp] (or before).
  /// All asynchronous app initialization code should belong here
  /// including any future providers we want to access synchronously in the
  /// future.
  /// Providers that may change their state should not be eagerly initialized,
  /// as this may trigger unwanted rebuilds.
  ///
  /// Copied from [appStartup].
  AppStartupProvider(
    Flavor appFlavor,
  ) : this._internal(
          (ref) => appStartup(
            ref as AppStartupRef,
            appFlavor,
          ),
          from: appStartupProvider,
          name: r'appStartupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appStartupHash,
          dependencies: AppStartupFamily._dependencies,
          allTransitiveDependencies:
              AppStartupFamily._allTransitiveDependencies,
          appFlavor: appFlavor,
        );

  AppStartupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appFlavor,
  }) : super.internal();

  final Flavor appFlavor;

  @override
  Override overrideWith(
    FutureOr<void> Function(AppStartupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppStartupProvider._internal(
        (ref) => create(ref as AppStartupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appFlavor: appFlavor,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _AppStartupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppStartupProvider && other.appFlavor == appFlavor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appFlavor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppStartupRef on FutureProviderRef<void> {
  /// The parameter `appFlavor` of this provider.
  Flavor get appFlavor;
}

class _AppStartupProviderElement extends FutureProviderElement<void>
    with AppStartupRef {
  _AppStartupProviderElement(super.provider);

  @override
  Flavor get appFlavor => (origin as AppStartupProvider).appFlavor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
