import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String id;
  final String alertId;
  final String deviceId;
  final String roomName;
  final String severity;
  final String title;
  final String description;
  final String recommendedAction;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  final bool isResolved;

  Alert({
    required this.id,
    required this.alertId,
    required this.deviceId,
    required this.roomName,
    required this.severity,
    required this.title,
    required this.description,
    required this.recommendedAction,
    required this.createdAt,
    this.resolvedAt,
    this.isResolved = false,
  });

  factory Alert.fromMap(Map<String, dynamic> data, String id) {
    return Alert(
      id: id,
      alertId: data['alertId'] ?? '',
      deviceId: data['deviceId'] ?? '',
      roomName: data['roomName'] ?? '',
      severity: data['severity'] ?? 'warning',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      recommendedAction: data['recommendedAction'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      resolvedAt: (data['resolvedAt'] as Timestamp?)?.toDate(),
      isResolved: data['isResolved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alertId': alertId,
      'deviceId': deviceId,
      'roomName': roomName,
      'severity': severity,
      'title': title,
      'description': description,
      'recommendedAction': recommendedAction,
      'createdAt': Timestamp.fromDate(createdAt),
      'resolvedAt': resolvedAt != null ? Timestamp.fromDate(resolvedAt!) : null,
      'isResolved': isResolved,
    };
  }
}
