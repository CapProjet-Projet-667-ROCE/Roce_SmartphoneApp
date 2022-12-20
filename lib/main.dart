import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roce_smartphoneapp/home.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';

void main() async {
  initSettings();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

void initSettings() {
  SharePreferenceCache spCache = SharePreferenceCache()..init();
  Settings.init(cacheProvider: spCache);
}
