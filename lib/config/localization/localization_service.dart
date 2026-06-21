import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static const String enLanguage = 'en';
  static const String arLanguage = 'ar';
  
  static const List<Locale> supportedLocales = [
    Locale(enLanguage),
    Locale(arLanguage),
  ];
  
  static Future<void> changeLanguage(BuildContext context, String locale) async {
    if (locale == arLanguage) {
      await context.setLocale(const Locale(arLanguage));
    } else {
      await context.setLocale(const Locale(enLanguage));
    }
  }
  
  static bool isArabic(BuildContext context) {
    return context.locale.languageCode == arLanguage;
  }
  
  static bool isEnglish(BuildContext context) {
    return context.locale.languageCode == enLanguage;
  }
}
