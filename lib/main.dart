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

  //connexion
  String addrIp = 'google.com';
  int port = 80;
  Socket socket = await Socket.connect(addrIp, port);
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

  // run app
  runApp(MyApp(socket));
}

void sendMessage(Socket socket, String message) async {
  print('Client: $message');
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}

void initSettings() {
  SharePreferenceCache spCache = SharePreferenceCache()..init();
  Settings.init(cacheProvider: spCache);
}

class MyApp extends StatelessWidget {
  final Socket socket;

  const MyApp(this.socket);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(socket),
    );
  }
}
