

import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  double balance, limit, monthLimit;
  String firstName, lastName, displayName, email;

  Account.fromSnapshot(DocumentSnapshot snapshot) {
    balance = snapshot.get('balance') ;
    limit = snapshot.get('limit') ;
    monthLimit = snapshot.get('monthLimit') ;
    firstName = snapshot.get('firstName');
    lastName = snapshot.get('lastName');
    displayName = snapshot.get('displayName');
    email = snapshot.get('email');
  }


}