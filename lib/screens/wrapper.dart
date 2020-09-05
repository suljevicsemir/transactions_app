

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeGreen,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              TextField(

              ),
              TextField(

              )
            ],
          ),
        ),
      ),
    );
  }
}
