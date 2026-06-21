import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h_smart/models/ac_unit.dart';
import 'package:logger/logger.dart';

class DeviceProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logger = Logger();

  List<ACUnit> _devices = [];
  bool _isLoading = false;
  String? _errorMessage;
  ACUnit? _selectedDevice;

  List<ACUnit> get devices => _devices;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ACUnit? get selectedDevice => _selectedDevice;

  // Status Summary
  int get operationalCount =>
      _devices.where((d) => d.status == 'operational').length;
  int get warningCount => _devices.where((d) => d.status == 'warning').length;
  int get criticalCount => _devices.where((d) => d.status == 'critical').length;
  int get totalCount => _devices.length;

  // Average Temperature
  double get averageTemperature {
    if (_devices.isEmpty) return 0;
    return _devices.fold<double>(
          0,
          (sum, device) => sum + device.temperature,
        ) /
        _devices.length;
  }

  Future<void> fetchDevices() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final snapshot = await _firestore.collection('AC_Units').get();
      _devices = snapshot.docs.map((doc) => ACUnit.fromFirestore(doc)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to fetch devices: $e';
      _isLoading = false;
      notifyListeners();
      logger.e('Fetch Devices Error: $e');
    }
  }

  Future<void> addDevice(ACUnit device) async {
    try {
      await _firestore
          .collection('AC_Units')
          .doc(device.deviceId)
          .set(device.toMap());
      _devices.add(device);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to add device: $e';
      notifyListeners();
      logger.e('Add Device Error: $e');
    }
  }

  Future<void> updateDevice(ACUnit device) async {
    try {
      await _firestore
          .collection('AC_Units')
          .doc(device.deviceId)
          .update(device.toMap());
      final index =
          _devices.indexWhere((d) => d.deviceId == device.deviceId);
      if (index != -1) {
        _devices[index] = device;
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to update device: $e';
      notifyListeners();
      logger.e('Update Device Error: $e');
    }
  }

  Future<void> deleteDevice(String deviceId) async {
    try {
      await _firestore.collection('AC_Units').doc(deviceId).delete();
      _devices.removeWhere((d) => d.deviceId == deviceId);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to delete device: $e';
      notifyListeners();
      logger.e('Delete Device Error: $e');
    }
  }

  void selectDevice(ACUnit device) {
    _selectedDevice = device;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
