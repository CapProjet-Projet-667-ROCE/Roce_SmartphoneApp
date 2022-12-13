import 'dart:math';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:roce_smartphoneapp/parser/slider.dart';
import 'package:roce_smartphoneapp/parser/square.dart';
import 'package:roce_smartphoneapp/setting.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

void main() {
  initSettings();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(MyApp());
}

void initSettings() {
  SharePreferenceCache spCache = SharePreferenceCache()..init();
  Settings.init(cacheProvider: spCache);
}

//Variable
bool fullscreanstatus = false;
int _rotateValue = 0;
//Slider 1
int colorThumbColor1 = 0xFF031319;
int colorInactiveColor1 = 0x88031319;
int colorActiveColor1 = 0xFF031319;
//Slider 2
int colorThumbColor2 = 0xFF031319;
int colorInactiveColor2 = 0x88031319;
int colorActiveColor2 = 0xFF031319;
//Square 1
int colorBackground1 = 0xFF031319;
String textOfSquare1 = "Preview";
//Square 2
int colorBackground2 = 0xFF031319;
String textOfSquare2 = "Next";
//Square 3
int colorBackground3 = 0xFF81b71a;
String textOfSquare3 = "Play/Pause";
//Square 4
int colorBackground4 = 0xFF2a86cf;
String textOfSquare4 = "Lock";
//Square 5
int colorBackground5 = 0xFF031319;
String textOfSquare5 = "Win+G";
//Square 6
int colorBackground6 = 0x88031319;
String textOfSquare6 = "Muet/Demuet";
//Square 7
int colorBackground7 = 0xFF031319;
String textOfSquare7 = "Volume +";
//Square 8
int colorBackground8 = 0xFF031319;
String textOfSquare8 = "Volume -";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}

//APPBAR
class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  _HomeAppBar createState() => _HomeAppBar();
}

class _HomeAppBar extends State<HomeAppBar> {
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF031319),
      leading: Container(
        child: RotatedBox(
          child: Image.asset('assets/logo.png'),
          quarterTurns: _rotateValue,
        ),
      ),
      title: Text('ROCE'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.replay_outlined),
          onPressed: () async {},
        ),
        IconButton(
            icon: fullscreanstatus == true
                ? Icon(Icons.fullscreen_exit)
                : Icon(Icons.fullscreen),
            onPressed: () async {
              setState(() {
                if (fullscreanstatus == false) {
                  enterFullScreen(FullScreenMode.EMERSIVE);
                  fullscreanstatus = true;
                } else {
                  exitFullScreen();
                  fullscreanstatus = false;
                }
              });
            }),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
        ),
      ],
    );
  }
}

//BODY
class HomeBody extends StatefulWidget {
  @override
  _HomeBody createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Square(0, colorBackground1, textOfSquare1),
                ),
                Expanded(
                  flex: 5,
                  child: Square(1, colorBackground2, textOfSquare2),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Square(2, colorBackground3, textOfSquare3),
                ),
                Expanded(
                  flex: 5,
                  child: Square(3, colorBackground4, textOfSquare4),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Square(4, colorBackground5, textOfSquare5),
                ),
                Expanded(
                  flex: 5,
                  child: Square(5, colorBackground6, textOfSquare6),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Square(6, colorBackground7, textOfSquare7),
                ),
                Expanded(
                  flex: 5,
                  child: Square(7, colorBackground8, textOfSquare8),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      RotatedBox(
                        child: Icon(
                          Icons.mic,
                        ),
                        quarterTurns: _rotateValue,
                      ),
                      Expanded(
                        flex: 5,
                        child: SoundSlider(colorThumbColor1,
                            colorInactiveColor1, colorActiveColor1),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      RotatedBox(
                        child: Icon(
                          Icons.volume_up,
                        ),
                        quarterTurns: _rotateValue,
                      ),
                      Expanded(
                        flex: 5,
                        child: SoundSlider(colorThumbColor2,
                            colorInactiveColor2, colorActiveColor2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
