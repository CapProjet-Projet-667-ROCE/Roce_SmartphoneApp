import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roce_smartphoneapp/main.dart';

int _rotateValue = 0;

class Square extends StatefulWidget {
  final String id;
  final int colorBackground;
  final String textOfSquare;
  final Socket socket;

  const Square(this.socket, this.id, this.colorBackground, this.textOfSquare);
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
              child: Text(widget.textOfSquare),
              quarterTurns: _rotateValue,
            ),
            onPressed: () async {
              sendMessage(widget.socket, widget.id);
              debugPrint('id: ' + widget.id);
            },
            style: ElevatedButton.styleFrom(
              primary: Color(widget.colorBackground),
            ),
          ),
        ),
      ),
    );
  }
}
