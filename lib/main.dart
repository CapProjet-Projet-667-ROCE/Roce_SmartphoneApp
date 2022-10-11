import 'package:flutter/material.dart';
import 'package:roce_smartphoneapp/setting_page.dart';
import 'package:fullscreen/fullscreen.dart';

void main() => runApp(MyApp());

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
      body: Center(
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
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
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
        child: Image.asset('assets/logo.png'),
      ),
      title: Text('ROCE'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.fullscreen),
          onPressed: () async {
            enterFullScreen(FullScreenMode.EMERSIVE);
          },
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_exit),
          onPressed: () async {
            exitFullScreen();
          },
        ),
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

//BUTTON SQUARE
class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
