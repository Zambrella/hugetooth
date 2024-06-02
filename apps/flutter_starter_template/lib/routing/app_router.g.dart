// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'4d4a64789d9662c6b4ef7fbba3311d8dd6505132';

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

/// See also [goRouter].
@ProviderFor(goRouter)
const goRouterProvider = GoRouterFamily();

/// See also [goRouter].
class GoRouterFamily extends Family<GoRouter> {
  /// See also [goRouter].
  const GoRouterFamily();

  /// See also [goRouter].
  GoRouterProvider call(
    Flavor flavor,
  ) {
    return GoRouterProvider(
      flavor,
    );
  }

  @override
  GoRouterProvider getProviderOverride(
    covariant GoRouterProvider provider,
  ) {
    return call(
      provider.flavor,
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
  String? get name => r'goRouterProvider';
}

/// See also [goRouter].
class GoRouterProvider extends Provider<GoRouter> {
  /// See also [goRouter].
  GoRouterProvider(
    Flavor flavor,
  ) : this._internal(
          (ref) => goRouter(
            ref as GoRouterRef,
            flavor,
          ),
          from: goRouterProvider,
          name: r'goRouterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$goRouterHash,
          dependencies: GoRouterFamily._dependencies,
          allTransitiveDependencies: GoRouterFamily._allTransitiveDependencies,
          flavor: flavor,
        );

  GoRouterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.flavor,
  }) : super.internal();

  final Flavor flavor;

  @override
  Override overrideWith(
    GoRouter Function(GoRouterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GoRouterProvider._internal(
        (ref) => create(ref as GoRouterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        flavor: flavor,
      ),
    );
  }

  @override
  ProviderElement<GoRouter> createElement() {
    return _GoRouterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GoRouterProvider && other.flavor == flavor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, flavor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GoRouterRef on ProviderRef<GoRouter> {
  /// The parameter `flavor` of this provider.
  Flavor get flavor;
}

class _GoRouterProviderElement extends ProviderElement<GoRouter>
    with GoRouterRef {
  _GoRouterProviderElement(super.provider);

  @override
  Flavor get flavor => (origin as GoRouterProvider).flavor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
