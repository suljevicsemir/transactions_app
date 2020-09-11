

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/models/account.dart';

class FirestoreProvider {

  final _accounts = FirebaseFirestore.instance.collection('accounts');
  var stream = FirebaseFirestore.instance.collection('accounts')
  .doc(FirebaseAuth.instance.currentUser.uid).collection('transfers').snapshots();

  getUserData(String id) async{
    return  Account.fromSnapshot((await _accounts.doc(id).get()));
  }



}