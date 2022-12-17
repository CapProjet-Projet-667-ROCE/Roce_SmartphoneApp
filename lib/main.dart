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

Future<Socket?> socketConnect(ConnectConfig config) async {
  String addrIp = config.addrIp;
  int port = config.port;
  try {
    Socket socket = await Socket.connect(addrIp, port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
    return socket;
  } catch (e) {
    Socket socket = await Socket.connect('google.com', 80);
    print('Can\'t connect to: ${addrIp}:${port}');
    DialogExample();
  }
}

void sendMessage(Socket? socket, String message) async {
  print('Client: $message');
  try {
    Socket mysocket = socket as Socket;
    mysocket.write(message);
    await Future.delayed(Duration(seconds: 2));
  } catch (e) {
    DialogExample();
  }
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

class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
