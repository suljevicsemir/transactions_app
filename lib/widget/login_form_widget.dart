import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firebase_authentication.dart';
import 'package:transactions_app/models/view_models/registration.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/widget/text_field_widget.dart';

class LoginForm extends StatefulWidget {



  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuthentication = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
            children: [
             CustomTextField(controller: _emailController, keyboardType: TextInputType.emailAddress, hintText: 'username', obscureText: false,),
             SizedBox(height: 30,),
             CustomTextField(controller: _passwordController, keyboardType: TextInputType.visiblePassword, hintText: 'password', obscureText: true),
             SizedBox(height: 10,),
             SizedBox(
               width: double.infinity,
               child: Container(
                 margin: EdgeInsets.only(left: 10, right: 10),
                 child: RaisedButton(
                   splashColor: Colors.white,
                   padding: EdgeInsets.only(top: 15, bottom: 15),
                   color: Palette.themeGreen,
                   onPressed: () {
                     _firebaseAuthentication.signIn(AccountLoginModel(_emailController.text, _passwordController.text));
                     Navigator.pushReplacementNamed(context, '/home');
                     _emailController.clear();
                     _passwordController.clear();

                   },
                   child: Text('LOGIN'),
                 ),
               ),
             ),
             SizedBox(height: 30,),
             RichText(
               text: TextSpan(text: 'Don\'t have an account ?  ', style: TextStyle(color: Colors.grey) ,
               children: [
                 TextSpan(text: 'Create an account', style: TextStyle(color: Palette.themeGreen),
                 recognizer: TapGestureRecognizer()
                 ..onTap  = () {
                    Navigator.pushReplacementNamed(context, '/accountCreate');
                 })
               ]),
             )
            ],
        ),
      ),
    );
  }
}
