import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[const SizedBox(width: double.infinity)];

    return Scaffold(
      appBar: SettingAppBar(),
      body: Column(
        children: [
          CommonSetting(),
          DropDownSettingsTile(
            title: 'Rotation',
            selected: 1,
            values: <int, String>{
              1: 'vertical',
              2: 'horizontal',
            },
          ),
        ],
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

class CommonSetting extends StatefulWidget {
  @override
  _CommonSetting createState() => _CommonSetting();
}

class _CommonSetting extends State<CommonSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.info),
                title: Text('Version'),
                value: Text('0.0.1 BETA'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.dark_mode_outlined),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
