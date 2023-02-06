import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:roce_smartphoneapp/tools/slider.dart';
import 'package:roce_smartphoneapp/tools/square.dart';
import 'package:roce_smartphoneapp/setting.dart';
import 'package:roce_smartphoneapp/connexion.dart';

//Variable
bool fullscreanstatus = false;
int _rotateValue = 0;
int get rotateValue => _rotateValue;
//Connexion

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
String textOfSquare1 = "Previous";
//Square 2
int colorBackground2 = 0xFF031319;
String textOfSquare2 = "Next";
//Square 3
int colorBackground3 = 0xFF031319;
String textOfSquare3 = "Play/Pause";
//Square 4
int colorBackground4 = 0xFF031319;
String textOfSquare4 = "Lock";
//Square 5
int colorBackground5 = 0xFF031319;
String textOfSquare5 = "Launch";
//Square 6
int colorBackground6 = 0xFF031319;
String textOfSquare6 = "Muet/Demuet";
//Square 7
int colorBackground7 = 0xFF031319;
String textOfSquare7 = "Volume +";
//Square 8
int colorBackground8 = 0xFF031319;
String textOfSquare8 = "Volume -";

class HomePage extends StatelessWidget {
  SharedPreferences prefs;
  HomePage(this.prefs);
  @override
  Widget build(BuildContext context) {
    ConnectConfig config = ConnectConfig(prefs);
    Future<Socket?> socket = config.socketConnect(context);
    return Scaffold(
      appBar: HomeAppBar(socket, config),
      body: HomeBody(socket),
    );
  }
}

//APPBAR
class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  ConnectConfig config;
  Future<Socket?> socket;

  HomeAppBar(this.socket, this.config);

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
          onPressed: () {
            setState(() {
              widget.socket = widget.config.socketConnect(context);
            });
          },
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
              MaterialPageRoute(
                  builder: (context) =>
                      SettingPage(widget.socket, widget.config)),
            );
          },
        ),
      ],
    );
  }
}

//BODY
class HomeBody extends StatefulWidget {
  Future<Socket?> socket;
  HomeBody(this.socket);

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
                  child: Square(
                      widget.socket, 'b1', colorBackground1, textOfSquare1),
                ),
                Expanded(
                  flex: 5,
                  child: Square(
                      widget.socket, 'b2', colorBackground2, textOfSquare2),
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
                  child: Square(
                      widget.socket, 'b3', colorBackground3, textOfSquare3),
                ),
                Expanded(
                  flex: 5,
                  child: Square(
                      widget.socket, 'b4', colorBackground4, textOfSquare4),
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
                  child: Square(
                      widget.socket, 'b5', colorBackground5, textOfSquare5),
                ),
                Expanded(
                  flex: 5,
                  child: Square(
                      widget.socket, 'b6', colorBackground6, textOfSquare6),
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
                  child: Square(
                      widget.socket, 'b7', colorBackground7, textOfSquare7),
                ),
                Expanded(
                  flex: 5,
                  child: Square(
                      widget.socket, 'b8', colorBackground8, textOfSquare8),
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
                          Icons.volume_up,
                        ),
                        quarterTurns: _rotateValue,
                      ),
                      Expanded(
                        flex: 5,
                        child: SoundSlider(
                            widget.socket,
                            'b9',
                            colorThumbColor1,
                            colorInactiveColor1,
                            colorActiveColor1),
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
                          Icons.mic,
                        ),
                        quarterTurns: _rotateValue,
                      ),
                      Expanded(
                        flex: 5,
                        child: SoundSlider(
                            widget.socket,
                            'b10',
                            colorThumbColor2,
                            colorInactiveColor2,
                            colorActiveColor2),
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
