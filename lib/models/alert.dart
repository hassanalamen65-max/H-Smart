import 'package:cloud_firestore/cloud_firestore.dart';

class Alert {
  final String alertId;
  final String deviceId;
  final String roomName;
  final String severity; // warning, critical
  final String title;
  final String description;
  final DateTime createdAt;
  final bool resolved;
  final String? recommendedAction;

  Alert({
    required this.alertId,
    required this.deviceId,
    required this.roomName,
    required this.severity,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.resolved,
    this.recommendedAction,
  });

  factory Alert.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Alert(
      alertId: doc.id,
      deviceId: data['deviceId'] ?? '',
      roomName: data['roomName'] ?? '',
      severity: data['severity'] ?? 'warning',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      resolved: data['resolved'] ?? false,
      recommendedAction: data['recommendedAction'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'roomName': roomName,
      'severity': severity,
      'title': title,
      'description': description,
      'createdAt': Timestamp.fromDate(createdAt),
      'resolved': resolved,
      'recommendedAction': recommendedAction,
    };
  }
}
