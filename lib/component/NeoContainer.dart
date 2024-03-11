import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class NeoContainer extends StatelessWidget {
  const NeoContainer({super.key});

  //final shape = Type shape;

  @override
  Widget build(BuildContext context) {
    //Material

    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
         //shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 6), blurRadius: 10)
        ],
        border: Border.all(color: Colors.green, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      //  color: Colors.blue,
      width: 200,
      height: 200,
      child: const Text(
        "Hi Material",
        style: TextStyle(fontSize: 48),
      ),
    );

    //Cupertino
    /*return Container(
        color: CupertinoColors.activeBlue,
        width: 200,
        height: 100,
        child: const Text(
          "Hi",
          style: TextStyle(fontSize: 48),
        ));*/
  }
}

class NeoContainerCircle extends StatelessWidget {
  const NeoContainerCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoContainer();
  }


}