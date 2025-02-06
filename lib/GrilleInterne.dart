import 'package:flutter/material.dart';

class GrilleInterne extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

    return SizedBox(
      height: boxSize*3,
      width: boxSize*3,
      child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9,(x) {
            return Container(
              width: 0.3,
              height: 0.3,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            );
          }),
      )
    );
  }

}