import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/alert_model.dart';
import '../config/constants/app_constants.dart';

class AlertsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Alert> _alerts = [];
  bool _isLoading = false;
  String? _error;
  StreamSubscription? _subscription;

  List<Alert> get alerts => _alerts;
  List<Alert> get unresolvedAlerts => _alerts.where((a) => !a.isResolved).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;

  int get warningCount => unresolvedAlerts.where((a) => a.severity == 'warning').length;
  int get criticalCount => unresolvedAlerts.where((a) => a.severity == 'critical').length;

  void startListeningToAlerts() {
    _subscription = _firestore
        .collection(AppConstants.alertsCollection)
        .snapshots()
        .listen((snapshot) {
      _alerts = snapshot.docs.map((doc) => Alert.fromMap(doc.data(), doc.id)).toList();
      notifyListeners();
    });
  }

  Future<void> resolveAlert(String id) async {
    try {
      await _firestore
          .collection(AppConstants.alertsCollection)
          .doc(id)
          .update({
        'isResolved': true,
        'resolvedAt': Timestamp.now(),
      });
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
