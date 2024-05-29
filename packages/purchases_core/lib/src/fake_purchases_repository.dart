import 'dart:async';
import 'dart:developer';

import 'package:purchases_core/purchases_core.dart';

/// Fake implementation of purchases repository
class FakePurchasesRepository implements PurchasesRepository {
  bool _isInitialized = false;
  // ignore: unused_field
  bool _isDebugMode = true;
  bool _overrideIsSubscribed = false;
  // ignore: unused_field
  bool _isAndroid = false;
  bool _isLoggedIn = false;
  String? _userId;

  final _controller = StreamController<UserSubscription>.broadcast();

  static final _fakeUserSubscription = UserSubscription(
    isSubscribed: true,
    expirationDate: DateTime.now()..add(const Duration(days: 7)),
    subscriptionType: 'Premium',
    willRenew: true,
  );

  /// A list of 2 fake packages
  static const fakePackages = <SubscriptionPackage>[
    SubscriptionPackage(
      duration: SubscriptionLength.oneMonth,
      subscriptionType: 'Premium',
      identifier: 'com.fake.onemonth',
      name: 'One Month Premium',
      price: 3.99,
      discountedPrice: null,
      currencyCode: 'USD',
    ),
    SubscriptionPackage(
      duration: SubscriptionLength.oneYear,
      subscriptionType: 'Premium',
      identifier: 'com.fake.oneyear',
      name: 'One Year Premium',
      price: 33.99,
      discountedPrice: 29.99,
      currencyCode: 'USD',
    ),
  ];

  @override
  Future<List<SubscriptionPackage>> fetchSubscriptionPackages() async {
    log('Fetching subscription packages...');
    await Future<void>.delayed(const Duration(seconds: 1));
    return Future.value(fakePackages);
  }

  @override
  Stream<UserSubscription> getActiveSubscription() {
    if (_isInitialized) {
      return _controller.stream;
    } else {
      throw Exception('No initialised yet');
    }
  }

  @override
  Future<void> initService({
    required bool isDebugMode,
    required bool isAndroid,
    String? userId,
    bool isSubscribed = false,
  }) async {
    log('Initialising service...');
    await Future<void>.delayed(const Duration(seconds: 1));
    _isInitialized = true;
    _isDebugMode = isDebugMode;
    _isAndroid = isAndroid;
    _userId = userId;
    if (_userId != null) {
      _isLoggedIn = true;
    }
    _overrideIsSubscribed = isSubscribed;
    if (_isLoggedIn) {
      _controller.add(
        // ignore: lines_longer_than_80_chars
        _overrideIsSubscribed ? _fakeUserSubscription : const UserSubscription.empty(),
      );
    }
  }

  @override
  Future<void> login(String userId) async {
    log('Logging in...');
    await Future<void>.delayed(const Duration(seconds: 1));
    _userId = userId;
    _isLoggedIn = true;
    _controller.add(
      // ignore: lines_longer_than_80_chars
      _overrideIsSubscribed ? _fakeUserSubscription : const UserSubscription.empty(),
    );
  }

  @override
  Future<void> logout() async {
    log('Logging out...');
    await Future<void>.delayed(const Duration(seconds: 1));
    _userId = null;
    _isLoggedIn = false;
  }

  @override
  Future<void> purchaseSubscription(SubscriptionPackage package) async {
    log('Purchasing subscription...');
    await Future<void>.delayed(const Duration(seconds: 2));
    _controller.add(_fakeUserSubscription);
  }

  @override
  Future<void> refresh() async {
    log('Refreshing...');
    await Future<void>.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> restorePurchase() async {
    log('Refreshing subscription...');
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
