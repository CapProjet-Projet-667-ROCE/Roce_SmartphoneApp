import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roce_smartphoneapp/home.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';

final String _addrIp = '192.168.1.19';
final int _port = 12137;

void main() async {
  initSettings();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //connexion
  ConnectSocket connect = ConnectSocket(_addrIp, _port);
  Socket socket = await connect.connexion();
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

  // run app
  runApp(MyApp(socket));
}

class ConnectSocket {
  String addrIp;
  int port;
  ConnectSocket(this.addrIp, this.port);
  connexion() async {
    var socket = await Socket.connect(addrIp, port);
    return socket;
  }
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
