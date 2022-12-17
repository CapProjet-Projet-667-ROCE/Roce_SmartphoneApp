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

class ConnectConfig {
  String addrIp;
  int port;
  ConnectConfig(this.addrIp, this.port);

  void changeIp(String _addrIp) {
    addrIp = _addrIp;
  }

  void changePort(String _port) {
    int a = int.parse(_port);
    port = a;
  }
}

Future<Socket> socketConnect(ConnectConfig config) async {
  String addrIp = config.addrIp;
  int port = config.port;
  Socket socket = await Socket.connect(addrIp, port);
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
  return socket;
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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
