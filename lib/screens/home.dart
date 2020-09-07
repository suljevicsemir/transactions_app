

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

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

    if(userName == null) {
       _getUserName().then((value) {
        setState(() {
          userName = value;
        });
      });
    }

  }





  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        backgroundColor: Palette.themeGreen,
        appBar: AppBar(
          backgroundColor: Palette.themeGreen,
          title: userName == null ? Text('') : Text('Hello ' + userName),
          elevation: 0.0,
        ),
        body: Center(
          child: Text('Dje si semao'),
        ),
        drawer: Drawer(

        ),
      ),
    );
  }

  Future _getUserName() async{
    userData = await _firestoreInstance.collection('accounts').doc(_currentUser.uid).get();
    final data = userData;
    return data.get('firstName');


  }


}
