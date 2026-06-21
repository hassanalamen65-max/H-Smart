import 'package:cloud_firestore/cloud_firestore.dart';

class ACUnit {
  final String deviceId;
  final String deviceName;
  final String roomName;
  final double temperature;
  final double humidity;
  final double powerUsage;
  final String status; // operational, warning, critical
  final double performance;
  final String fanSpeed;
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
      status: data['status'] ?? 'operational',
      performance: (data['performance'] ?? 0).toDouble(),
      fanSpeed: data['fanSpeed'] ?? 'Low',
      lastUpdate: (data['lastUpdate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
  }
}
