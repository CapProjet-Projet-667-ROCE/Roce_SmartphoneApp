import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:roce_smartphoneapp/connexion.dart';

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
  SettingAppBar({Key? key}) : super(key: key);

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
  var keyIpDesktop = 'key-ip-desktop';
  var keyPort1Desktop = 'key-port1-desktop';
  var keyPort2Desktop = 'key-port2-desktop';
  var keyConnexionDesktop = 'key-connexion-desktop';
  @override
  Widget build(BuildContext context) {
    widget.config.getIpValue;

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SettingsGroup(
          title: 'Connection Settings',
          children: <Widget>[
            TextInputSettingsTile(
              title: 'Ip address desktop',
              settingKey: keyIpDesktop,
              initialValue: 'localhost',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
              onChange: (value) {
                setState(() {
                  widget.config.setIp(value);
                  widget.socket = widget.config.socketConnect(context);
                });
                keyIpDesktop = value;
                debugPrint('key-ip-desktop: $keyIpDesktop');
              },
            ),
            TextInputSettingsTile(
              title: 'Port One desktop',
              settingKey: keyPort1Desktop,
              initialValue: '80',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
              onChange: (value) {
                setState(() {
                  widget.config.setPort1(value);
                  widget.socket = widget.config.socketConnect(context);
                });
                keyPort1Desktop = value;
                debugPrint('key-port2-desktop: $keyPort1Desktop');
              },
              validator: (port1) => port1 != null ? null : 'Enter correct port',
            ),
            TextInputSettingsTile(
              title: 'Port Two desktop',
              settingKey: keyPort2Desktop,
              initialValue: '8080',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
              onChange: (value) {
                setState(() {});
                keyPort2Desktop = value;
                debugPrint('key-port2-desktop: $keyPort2Desktop');
              },
              validator: (port2) => port2 != null ? null : 'Enter correct port',
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
        SettingsGroup(
          title: 'Infomation',
          children: [
            SimpleSettingsTile(
              title: 'Dev App Mobil:',
              subtitle: 'Benjamin Lasseye, Clément Dubois',
            ),
            SimpleSettingsTile(
              title: 'Dev App Windows',
              subtitle: 'Maxime Maitrot, Corentin Gasnier, Lucas Marie',
            ),
            SimpleSettingsTile(
              title: 'Version :',
              subtitle: 'BETA',
            ),
          ],
        ),
      ],
    );
  }
}
