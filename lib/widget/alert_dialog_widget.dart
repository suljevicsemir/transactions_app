


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PINAlertDialog extends StatelessWidget {
  final String _pin;
  PINAlertDialog(this._pin);

  _writePin() async{
    final storage = FlutterSecureStorage();
    await storage.write(key: 'pin', value: _pin);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('PIN saving'),
      content: Text('Would you like to save $_pin as your PIN number?'),
      actions: [
        FlatButton(
          onPressed: (){
          },
          child: Text('NO'),
        ),
        FlatButton(
          onPressed: () {
            _writePin();
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text('YES'),
        )
      ],
    );
  }
}
