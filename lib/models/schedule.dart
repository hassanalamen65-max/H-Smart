import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  final String scheduleId;
  final String deviceId;
  final String deviceName;
  final DateTime startTime;
  final DateTime stopTime;
  final List<String> operatingDays; // 'Monday', 'Tuesday', etc.
  final double targetTemperature;
  final bool isActive;
  final DateTime createdAt;

  Schedule({
    required this.scheduleId,
    required this.deviceId,
    required this.deviceName,
    required this.startTime,
    required this.stopTime,
    required this.operatingDays,
    required this.targetTemperature,
    required this.isActive,
    required this.createdAt,
  });

  factory Schedule.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Schedule(
      scheduleId: doc.id,
      deviceId: data['deviceId'] ?? '',
      deviceName: data['deviceName'] ?? '',
      startTime: (data['startTime'] as Timestamp).toDate(),
      stopTime: (data['stopTime'] as Timestamp).toDate(),
      operatingDays: List<String>.from(data['operatingDays'] ?? []),
      targetTemperature: (data['targetTemperature'] ?? 22).toDouble(),
      isActive: data['isActive'] ?? true,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'startTime': Timestamp.fromDate(startTime),
      'stopTime': Timestamp.fromDate(stopTime),
      'operatingDays': operatingDays,
      'targetTemperature': targetTemperature,
      'isActive': isActive,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
