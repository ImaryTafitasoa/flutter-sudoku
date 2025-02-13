import 'package:flutter/material.dart';

class GrilleInterne extends StatelessWidget {
  const GrilleInterne(
      {super.key, required this.x, required this.y, this.value});

  final int x;
  final int y;
  final int? value;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height / 2;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
          child: Text(
            value == 0 ? '' : value.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}