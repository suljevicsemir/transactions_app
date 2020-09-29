

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class CustomerSupportScreen extends StatefulWidget {

  static const route = '/customer_support';

  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.themeGreen,
        title: Text('Customer support', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.0, fontFamily: 'Roboto'),),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              splashColor: Colors.grey[700],
              splashRadius: 30,
              onPressed: () {

              },
              icon: Icon(Icons.call, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

