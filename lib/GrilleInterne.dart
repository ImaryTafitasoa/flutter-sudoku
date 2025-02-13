import 'package:flutter/material.dart';

class GrilleInterne extends StatefulWidget {
  final int x;
  final int y;
  final int? value;
  final bool isSelected;
  final VoidCallback onTap;

  const GrilleInterne({
    super.key,
    required this.x,
    required this.y,
    this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _GrilleInterneState createState() => _GrilleInterneState();
}

class _GrilleInterneState extends State<GrilleInterne> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width;
    var maxSize = height > width ? width : height;
    var boxSize = (maxSize / 3).ceil().toDouble();

    return SizedBox(
        height: boxSize,
        width: boxSize,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: widget.isSelected
                ? Colors.blueAccent.shade100.withAlpha(100)
                  : Colors.transparent,
            ),
            child: Center(
              child: Text(
                widget.value == 0 ? '' : widget.value.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ));
  }
}
