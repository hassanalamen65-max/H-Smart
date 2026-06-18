import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? role;
  final bool darkMode;
  final String language;
  final bool notificationsEnabled;
  final DateTime createdAt;
  final DateTime? lastLogin;

  AppUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.role,
    this.darkMode = true,
    this.language = 'en',
    this.notificationsEnabled = true,
    required this.createdAt,
    this.lastLogin,
  });

  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppUser(
      uid: doc.id,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      phoneNumber: data['phoneNumber'],
      role: data['role'],
      darkMode: data['darkMode'] ?? true,
      language: data['language'] ?? 'en',
      notificationsEnabled: data['notificationsEnabled'] ?? true,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastLogin: (data['lastLogin'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
    'email': email,
    'displayName': displayName,
    'phoneNumber': phoneNumber,
    'role': role,
    'darkMode': darkMode,
    'language': language,
    'notificationsEnabled': notificationsEnabled,
    'createdAt': Timestamp.fromDate(createdAt),
    'lastLogin': lastLogin != null ? Timestamp.fromDate(lastLogin!) : null,
  };
}
