import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  
  String _language = 'en';
  bool _notificationsEnabled = true;
  bool _darkMode = true;
  bool _rememberMe = false;

  String get language => _language;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get darkMode => _darkMode;
  bool get rememberMe => _rememberMe;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _language = _prefs.getString('language') ?? 'en';
    _notificationsEnabled = _prefs.getBool('notificationsEnabled') ?? true;
    _darkMode = _prefs.getBool('darkMode') ?? true;
    _rememberMe = _prefs.getBool('rememberMe') ?? false;
    notifyListeners();
  }

  Future<void> setLanguage(String lang) async {
    _language = lang;
    await _prefs.setString('language', lang);
    notifyListeners();
  }

  Future<void> setNotifications(bool enabled) async {
    _notificationsEnabled = enabled;
    await _prefs.setBool('notificationsEnabled', enabled);
    notifyListeners();
  }

  Future<void> setDarkMode(bool enabled) async {
    _darkMode = enabled;
    await _prefs.setBool('darkMode', enabled);
    notifyListeners();
  }

  Future<void> setRememberMe(bool remember) async {
    _rememberMe = remember;
    await _prefs.setBool('rememberMe', remember);
    notifyListeners();
  }
}
