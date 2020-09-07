import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/account_create_form.dart';

class AccountCreate extends StatefulWidget {

  static const route = '/accountCreate';

  @override
  _AccountCreateState createState() => _AccountCreateState();
}

class _AccountCreateState extends State<AccountCreate> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themeGreen,
      appBar: AppBar(
        backgroundColor: Palette.themeGreen,
        title: Text('Create your account', style: TextStyle(color: Colors.white, fontSize: 22),),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(child: SingleChildScrollView(child: AccountCreateForm()))

    );
  }
}
