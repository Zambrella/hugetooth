import 'package:purchases_core/purchases_core.dart';

// TODO: Replace with localised strings
/// Extension methods for the [SubscriptionLength] enum.
extension SubscriptionLengthX on SubscriptionLength {
  /// Returns the name of the subscription length.
  String subscriptionLengthName() {
    switch (this) {
      case SubscriptionLength.oneWeek:
        return 'Weekly';
      case SubscriptionLength.oneMonth:
        return 'Monthly';
      case SubscriptionLength.twoMonths:
        return 'Bi-Monthly';
      case SubscriptionLength.threeMonths:
        return 'Quarterly';
      case SubscriptionLength.sixMonths:
        return 'Bi-Annual';
      case SubscriptionLength.oneYear:
        return 'Annual';
      case SubscriptionLength.unknown:
        return 'Unknown';
    }
  }

  /// Returns the length of the subscription that can be used as a suffix.
  String subscriptionLengthPer() {
    switch (this) {
      case SubscriptionLength.oneWeek:
        return 'week';
      case SubscriptionLength.oneMonth:
        return 'month';
      case SubscriptionLength.twoMonths:
        return 'two months';
      case SubscriptionLength.threeMonths:
        return 'three months';
      case SubscriptionLength.sixMonths:
        return 'six months';
      case SubscriptionLength.oneYear:
        return 'year';
      case SubscriptionLength.unknown:
        return 'error';
    }
  }
}
