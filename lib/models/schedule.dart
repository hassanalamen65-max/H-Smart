import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  final String scheduleId;
  final String deviceId;
  final TimeOfDay startTime;
  final TimeOfDay stopTime;
  final List<String> days;
  final double targetTemperature;
  final bool enabled;
  final DateTime createdAt;

  Schedule({
    required this.scheduleId,
    required this.deviceId,
    required this.startTime,
    required this.stopTime,
    required this.days,
    required this.targetTemperature,
    required this.enabled,
    required this.createdAt,
  });

  factory Schedule.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final startTimeStr = data['startTime'] ?? '00:00';
    final stopTimeStr = data['stopTime'] ?? '00:00';
    
    return Schedule(
      scheduleId: doc.id,
      deviceId: data['deviceId'] ?? '',
      startTime: _parseTime(startTimeStr),
      stopTime: _parseTime(stopTimeStr),
      days: List<String>.from(data['days'] ?? []),
      targetTemperature: (data['targetTemperature'] ?? 24).toDouble(),
      enabled: data['enabled'] ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
    'deviceId': deviceId,
    'startTime': '${startTime.hour}:${startTime.minute}',
    'stopTime': '${stopTime.hour}:${stopTime.minute}',
    'days': days,
    'targetTemperature': targetTemperature,
    'enabled': enabled,
    'createdAt': Timestamp.fromDate(createdAt),
  };

  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    if (parts.length == 2) {
      return TimeOfDay(
        hour: int.tryParse(parts[0]) ?? 0,
        minute: int.tryParse(parts[1]) ?? 0,
      );
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }
}

class TimeOfDay {
  final int hour;
  final int minute;

  const TimeOfDay({required this.hour, required this.minute});
}
