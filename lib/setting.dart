import 'dart:io';

import 'package:flutter/material.dart';
import 'package:roce_smartphoneapp/main.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingPage extends StatelessWidget {
  ConnectConfig config;
  Future<Socket?> socket;
  SettingPage(this.socket, this.config);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(),
      body: SettingBody(socket, config),
    );
  }
}

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF031319),
      title: const Text('Settings'),
      centerTitle: true,
    );
  }
}

class SettingBody extends StatefulWidget {
  ConnectConfig config;
  Future<Socket?> socket;
  SettingBody(this.socket, this.config);
  @override
  _SettingBody createState() => _SettingBody();
}

class _SettingBody extends State<SettingBody> {
  static var keyIpDesktop = 'key-ip-desktop';
  static var keyPort1Desktop = 'key-port1-desktop';
  static var keyPort2Desktop = 'key-port2-desktop';
  static var keyConnexionDesktop = 'key-connexion-desktop';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 600,
          child: SettingsGroup(
            title: 'Connection Settings',
            children: <Widget>[
              TextInputSettingsTile(
                title: 'Ip address desktop',
                settingKey: 'key-ip-desktop',
                initialValue: '192.161.1.', //Affichage VS valeur
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
                onChange: (value) {
                  setState(() {
                    widget.config.setIp(value);
                    widget.socket = socketConnect(widget.config, context);
                  });
                  keyIpDesktop = value;
                  debugPrint('key-connexion-desktop: $keyIpDesktop');
                },
              ),
              TextInputSettingsTile(
                title: 'Port One desktop',
                settingKey: 'key-port1-desktop',
                initialValue: '0000',
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
                onChange: (value) {
                  setState(() {
                    widget.config.setPort1(value);
                    widget.socket = socketConnect(widget.config, context);
                  });
                  keyPort1Desktop = value;
                  debugPrint('key-connexion-desktop: $keyPort1Desktop');
                },
                validator: (port1) =>
                    port1 != null ? null : 'Enter correct port',
              ),
              TextInputSettingsTile(
                title: 'Port Two desktop',
                settingKey: 'key-port2-desktop',
                initialValue: '0000',
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
                onChange: (value) {
                  setState(() {});
                  keyPort2Desktop = value;
                  debugPrint('key-port2-desktop: $keyPort2Desktop');
                },
                validator: (port2) =>
                    port2 != null ? null : 'Enter correct port',
              ),
              SimpleDropDownSettingsTile(
                title: 'Connexion with desktop',
                settingKey: 'key-connexion-desktop',
                values: <String>[
                  'WIFI',
                  'USB',
                ],
                selected: 'WIFI',
                onChange: (value) {
                  keyConnexionDesktop = value;
                  debugPrint('key-connexion-desktop: $keyConnexionDesktop');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
