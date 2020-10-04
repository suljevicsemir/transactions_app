

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

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

  final _separatorTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w200
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

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
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(

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
            ],
          ),
        ),
      ),
    );
  }
}
