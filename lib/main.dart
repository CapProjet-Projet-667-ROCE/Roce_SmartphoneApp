import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF031319),
          leading: Container(
            child: Image.asset('assets/logo.png'),
          ),
          title: Text('ROCE'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.fullscreen),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Square(),
                  Square(),
                ],
              ),
              Row(
                children: [
                  Square(),
                  Square(),
                ],
              ),
              Row(
                children: [
                  Square(),
                  Square(),
                ],
              ),
              Row(
                children: [
                  Square(),
                  Square(),
                ],
              ),
              Row(
                children: [
                  Square(),
                  Square(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }
}
