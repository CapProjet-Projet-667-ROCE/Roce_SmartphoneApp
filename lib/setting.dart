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
  Future<String> getIpAddress() async {
    final ipv4 = await Ipify.ipv4();
    return ipv4;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 300,
            child: SettingsGroup(
              title: 'Connection Settings',
              children: <Widget>[
                Container(
                    child: FutureBuilder(
                        future: getIpAddress(),
                        builder:
                            (BuildContext context, AsyncSnapshot<String> text) {
                          if (!text.hasData) {
                            return Container();
                          } else {
                            final String? addrIp = text.data;
                            return Text("Adresse IP : $addrIp");
                          }
                        })),
                TextInputSettingsTile(
                  title: 'Ip address desktop',
                  settingKey: 'key-ip-desktop',
                  initialValue: '192.161.1.', //Affichage VS valeur
                  borderColor: Colors.blueAccent,
                  errorColor: Colors.deepOrangeAccent,
                ),
                TextInputSettingsTile(
                  title: 'Port One desktop',
                  settingKey: 'key-port1-desktop',
                  initialValue: '0000',
                  borderColor: Colors.blueAccent,
                  errorColor: Colors.deepOrangeAccent,
                ),
                TextInputSettingsTile(
                  title: 'Port Two desktop',
                  settingKey: 'key-port1-desktop',
                  initialValue: '0000',
                  borderColor: Colors.blueAccent,
                  errorColor: Colors.deepOrangeAccent,
                ),
                SimpleDropDownSettingsTile(
                  title: 'Connection with desktop',
                  settingKey: 'key-connection-desktop',
                  values: <String>[
                    'WIFI',
                    'USB',
                  ],
                  selected: 'WIFI',
                  onChange: (value) {
                    debugPrint('key-connection-desktop: $value');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
