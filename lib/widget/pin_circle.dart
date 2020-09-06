

import 'package:flutter/material.dart';

class PINCircle extends StatefulWidget {


  final assignedNumber, counter;

  PINCircle({this.assignedNumber, this.counter});



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
        color: widget.assignedNumber < widget.counter ? Colors.red : Colors.blueAccent,
      ),
    );
  }
}
