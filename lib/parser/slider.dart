import 'dart:io';
import 'package:flutter/material.dart';
import 'package:roce_smartphoneapp/main.dart';

int _value = 50;

//SLIDER
class SoundSlider extends StatefulWidget {
  final String id;
  final int colorThumbColor;
  final int colorInactiveColor;
  final int colorActiveColor;
  final Future<Socket?> socket;

  const SoundSlider(this.socket, this.id, this.colorThumbColor,
      this.colorInactiveColor, this.colorActiveColor);
  @override
  _SoundSlider createState() => _SoundSlider();
}

class _SoundSlider extends State<SoundSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 100,
      thumbColor: Color(widget.colorThumbColor),
      inactiveColor: Color(widget.colorInactiveColor),
      activeColor: Color(widget.colorActiveColor),
      value: _value.toDouble(),
      onChanged: (double newValue) {
        setState(() async {
          if (_value != newValue.round()) {
            _value = newValue.round();
            Socket? mysocket = await widget.socket;
            sendMessage(mysocket, widget.id + ':' + _value.toString() + '\n');
            debugPrint('id: ' + widget.id + ' value: ' + _value.toString());
          }
        });
      },
    );
  }
}
