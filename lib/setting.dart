import 'package:flutter/material.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(),
      body: SettingBody(),
    );
  }
}

class SettingBody extends StatefulWidget {
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
    return Column(
      children: [
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
                  keyPort1Desktop = value;
                  debugPrint('key-connexion-desktop: $keyPort1Desktop');
                },
              ),
              TextInputSettingsTile(
                title: 'Port Two desktop',
                settingKey: 'key-port2-desktop',
                initialValue: '0000',
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
                onChange: (value) {
                  keyPort2Desktop = value;
                  debugPrint('key-port2-desktop: $keyPort2Desktop');
                },
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
