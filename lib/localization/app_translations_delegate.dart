import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/app_translations.dart'; 

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  // final Locale newLocale;

  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load();
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}