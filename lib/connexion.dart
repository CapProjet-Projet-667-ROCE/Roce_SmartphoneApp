import 'dart:io';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectConfig {
  SharedPreferences prefs;
  ConnectConfig(this.prefs);

  getIpValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String stringValue = prefs.getString('addrIp') ?? "localhost";
    return stringValue;
  }

  getPort1Value() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final int intValue = prefs.getInt('port1') ?? 12137;
    return intValue;
  }

  getPort2Value() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final int intValue = prefs.getInt('port2') ?? 12138;
    return intValue;
  }

  void setIp(String _addrIp) {
    prefs.setString("addrIp", _addrIp);
  }

  void setPort1(String _port) {
    int a = int.parse(_port);
    prefs.setInt("port1", a);
  }

  void setPort2(String _port) {
    int a = int.parse(_port);
    prefs.setInt("port2", a);
  }

  Future<Socket?> socketConnect(BuildContext context) async {
    try {
      String addrIp = await getIpValue();
      int port1 = await getPort1Value();
      Socket socket = await Socket.connect(addrIp, port1);
      print(
          'Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
      Fluttertoast.showToast(
          msg: "  Connected to : ${addrIp}:${port1}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      return socket;
    } catch (e) {
      print(e);
      String addrIp = await getIpValue();
      int port1 = await getPort1Value();
      showAlertDialog(context, addrIp, port1);
      print('Can\'t connect to: ${addrIp}:${port1}');
      return null;
    }
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
