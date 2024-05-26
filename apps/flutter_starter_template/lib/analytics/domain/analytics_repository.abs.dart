import 'package:flutter_starter_template/analytics/domain/analytics_event.dart';

abstract class AnalyticsRepository {
  const AnalyticsRepository();

  Future<void> logEvent(AnalyticsEvent event);
}
