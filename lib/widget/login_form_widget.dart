import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/widget/text_field_widget.dart';

class LoginForm extends StatefulWidget {



  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CustomTextField(controller: _emailController, keyboardType: TextInputType.emailAddress, hintText: 'username', obscureText: false,),
         SizedBox(height: 30,),
         CustomTextField(controller: _passwordController, keyboardType: TextInputType.visiblePassword, hintText: 'password', obscureText: true)
        ],
    );
  }
}
