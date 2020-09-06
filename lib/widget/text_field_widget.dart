

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final hintStyle = TextStyle(
      color: Colors.grey[600].withOpacity(0.5),
      fontSize: 20,
      letterSpacing: 1.0
  );

  final fieldStyle = TextStyle(
    color: Colors.black,
    fontSize: 22,
  );



  final controller;
  final keyboardType;
  final hintText;
  final obscureText;
  CustomTextField({this.controller, this.keyboardType, this.hintText, this.obscureText});


  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  var inputDecoration;


  @override
  void initState() {
    super.initState();
    inputDecoration = InputDecoration(
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      contentPadding: EdgeInsets.only(left: 20),
      border: InputBorder.none
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: inputDecoration,
        obscureText: widget.obscureText,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
