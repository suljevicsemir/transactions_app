

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/models/view_models/registration.dart';

class FirebaseAuthentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  Future<bool> createAccount(AccountRegistrationModel model) async {
    final user = (await _firebaseAuth.createUserWithEmailAndPassword(email: model.email, password: model.password)).user;

    //registration succeeded
    if( user != null) {
      print('User created!');
      print('Email: ${user.email.toString()}');
      _firebaseAuth.signInWithEmailAndPassword(email: model.email , password: model.password);
      model.id = user.uid;
      _createUserData(model);
      return true;
    }

    return false;
    
  }

  signIn(AccountLoginModel model) async {
   await _firebaseAuth.signInWithEmailAndPassword(email: model.email, password: model.password);
  }

   signOut() {
    _firebaseAuth.signOut();
  }

  _createUserData(AccountRegistrationModel model) async{
  await _firestoreInstance.runTransaction((transaction) async {
    transaction.set(_firestoreInstance.collection('accounts').doc(model.id), model.toJson());
  });
  }





  

  
  







  isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }







}