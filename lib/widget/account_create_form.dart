import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firebase_authentication.dart';
import 'package:transactions_app/models/view_models/registration.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/text_field_widget.dart';

class AccountCreateForm extends StatefulWidget {

  final boxShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3)
  );

  @override
  _AccountCreateFormState createState() => _AccountCreateFormState();
}

class _AccountCreateFormState extends State<AccountCreateForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _displayNameController = TextEditingController();

  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  final _firstNameNode = FocusNode();
  final _lastNameNode = FocusNode();
  final _displayNameNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _displayNameController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _firstNameNode.dispose();
    _lastNameNode.dispose();
    _displayNameNode.dispose();
    super.dispose();
  }

  final FirebaseAuthentication _firebaseAuthentication = FirebaseAuthentication();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          widget.boxShadow
        ]
      ),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CustomTextField(controller: _emailController, keyboardType: TextInputType.emailAddress, hintText: 'email', obscureText: false, focusNode: _emailNode,),
            SizedBox(height: 20,),
            CustomTextField(controller: _passwordController, keyboardType: TextInputType.visiblePassword, hintText: 'password', obscureText: true, focusNode: _passwordNode,),
            SizedBox(height: 20,),
            CustomTextField(controller: _firstNameController, keyboardType: TextInputType.name, hintText: 'first name', obscureText: false, focusNode: _firstNameNode,),
            SizedBox(height: 20,),
            CustomTextField(controller: _lastNameController, keyboardType: TextInputType.name, hintText: 'last name', obscureText: false, focusNode: _lastNameNode,),
            SizedBox(height: 20,),
            CustomTextField(controller: _displayNameController, keyboardType: TextInputType.name, hintText: 'display name', obscureText: false, focusNode: _displayNameNode,),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: RaisedButton(
                  color: Palette.themeGreen,
                  splashColor: Colors.white,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  onPressed: () async{
                    bool x = await _firebaseAuthentication.createAccount(
                        AccountRegistrationModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            displayName: _displayNameController.text)
                    );

                    if( x ) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Account created successfully!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                        backgroundColor: Colors.grey[600],
                        duration: const Duration(seconds: 3),
                      ));
                      Future.delayed(const Duration(milliseconds: 3500), () {
                        Navigator.pushReplacementNamed(context, '/pin');
                      });
                    }
                    else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Something went wrong. Try again'),
                        backgroundColor: Colors.pinkAccent,
                        duration: const Duration(seconds: 3),
                      ));
                    }
                  },
                  child: Text('Create account', style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
            ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}
