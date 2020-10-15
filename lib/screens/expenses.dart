import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> with SingleTickerProviderStateMixin, WidgetsBindingObserver  {

  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  String text = 'hello';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200)
    );

    _offsetFloat = Tween<Offset>(begin: Offset(1.0, 3.0), end: Offset(1.0, 0.0) ).animate(_controller);
    _offsetFloat.addListener(() {
      setState(() {

      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    //WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      super.didChangeAppLifecycleState(state);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
   if(_offsetFloat.isCompleted) {
     _controller.reset();
   }
   else {
     _controller.forward();
   }
   _controller.forward();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.themeGreen,
        body: SlideTransition(
          position: _offsetFloat,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
