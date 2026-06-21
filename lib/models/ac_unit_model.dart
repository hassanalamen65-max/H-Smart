import 'package:cloud_firestore/cloud_firestore.dart';

class AcUnit {
  final String id;
  final String deviceId;
  final String deviceName;
  final String roomName;
  final double temperature;
  final double humidity;
  final double powerConsumption;
  final String status;
  final double performance;
  final String fanSpeed;
  final DateTime lastUpdate;

  AcUnit({
    required this.id,
    required this.deviceId,
    required this.deviceName,
    required this.roomName,
    required this.temperature,
    required this.humidity,
    required this.powerConsumption,
    required this.status,
    required this.performance,
    required this.fanSpeed,
    required this.lastUpdate,
  });

  factory AcUnit.fromMap(Map<String, dynamic> data, String id) {
    return AcUnit(
      id: id,
      deviceId: data['deviceId'] ?? '',
      deviceName: data['deviceName'] ?? '',
      roomName: data['roomName'] ?? '',
      temperature: (data['temperature'] ?? 0.0).toDouble(),
      humidity: (data['humidity'] ?? 0.0).toDouble(),
      powerConsumption: (data['powerConsumption'] ?? 0.0).toDouble(),
      status: data['status'] ?? 'inactive',
      performance: (data['performance'] ?? 0.0).toDouble(),
      fanSpeed: data['fanSpeed'] ?? 'auto',
      lastUpdate: (data['lastUpdate'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'roomName': roomName,
      'temperature': temperature,
      'humidity': humidity,
      'powerConsumption': powerConsumption,
      'status': status,
      'performance': performance,
      'fanSpeed': fanSpeed,
      'lastUpdate': Timestamp.fromDate(lastUpdate),
    };
  }
}
