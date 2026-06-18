import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String alertId;
  final String deviceId;
  final String title;
  final String description;
  final String severity;
  final DateTime timestamp;
  final bool resolved;

  Alert({
    required this.alertId,
    required this.deviceId,
    required this.title,
    required this.description,
    required this.severity,
    required this.timestamp,
    required this.resolved,
  });

  factory Alert.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Alert(
      alertId: doc.id,
      deviceId: data['deviceId'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      severity: data['severity'] ?? 'Info',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      resolved: data['resolved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'deviceId': deviceId,
    'title': title,
    'description': description,
    'severity': severity,
    'timestamp': Timestamp.fromDate(timestamp),
    'resolved': resolved,
  };

  Alert copyWith({
    String? alertId,
    String? deviceId,
    String? title,
    String? description,
    String? severity,
    DateTime? timestamp,
    bool? resolved,
  }) {
    return Alert(
      alertId: alertId ?? this.alertId,
      deviceId: deviceId ?? this.deviceId,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      timestamp: timestamp ?? this.timestamp,
      resolved: resolved ?? this.resolved,
    );
  }
}
