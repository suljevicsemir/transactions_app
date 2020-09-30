import 'package:flutter/material.dart';
import 'package:transactions_app/screens/home/home_widgets/about_bank_items.dart';
import 'package:transactions_app/screens/home/home_widgets/about_items.dart';
import 'package:transactions_app/screens/home/home_widgets/tools_items.dart';

class DrawerItemsList extends StatefulWidget {

  @override
  _DrawerItemsListState createState() => _DrawerItemsListState();
}

class _DrawerItemsListState extends State<DrawerItemsList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text('Transactions Demo App', style: TextStyle(color: Colors.grey[600], fontSize: 20),textAlign: TextAlign.center,)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.grey[800].withOpacity(0.8),
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
                margin: EdgeInsets.only(left: 10),
                child: Text('Tools', style: TextStyle(color: Colors.white, fontSize: 24),)),
          ),
          SizedBox(height: 10,),
          ToolsItems(),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.grey[800].withOpacity(0.8),
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                margin: EdgeInsets.only(left: 10),
                child: Text('About application', style: TextStyle(color: Colors.white, fontSize: 24),)),
          ),
          AboutItems(),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.grey[800].withOpacity(0.8),
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                margin: EdgeInsets.only(left: 10),
                child: Text('About bank', style: TextStyle(color: Colors.white, fontSize: 24),)),
          ),
          AboutBankItems()




        ],
      ),
    );
  }
}
