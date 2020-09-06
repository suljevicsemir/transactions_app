import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firebase_authentication.dart';
import 'package:transactions_app/screens/login_screens/login_credentials.dart';
import 'package:transactions_app/screens/pin_screen.dart';

class Wrapper extends StatelessWidget {

  final _firebaseAuth = FirebaseAuthentication();
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return _firebaseAuth.isSignedIn() == true ? PINState() : LoginCredentials();
  }
}

