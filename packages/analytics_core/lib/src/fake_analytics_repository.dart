import 'package:analytics_core/analytics_core.dart';

/// A fake implementation of [AnalyticsRepository] for testing.
class FakeAnalyticsRepository implements AnalyticsRepository {
  /// A fake implementation of [AnalyticsRepository] for testing.
  FakeAnalyticsRepository()
      : _userId = null,
        _serverLocation = null,
        _enabled = false;

  String? _userId;
  ServerLocation? _serverLocation;
  bool? _enabled;
  final Map<String, dynamic> _userProperties = {};
  final Map<String, dynamic> _events = {};

  @override
  Future<void> enableAnalytics({required bool enable}) async {
    _enabled = enable;
  }

  @override
  Future<void> init({
    String? userId,
    ServerLocation? serverLocation,
    bool? enabled,
  }) async {
    _userId = userId;
    _serverLocation = serverLocation;
    _enabled = enabled;
  }

  @override
  Future<bool> isEnabled() async {
    return Future.value(_enabled ?? false);
  }

  @override
  Future<void> logCustomEvent(CustomAnalyticsEvent event) async {
    _events[event.eventName] = event.parameters;
  }

  @override
  Future<void> setServerLocation(ServerLocation location) async {
    _serverLocation = location;
  }

  @override
  Future<void> setUserId(String userId) async {
    _userId = userId;
  }

  @override
  Future<void> setUserProperty(UserProperty userProperty) async {
    _userProperties[userProperty.name] = userProperty.value;
  }

  @override
  Future<void> unsetUserId() async {
    _userId = null;
    _userProperties.clear();
    _events.clear();
    _enabled = false;
    _serverLocation = null;
  }

  /// Returns a string representation of the data stored.
  String dump() {
    // ignore: lines_longer_than_80_chars
    return 'userId: $_userId, serverLocation: $_serverLocation, enabled: $_enabled, userProperties: $_userProperties, events: $_events';
  }
}
