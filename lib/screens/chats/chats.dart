

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Palette.themeGreen,
          automaticallyImplyLeading: false,
          title: Text('Demo Chat App', style: TextStyle(color: Colors.black, fontSize: 22),),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black,),
              splashColor: Colors.white,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }
}
