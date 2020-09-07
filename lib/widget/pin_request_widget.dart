import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transactions_app/widget/alert_dialog_widget.dart';
import 'package:transactions_app/widget/pin_circle.dart';

class PINRequestWidget extends StatefulWidget {
  @override
  _PINRequestWidgetState createState() => _PINRequestWidgetState();
}

class _PINRequestWidgetState extends State<PINRequestWidget> {

  int _numbersEntered = 0;

  _increment() async {
    setState(() {
      _numbersEntered++;
      print(_numbersEntered.toString());
      FlutterBeep.beep();
    });

    if(_numbersEntered == 6) {
      bool hasPIN = await _readPIN() == 0 ? false : true;
      if(!hasPIN) {
        showDialog(
          context: context,
          builder: (_) => PINAlertDialog(pin)
        );
      }
      else {
        String pinSaved = await _hasPIN();
        if(pinSaved == pin) {
          Navigator.pushReplacementNamed(context, '/navigationBar');
        }
        else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('WRONG PIN!', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            backgroundColor: Colors.pinkAccent,
          ));
        }
      }
    }
  }



  _addToPIN(number) {
   setState(() {
     pin = pin + number.toString();
   });
  }



  _hasPIN() async {
    final storage = FlutterSecureStorage();
    String _pin = await storage.read(key: 'pin');
    return _pin;
  }

  _reset() {
    setState(() {
      _numbersEntered = 0;
      pin = '';
    });
  }

  _deleteLast() {
    setState(() {
      _numbersEntered--;
      pin = pin.substring(0, pin.length - 1);
    });
  }

  static String pin = '';

  _readPIN() async {
    final storage = FlutterSecureStorage();
    Map<String, String> allValues = await storage.readAll();
    return allValues.length;
  }

  _pinEntered() async {
    if (_numbersEntered == 6) {
      final storage = FlutterSecureStorage();
    }
  }



  Widget _pinNumber(int number) {
    return RawMaterialButton(
      onPressed: () {
        _increment();
        _addToPIN(number.toString());
      },
      elevation: 0.0,
      fillColor: Colors.white,
      splashColor: Colors.red,
      child: Text(number.toString()),
      padding: EdgeInsets.all(25),
      shape: CircleBorder(),
    );
  }




  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PINCircle(changeColor: _numbersEntered >= 1,),
                PINCircle(changeColor: _numbersEntered >= 2,),
                PINCircle(changeColor: _numbersEntered >= 3,),
                PINCircle(changeColor: _numbersEntered >= 4,),
                PINCircle(changeColor: _numbersEntered >= 5,),
                PINCircle(changeColor: _numbersEntered >= 6,),
              ],
            ),
          ),

          //SizedBox(height: 0.1 * MediaQuery.of(context).size.height,),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _pinNumber(1),
                    _pinNumber(2),
                    _pinNumber(3),
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _pinNumber(4),
                    _pinNumber(5),
                    _pinNumber(6),
                  ],
                ),
                SizedBox(height: 50,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _pinNumber(7),
                    _pinNumber(8),
                    _pinNumber(9),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () => _reset(),
                      splashColor: Colors.white,
                      child: Text('Reset'),
                    ),
                    _pinNumber(0),
                    FlatButton(
                      onPressed: () => _deleteLast(),
                      splashColor: Colors.white,
                      child: Text('Delete'),
                    )
                  ],
                )
              ],
            ),
          )
        ],

      ),
    );
  }
}
