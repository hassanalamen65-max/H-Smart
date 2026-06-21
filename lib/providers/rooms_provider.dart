import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/room_model.dart';
import '../config/constants/app_constants.dart';

class RoomsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Room> _rooms = [];
  bool _isLoading = false;
  String? _error;
  StreamSubscription? _subscription;

  List<Room> get rooms => _rooms;
  bool get isLoading => _isLoading;
  String? get error => _error;

  double get averageTemperature {
    if (_rooms.isEmpty) return 0;
    return _rooms.fold(0.0, (sum, room) => sum + room.averageTemperature) / _rooms.length;
  }

  void startListeningToRooms() {
    _subscription = _firestore
        .collection(AppConstants.roomsCollection)
        .snapshots()
        .listen((snapshot) {
      _rooms = snapshot.docs.map((doc) => Room.fromMap(doc.data(), doc.id)).toList();
      notifyListeners();
    });
  }

  Room? getRoomByName(String roomName) {
    try {
      return _rooms.firstWhere((room) => room.roomName == roomName);
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
