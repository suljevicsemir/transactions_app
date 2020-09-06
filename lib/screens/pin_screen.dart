import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/pin_circle.dart';
import 'package:transactions_app/widget/pin_number_widget.dart';

class PINState extends StatefulWidget {

  static const route = '/pin';

  @override
  _PINStateState createState() => _PINStateState();
}

class _PINStateState extends State<PINState> {

  int _numbersEntered = 0;

  _increment() {
    setState(() {
      _numbersEntered++;
    });
  }


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
              Text('Enter your PIN security number'),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PINCircle(assignedNumber: 1, counter: _numbersEntered,),
                  PINCircle(assignedNumber: 2, counter: _numbersEntered,),
                  PINCircle(assignedNumber: 3, counter: _numbersEntered,),
                  PINCircle(assignedNumber: 4, counter: _numbersEntered,),
                  PINCircle(assignedNumber: 5, counter: _numbersEntered,),
                  PINCircle(assignedNumber: 6, counter: _numbersEntered,),

                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PINNumber(1, _increment),
                        PINNumber(2, _increment),
                        PINNumber(3, _increment),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PINNumber(4, _increment),
                        PINNumber(5, _increment),
                        PINNumber(6, _increment),
                      ],
                    ),
                    SizedBox(height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PINNumber(7, _increment),
                        PINNumber(8, _increment),
                        PINNumber(9, _increment),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
