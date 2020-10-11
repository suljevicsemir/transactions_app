

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/models/transfer.dart';
import 'package:transactions_app/palette.dart';

class AddTransfer extends StatefulWidget {
  @override
  _AddTransferState createState() => _AddTransferState();
}

class _AddTransferState extends State<AddTransfer> {


  final _emailController = TextEditingController();
  final _amountController = TextEditingController();
  final _firestoreProvider = FirestoreProvider();

  @override
  void dispose() {
    _emailController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final _separatorTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w200
  );


  _createTransaction() async{

    String receiverId = await _firestoreProvider.getIdFromEmail(_emailController.text);

    Transfer transfer = Transfer(
      senderId: FirebaseAuth.instance.currentUser.uid,
      receiverId: receiverId,
      transferAmount: double.parse(_amountController.text),
      transferName: 'Test'
    );

    setState(() {
      _emailController.clear();
      _amountController.clear();
    });

    return transfer;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          elevation: 0.0,
          backgroundColor: Palette.themeGreen,
          title: Text('New transfer', style: TextStyle(color: Colors.white, fontSize: 20),),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 5, top: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.grey[700]
                ),
                child: Text('To account (for now enter email)', style: _separatorTextStyle,),
              ),
              Container(
                child : Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: _emailController,
                        ),
                      )
                    )
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, bottom: 5, top: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.grey[700]
                ),
                child: Text('Amount', style: _separatorTextStyle,),
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: TextField(
                          controller: _amountController,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, bottom: 5, top: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.grey[700]
                ),
                child: Text('Save as pattern?', style: _separatorTextStyle,),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                color: Palette.themeGreen,
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                onPressed: ( )async  => await _firestoreProvider.sendTransfer(await _createTransaction()),
                child: Text('Submit transfer'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
