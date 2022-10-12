import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roce_smartphoneapp/setting_page.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(MyApp());
}

//Variable
bool fullscreanstatus = false;
int _value = 50;
int _rotateValue = 0;

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
  const HomePage({super.key});
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
              MaterialPageRoute(builder: (context) => SettingPage()),
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
                  child: Square(),
                ),
                Expanded(
                  flex: 5,
                  child: Square(),
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
                  child: Square(),
                ),
                Expanded(
                  flex: 5,
                  child: Square(),
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
                  child: Square(),
                ),
                Expanded(
                  flex: 5,
                  child: Square(),
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
                  child: Square(),
                ),
                Expanded(
                  flex: 5,
                  child: Square(),
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
                        child: SoundSlider(),
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
                        child: SoundSlider(),
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

//BUTTON SQUARE
class Square extends StatefulWidget {
  @override
  _Square createState() => _Square();
}

class _Square extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ButtonTheme(
          child: ElevatedButton(
            child: RotatedBox(
              child: Text("test"),
              quarterTurns: _rotateValue,
            ),
            onPressed: () => print(_rotateValue),
          ),
        ),
      ),
    );
  }
}

//SLIDER
class SoundSlider extends StatefulWidget {
  @override
  _SoundSlider createState() => _SoundSlider();
}

class _SoundSlider extends State<SoundSlider> {
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 100,
      thumbColor: Color(0xFF031319),
      inactiveColor: Color(0x88031319),
      activeColor: Color(0xFF031319),
      value: _value.toDouble(),
      onChanged: (double newValue) {
        setState(() {
          _value = newValue.round();
        });
      },
    );
  }
}
