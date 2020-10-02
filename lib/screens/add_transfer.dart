

import 'package:flutter/material.dart';

class AddTransfer extends StatefulWidget {
  @override
  _AddTransferState createState() => _AddTransferState();
}

class _AddTransferState extends State<AddTransfer> {


  int _count = 0;

  _incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(child: child, scale: animation),
                child: Text('$_count', style: TextStyle(color: Colors.black), key: ValueKey<int>(_count),),

              ),
              RaisedButton(
                onPressed: () => _incrementCount(),
                child: Text('Press'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
