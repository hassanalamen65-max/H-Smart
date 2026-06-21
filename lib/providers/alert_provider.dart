import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h_smart/models/alert.dart';
import 'package:logger/logger.dart';

class AlertProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logger = Logger();

  List<Alert> _alerts = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Alert> get alerts => _alerts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Alert Counts
  int get unreadAlerts => _alerts.where((a) => !a.resolved).length;
  int get criticalAlerts =>
      _alerts.where((a) => a.severity == 'critical' && !a.resolved).length;
  int get warningAlerts =>
      _alerts.where((a) => a.severity == 'warning' && !a.resolved).length;

  Future<void> fetchAlerts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final snapshot = await _firestore
          .collection('Alerts')
          .orderBy('createdAt', descending: true)
          .get();
      _alerts = snapshot.docs.map((doc) => Alert.fromFirestore(doc)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to fetch alerts: $e';
      _isLoading = false;
      notifyListeners();
      logger.e('Fetch Alerts Error: $e');
    }
  }

  Future<void> addAlert(Alert alert) async {
    try {
      final docRef = await _firestore.collection('Alerts').add(alert.toMap());
      final newAlert = Alert(
        alertId: docRef.id,
        deviceId: alert.deviceId,
        roomName: alert.roomName,
        severity: alert.severity,
        title: alert.title,
        description: alert.description,
        createdAt: alert.createdAt,
        resolved: alert.resolved,
        recommendedAction: alert.recommendedAction,
      );
      _alerts.insert(0, newAlert);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to add alert: $e';
      notifyListeners();
      logger.e('Add Alert Error: $e');
    }
  }

  Future<void> resolveAlert(String alertId) async {
    try {
      await _firestore.collection('Alerts').doc(alertId).update({
        'resolved': true,
      });
      final index = _alerts.indexWhere((a) => a.alertId == alertId);
      if (index != -1) {
        final alert = _alerts[index];
        _alerts[index] = Alert(
          alertId: alert.alertId,
          deviceId: alert.deviceId,
          roomName: alert.roomName,
          severity: alert.severity,
          title: alert.title,
          description: alert.description,
          createdAt: alert.createdAt,
          resolved: true,
          recommendedAction: alert.recommendedAction,
        );
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to resolve alert: $e';
      notifyListeners();
      logger.e('Resolve Alert Error: $e');
    }
  }

  Future<void> deleteAlert(String alertId) async {
    try {
      await _firestore.collection('Alerts').doc(alertId).delete();
      _alerts.removeWhere((a) => a.alertId == alertId);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to delete alert: $e';
      notifyListeners();
      logger.e('Delete Alert Error: $e');
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
