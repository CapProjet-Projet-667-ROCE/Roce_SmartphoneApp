import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(),
      body: SingleChildScrollView(
        child: BodySetting(),
      ),
    );
  }
}

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF031319),
      title: Text('Setting'),
      centerTitle: true,
    );
  }
}

class BodySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        test(),
        test_(),
      ],
    );
  }
}

class ConnectionSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
          ],
        ),
      ],
    );
  }
}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.cyan,
    );
  }
}

class test_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      color: Colors.red,
    );
  }
}
