import 'package:analytics_core/analytics_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  return FakeAnalyticsRepository();
}
