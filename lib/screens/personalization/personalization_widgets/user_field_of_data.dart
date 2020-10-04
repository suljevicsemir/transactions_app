


import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class UserFieldOfData extends StatelessWidget {

  final dynamic data;
  final String label;


  UserFieldOfData({this.data, this.label});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 5, top: 5),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Palette.themeGreen, width: 3)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(data.toString(), style: TextStyle(color: Colors.blue, fontSize: 20),),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.black),)
        ],
      ),
    );
  }
}
