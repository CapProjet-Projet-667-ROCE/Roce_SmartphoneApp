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

class ConnectConfig {
  String addrIp;
  int port1;
  int port2 = 21345;
  ConnectConfig(this.addrIp, this.port1);

  void setIp(String _addrIp) {
    addrIp = _addrIp;
  }

  void setPort1(String _port) {
    int a = int.parse(_port);
    port1 = a;
  }

  void setPort2(String _port) {
    int a = int.parse(_port);
    port2 = a;
  }
}

Future<Socket?> socketConnect(
    ConnectConfig config, BuildContext context) async {
  String addrIp = config.addrIp;
  int port = config.port1;
  try {
    Socket socket = await Socket.connect(addrIp, port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
    return socket;
  } catch (e) {
    showAlertDialog(context, addrIp, port);
    print(e);
    print('Can\'t connect to: ${addrIp}:${port}');
    return null;
  }
}

void sendMessage(Socket? socket, String message) async {
  print('Client: $message');
  try {
    Socket mysocket = socket as Socket;
    mysocket.write(message);
    await Future.delayed(Duration(seconds: 2));
  } catch (e) {
    print(e);
    print('Can\'t send message: $message');
  }
}

void initSettings() {
  SharePreferenceCache spCache = SharePreferenceCache()..init();
  Settings.init(cacheProvider: spCache);
}

showAlertDialog(BuildContext context, String addrIp, int port1) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Cannot connect."),
    content: Text("Failed to connect to $addrIp:$port1"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
