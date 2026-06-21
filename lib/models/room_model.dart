class Room {
  final String id;
  final String roomName;
  final String status;
  final double averageTemperature;
  final int totalDevices;
  final int activeDevices;
  final int warningDevices;
  final int criticalDevices;

  Room({
    required this.id,
    required this.roomName,
    required this.status,
    required this.averageTemperature,
    required this.totalDevices,
    required this.activeDevices,
    required this.warningDevices,
    required this.criticalDevices,
  });

  factory Room.fromMap(Map<String, dynamic> data, String id) {
    return Room(
      id: id,
      roomName: data['roomName'] ?? '',
      status: data['status'] ?? 'ok',
      averageTemperature: (data['averageTemperature'] ?? 0.0).toDouble(),
      totalDevices: data['totalDevices'] ?? 0,
      activeDevices: data['activeDevices'] ?? 0,
      warningDevices: data['warningDevices'] ?? 0,
      criticalDevices: data['criticalDevices'] ?? 0,
    );
  }
}
