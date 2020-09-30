import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class DrawerItem extends StatefulWidget {

  final String title;
  final IconData iconData;

  DrawerItem({this.title, this.iconData});

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {

  bool _pressed = false;

  changePressed() {
    setState(() {
      if(_pressed == false)
        _pressed = true;
      else _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO
      },
      onLongPress: () {
        changePressed();
        Timer(const Duration(milliseconds: 450), () {
          changePressed();
        });
      },
      child : AnimatedContainer(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: _pressed == true ? Palette.themeGreen : Colors.white
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(widget.iconData, size: 30,),
              SizedBox(width: 30,),
              Text(widget.title, style: TextStyle(color: Colors.grey[800], fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}
