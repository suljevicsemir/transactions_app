

import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/models/view_models/registration.dart';

class FirebaseAuthentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<bool> createAccount(AccountRegistrationModel model) async {
    final user = (await _firebaseAuth.createUserWithEmailAndPassword(email: model.email, password: model.password)).user;

    //registration succeeded
    if( user != null) {
      print('User created!');
      print('Email: ${user.email.toString()}');
      _firebaseAuth.signInWithEmailAndPassword(email: model.email , password: model.password);

      return true;
    }

    return false;
    
  }

  signOut() {
    _firebaseAuth.signOut();
  }
  

  
  







  isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }







}