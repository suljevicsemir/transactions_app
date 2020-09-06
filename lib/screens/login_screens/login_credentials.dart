

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/login_form_widget.dart';

class LoginCredentials extends StatefulWidget {

  final boxShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3)
  );


  @override
  _LoginCredentialsState createState() => _LoginCredentialsState();
}

class _LoginCredentialsState extends State<LoginCredentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeGreen,
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Center(
          child: Container(
            height: 0.5 * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  widget.boxShadow
                ]
            ),
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: LoginForm()
            ),
          ),
        ),
      ),
    );
  }
}
