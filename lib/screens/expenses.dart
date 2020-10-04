


import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> with SingleTickerProviderStateMixin  {

  AnimationController _controller;
  Animation<Offset> _offsetFloat;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200)
    );

    _offsetFloat = Tween<Offset>(begin: Offset(1.0, 3.0), end: Offset(1.0, 0.0) ).animate(_controller);
    _offsetFloat.addListener(() {setState(() {

    });});
    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.themeGreen,
        body: SlideTransition(
          position: _offsetFloat,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Center(child: Text('Hellooooo')),
          ),
        ),
      ),
    );
  }
}
