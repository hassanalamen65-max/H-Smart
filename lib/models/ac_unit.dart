import 'package:cloud_firestore/cloud_firestore.dart';

class ACUnit {
  final String deviceId;
  final String deviceName;
  final String roomName;
  final double temperature;
  final double humidity;
  final double powerUsage;
  final String status;
  final double performance;
  final int fanSpeed;
  final DateTime lastUpdate;

  ACUnit({
    required this.deviceId,
    required this.deviceName,
    required this.roomName,
    required this.temperature,
    required this.humidity,
    required this.powerUsage,
    required this.status,
    required this.performance,
    required this.fanSpeed,
    required this.lastUpdate,
  });

  factory ACUnit.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ACUnit(
      deviceId: data['deviceId'] ?? '',
      deviceName: data['deviceName'] ?? '',
      roomName: data['roomName'] ?? '',
      temperature: (data['temperature'] ?? 0).toDouble(),
      humidity: (data['humidity'] ?? 0).toDouble(),
      powerUsage: (data['powerUsage'] ?? 0).toDouble(),
      status: data['status'] ?? 'Operational',
      performance: (data['performance'] ?? 0).toDouble(),
      fanSpeed: data['fanSpeed'] ?? 0,
      lastUpdate: (data['lastUpdate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
    'deviceId': deviceId,
    'deviceName': deviceName,
    'roomName': roomName,
    'temperature': temperature,
    'humidity': humidity,
    'powerUsage': powerUsage,
    'status': status,
    'performance': performance,
    'fanSpeed': fanSpeed,
    'lastUpdate': Timestamp.fromDate(lastUpdate),
  };

  ACUnit copyWith({
    String? deviceId,
    String? deviceName,
    String? roomName,
    double? temperature,
    double? humidity,
    double? powerUsage,
    String? status,
    double? performance,
    int? fanSpeed,
    DateTime? lastUpdate,
  }) {
    return ACUnit(
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      roomName: roomName ?? this.roomName,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      powerUsage: powerUsage ?? this.powerUsage,
      status: status ?? this.status,
      performance: performance ?? this.performance,
      fanSpeed: fanSpeed ?? this.fanSpeed,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
