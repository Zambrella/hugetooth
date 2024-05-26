import 'package:flutter_starter_template/analytics/domain/analytics_event.dart';
import 'package:flutter_starter_template/analytics/domain/analytics_repository.abs.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  const AnalyticsRepositoryImpl();

  @override
  Future<void> logEvent(AnalyticsEvent event) {
    // TODO: implement logEvent
    throw UnimplementedError();
  }
}
