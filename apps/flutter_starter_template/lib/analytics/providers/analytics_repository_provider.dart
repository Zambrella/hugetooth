import 'package:flutter_starter_template/analytics/domain/analytics_repository.abs.dart';
import 'package:flutter_starter_template/analytics/repository/analytics_repository.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_repository_provider.g.dart';

@riverpod
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  return const AnalyticsRepositoryImpl();
}
