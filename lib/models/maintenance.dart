import 'package:cloud_firestore/cloud_firestore.dart';

class MaintenanceRecord {
  final String maintenanceId;
  final String deviceId;
  final String type;
  final String description;
  final DateTime performedAt;
  final String? performedBy;
  final String status;
  final String? notes;

  MaintenanceRecord({
    required this.maintenanceId,
    required this.deviceId,
    required this.type,
    required this.description,
    required this.performedAt,
    this.performedBy,
    required this.status,
    this.notes,
  });

  factory MaintenanceRecord.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MaintenanceRecord(
      maintenanceId: doc.id,
      deviceId: data['deviceId'] ?? '',
      type: data['type'] ?? '',
      description: data['description'] ?? '',
      performedAt: (data['performedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      performedBy: data['performedBy'],
      status: data['status'] ?? 'Pending',
      notes: data['notes'],
    );
  }

  Map<String, dynamic> toMap() => {
    'deviceId': deviceId,
    'type': type,
    'description': description,
    'performedAt': Timestamp.fromDate(performedAt),
    'performedBy': performedBy,
    'status': status,
    'notes': notes,
  };
}
