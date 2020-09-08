

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transactions_app/models/account.dart';

class FirestoreProvider {

  final _accounts = FirebaseFirestore.instance.collection('accounts');

  getUserData(String id) async{
    return  Account.fromSnapshot((await _accounts.doc(id).get()));
  }



}