

import 'package:flutter/material.dart';

class PINNumber extends StatelessWidget {

  final int number;
  final VoidCallback callback;
  PINNumber(this.number, this.callback);


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      elevation: 0.0,
      fillColor: Colors.white,
      splashColor: Colors.red,
      child: Text(number.toString()),
      padding: EdgeInsets.all(25),
      shape: CircleBorder(),
    );
  }
}
