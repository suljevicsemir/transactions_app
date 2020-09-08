

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/circle_painter.dart';

class Home extends StatefulWidget {

  static const route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream _stream;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final  _currentUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot userData;
  String userName;
  @override
  void initState()  {
    super.initState();
    isInfoOpened = false;

  }

  _changeInfoState() {
    setState(() {
      if(isInfoOpened) isInfoOpened = false;
      else isInfoOpened = true;
    });
  }


  bool isInfoOpened;

  var infoBoxConstraintsOpened = BoxConstraints(
    minHeight: 200,
  );
  var infoBoxConstraintsClosed = BoxConstraints(
    maxHeight: 100
  );



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Palette.themeGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text('Good morning!', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 18, letterSpacing: 2.0, fontFamily: 'Roboto'), ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Roboto', letterSpacing: 2.0),))
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/avatar_white_male.png"),
                              radius: 30,
                              backgroundColor: Colors.white,
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: CustomPaint(
                              painter: CirclePainter(),
                              child: Center(child: Text('eeo')),
                            ),
                          ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: Center(child: Text('eeo')),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: Center(child: Text('eeo')),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),
            ),
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.only(top: 95),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    ),
                    color: Colors.black
                ),
              ),
            ),
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.only(top: 160),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    ),
                    color: Colors.white
                ),
              ),
            ),



          ],
        )
      )

    );

  }

}