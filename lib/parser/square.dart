import 'package:flutter/material.dart';

class DataSquare {
  int _id;
  int _color;
  String _title;

  DataSquare(this._id, this._color, this._title);

  factory DataSquare.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return DataSquare(0, 0x88031319, "Empty");
    } else {
      return DataSquare(json["id"], json["color"], json["title"]);
    }
  }

  get id => this._id;
  get color => this._color;
  get text => this._title;
}

class Square extends StatefulWidget {
  final int id;
  final int colorBackground;
  final String textOfSquare;
  const Square(this.id, this.colorBackground, this.textOfSquare);
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
              quarterTurns: 0,
            ),
            onPressed: () => print(widget.id),
            style: ElevatedButton.styleFrom(
              primary: Color(widget.colorBackground),
            ),
          ),
        ),
      ),
    );
  }
}
