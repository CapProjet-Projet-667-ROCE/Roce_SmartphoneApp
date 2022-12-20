import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectConfig {
  late String addrIp;
  late int port1;
  late int port2;
  ConnectConfig(this.addrIp, this.port1, this.port2) {}
  ConnectConfig.fromJson(Map<String, dynamic> json) {
    try {
      print(json['addrIp']);
      this.addrIp = json['addrIp'];
      this.port1 = json['port1'];
      this.port2 = json['port2'];
    } catch (e) {
      print(e);
    }
  }

  void loadConfig() async {
    final jsonString = await rootBundle.loadString('assets/config.json');

    final dynamic jsonMap = jsonDecode(jsonString);

    setIp(jsonMap["addrIp"]);
    setPort1(jsonMap["port1"]);
    setPort2(jsonMap["port2"]);
  }

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

Future<Map<String, dynamic>> readJson() async {
  final jsonString = await rootBundle.loadString('assets/config.json');
  final jsonResult = jsonDecode(jsonString); //latest Dart
  return jsonResult;
}

Future<Socket?> socketConnect(
    ConnectConfig config, BuildContext context) async {
  String addrIp = config.addrIp;
  int port = config.port1;
  Duration _timeout = Duration(seconds: 3);
  try {
    Socket socket = await Socket.connect(addrIp, port, timeout: _timeout);
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
