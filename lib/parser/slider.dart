import 'package:flutter/material.dart';

int _value = 50;

//SLIDER
class SoundSlider extends StatefulWidget {
  final int colorThumbColor;
  final int colorInactiveColor;
  final int colorActiveColor;
  const SoundSlider(
      this.colorThumbColor, this.colorInactiveColor, this.colorActiveColor);
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
        setState(() {
          _value = newValue.round();
          print(_value);
        });
      },
    );
  }
}
