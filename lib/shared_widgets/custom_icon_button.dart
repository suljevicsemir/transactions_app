

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  final Color color, splashColor, iconColor;
  final IconData iconData;
  final Function function;

  CustomIconButton({this.color, this.splashColor, this.iconColor, this.iconData, this.function});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        splashColor: splashColor,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Icon(iconData, size: 30, color: iconColor,),
        ),
        onTap: function,
      ),
    );
  }
}
