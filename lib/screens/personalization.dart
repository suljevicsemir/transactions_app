

import 'package:flutter/material.dart';

class Personalization extends StatefulWidget {
  @override
  _PersonalizationState createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 20,),
            )
          ],
        ),
      ),
    );
  }
}
