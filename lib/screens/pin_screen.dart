import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/pin_request_widget.dart';

class PINState extends StatefulWidget {

  static const route = '/pin';

  @override
  _PINStateState createState() => _PINStateState();
}

class _PINStateState extends State<PINState> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeGreen,
      extendBodyBehindAppBar: true,

      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(),
              Text('Enter your PIN security number'),
              Spacer(),
              PINRequestWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
