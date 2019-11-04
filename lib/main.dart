import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/app_translations_delegate.dart'; 
import 'package:flutter_localization/signupscreen.dart'; 

Future<Null> main() async {
  runApp(new LocalisedApp());
}

class LocalisedApp extends StatefulWidget {
  @override
  LocalisedAppState createState() {
    return new LocalisedAppState();
  }
}

class LocalisedAppState extends State<LocalisedApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpUI(),
      localizationsDelegates: [
        _newLocaleDelegate, 
      ], 
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate();
    });
  }
}
