import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({super.key, required this.text});

  @override
  _BiggerTextState createState() => _BiggerTextState();

}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize),),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _textSize = 32;
              });
            }, child: const Text("Bust"),
        ),
      ],
    );
  }
}