

import 'package:cloud_firestore/cloud_firestore.dart';

class SearchAccountData {
   String id, firstName, lastName, displayName, email;
  SearchAccountData({this.id, this.firstName, this.lastName, this.displayName, this.email});


  SearchAccountData.fromJson(DocumentSnapshot snapshot) {
    firstName = snapshot.get('firstName');
    lastName = snapshot.get('lastName');
    displayName = snapshot.get('displayName');
    email = snapshot.get('email');
    id = snapshot.id;
  }




}