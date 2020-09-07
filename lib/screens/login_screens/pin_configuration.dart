


import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/pin_request_widget.dart';

class PINConfiguration extends StatelessWidget {
  static const route = '/pinConfiguration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeGreen,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('PIN setup. Remember this PIN'),
            Expanded(child: PINRequestWidget())
          ],
        ),
      ),
    );
  }
}
