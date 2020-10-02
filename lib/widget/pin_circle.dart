import 'package:flutter/material.dart';

class PINCircle extends StatefulWidget {


  final changeColor;
  PINCircle({this.changeColor});



  @override
  _PINCircleState createState() => _PINCircleState();
}

class _PINCircleState extends State<PINCircle> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.changeColor ? Colors.red : Colors.blueAccent,
      ),
    );
  }
}
