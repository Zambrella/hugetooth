class AnalyticsEvent {
  const AnalyticsEvent(
    this.name, {
    required this.parameters,
    this.userId,
  });

  final String name;
  final String? userId;
  final Map<String, dynamic> parameters;
}
