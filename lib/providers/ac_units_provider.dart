import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ac_unit_model.dart';
import '../config/constants/app_constants.dart';

class AcUnitsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<AcUnit> _acUnits = [];
  bool _isLoading = false;
  String? _error;
  StreamSubscription? _subscription;

  List<AcUnit> get acUnits => _acUnits;
  bool get isLoading => _isLoading;
  String? get error => _error;

  int get activeCount => _acUnits.where((u) => u.status == 'active').length;
  int get warningCount => _acUnits.where((u) => u.temperature >= 24 && u.temperature < 27).length;
  int get criticalCount => _acUnits.where((u) => u.temperature >= 27).length;

  void startListeningToAcUnits() {
    _subscription = _firestore
        .collection(AppConstants.acUnitsCollection)
        .snapshots()
        .listen((snapshot) {
      _acUnits = snapshot.docs.map((doc) => AcUnit.fromMap(doc.data(), doc.id)).toList();
      notifyListeners();
    });
  }

  List<AcUnit> getUnitsByRoom(String roomName) {
    return _acUnits.where((unit) => unit.roomName == roomName).toList();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
