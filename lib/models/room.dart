import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String roomId;
  final String roomName;
  final String status; // operational, warning, critical
  final double averageTemperature;
  final int totalDevices;

  Room({
    required this.roomId,
    required this.roomName,
    required this.status,
    required this.averageTemperature,
    required this.totalDevices,
  });

  factory Room.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Room(
      roomId: doc.id,
      roomName: data['roomName'] ?? '',
      status: data['status'] ?? 'operational',
      averageTemperature: (data['averageTemperature'] ?? 0).toDouble(),
      totalDevices: data['totalDevices'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roomName': roomName,
      'status': status,
      'averageTemperature': averageTemperature,
      'totalDevices': totalDevices,
    };
  }
}
