class TemperatureModel {
  final String temperature;
  final String humidity;
  final bool switchStatus;
  final DateTime lastUpdateAt;

  TemperatureModel({
    required this.temperature,
    required this.humidity,
    required this.switchStatus,
    required this.lastUpdateAt,
  });

  factory TemperatureModel.fromMap(Map<String, dynamic> map) {
    return TemperatureModel(
      temperature: (map['temperature'] ?? '') as String,
      humidity: (map['humidity'] ?? '') as String,
      switchStatus: (map['switch_status'] ?? false) as bool,
      lastUpdateAt: DateTime.fromMillisecondsSinceEpoch(
        ((map['last_update_at'] ?? 0) as int) * 1000,
      ),
    );
  }
}
