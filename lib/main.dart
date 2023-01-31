import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roce_smartphoneapp/home.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  initSettings();
  SharedPreferences prefs = await sharedPrefInit();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(MyApp(prefs));
}

class MyApp extends StatelessWidget {
  SharedPreferences prefs;
  MyApp(this.prefs);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(prefs),
    );
  }
}

void initSettings() {
  SharePreferenceCache spCache = SharePreferenceCache()..init();
  Settings.init(cacheProvider: spCache);
}

Future<SharedPreferences> sharedPrefInit() async {
  try {
    /// Checks if shared preference exist
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.getString("addrIp");
    prefs.getInt("port1");
    prefs.getInt("port2");
    return prefs;
  } catch (err) {
    /// setMockInitialValues initiates shared preference
    /// Adds app-name
    SharedPreferences.setMockInitialValues({});
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("addrIp", "localhost");
    prefs.setInt("port1", 12137);
    prefs.setInt("port2", 12138);
    return prefs;
  }
}
