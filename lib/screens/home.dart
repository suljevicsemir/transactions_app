import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/models/account.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/transfers_search_header.dart';

import 'file:///C:/Users/ASRock%20pro/Desktop/flutter%20projects/transactions_app/lib/utils/circle_painter.dart';

class Home extends StatefulWidget {
  final _firestoreProvider = FirestoreProvider();
  static const route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  Account _userData;
  var _dynamicHeight = 0.0;
  bool isQuickActionsShowed = false;

  @override
  void initState() {
    super.initState();
    if (_userData == null) {
      _getAccountData().then((value) {
        setState(() {
          _userData = value;
        });
      });
    }

    _future = getUrl();
  }

  Future<String> _future;

  Future<String> getUrl() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('test').doc('semir').get();

    return snapshot.get('url');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            color: Palette.themeGreen,
            width: double.infinity,
            height: double.infinity,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    children: [
                      Text(
                        'Good morning!',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 18,
                            letterSpacing: 2.0,
                            fontFamily: 'Roboto'),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: _userData == null
                              ? Text('')
                              : Text(
                                  _userData.firstName +
                                      ' ' +
                                      _userData.lastName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Roboto',
                                      letterSpacing: 2.0),
                                ))
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/avatar_white_male.png"),
                        radius: 30,
                        backgroundColor: Colors.white))
              ],
            ),
            Center(
              child: FlatButton(
                onPressed: () => _quickActionsChange(),
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side:
                        BorderSide(color: Colors.white.withOpacity(0.8))),
                child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    child: isQuickActionsShowed == true
                        ? Text('Hide Quick Actions')
                        : Text('Show Quick Actions')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                Container(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CustomPaint(
                      painter: CirclePainter(),
                      child: Center(child: Text('eeo')),
                    ),
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
            ),
          ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: EdgeInsets.only(top: 130 + _dynamicHeight),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)),
            color: Colors.black),
            constraints:
            BoxConstraints(minHeight: 105, maxHeight: double.infinity),
            child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '+\$ 8,950',
                    style:
                        TextStyle(color: Palette.themeGreen, fontSize: 20),
                  ),
                  TextSpan(
                    text: '.75',
                    style: TextStyle(
                        color: Palette.themeGreen.withOpacity(0.7),
                        fontSize: 14),
                  )
                ]),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '-\$ 3,200',
                      style: TextStyle(
                          color: Colors.yellow[600], fontSize: 20)),
                  TextSpan(
                      text: '.25',
                      style: TextStyle(
                          color: Colors.yellow[600].withOpacity(0.7),
                          fontSize: 14))
                ]),
              ),
            ],
          ),
            ),
          ),
          AnimatedContainer(
           width: double.infinity,
           height: double.infinity,
           duration: const Duration(milliseconds: 500),
           margin: EdgeInsets.only(top: 185 + _dynamicHeight),
           decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
               topRight: Radius.circular(30),
               topLeft: Radius.circular(30)),
           color: Colors.white),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
                TransferSearchHeader(),
                Text('sadas'),
               Text('ss')
             ],
           )
          ),
        ],
            )
      ),
    );
  }

  Future _getAccountData() async {
    return await widget._firestoreProvider.getUserData(_currentUser.uid);
  }

  _quickActionsChange() {
    setState(() {
      if (isQuickActionsShowed) {
        isQuickActionsShowed = false;
        _dynamicHeight = 0.0;
      } else {
        isQuickActionsShowed = true;
        _dynamicHeight = 100;
      }
    });
  }
}
