import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

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

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
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
