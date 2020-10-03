

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transactions_app/widget/sliver_app_bar.dart';


class Personalization extends StatefulWidget {

  static const route = '/account_info';

  @override
  _PersonalizationState createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {


  bool _shouldPaint = false;

  _paint() {
    setState(() {
      _shouldPaint = true;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: AnimatedContainer(
        curve: Curves.easeInCubic,
        duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            color: _shouldPaint == true ? Colors.black.withOpacity(0.7) : Colors.white
          ),
          child: PersonalizationScreen())
    );
  }




  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 700), () {
      _paint();
    });
  }
}
