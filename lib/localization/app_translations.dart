import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../globals.dart';

class AppTranslations { 
  static Map<dynamic, dynamic> _localisedValues;

  AppTranslations();

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load() async {
    AppTranslations appTranslations = AppTranslations();
    String jsonContent =
    await rootBundle.loadString("assets/locale/localization_$currentLang.json");
    _localisedValues = json.decode(jsonContent);
    print(currentLang);
    return appTranslations;
  }

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }
}