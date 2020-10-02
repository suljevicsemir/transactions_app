

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/models/account.dart';

class FirestoreProvider {

  final _accounts = FirebaseFirestore.instance.collection('accounts');
  var stream = FirebaseFirestore.instance.collection('accounts')
  .doc(FirebaseAuth.instance.currentUser.uid).collection('transfers').snapshots();

  Future getUserData({String id, bool current}) async{
    if(current == true)
      return Account.fromSnapshot((await _accounts.doc(FirebaseAuth.instance.currentUser.uid).get()));

    return  Account.fromSnapshot((await _accounts.doc(id).get()));

  }

  sendMessageToCustomerSupport(String message) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      Timestamp timestamp = Timestamp.now();
      await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').doc(timestamp.millisecondsSinceEpoch.toString()).set(
        {
          'sender' : 'user',
          'receiver' : 'customer_support',
          'text' : message,
          'time' : timestamp
        }
      );
    });
  }

  sendMessageToUserFromCS(String message) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      Timestamp timestamp = Timestamp.now();
      await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').doc(timestamp.millisecondsSinceEpoch.toString()).set(
        {
          'sender' : 'customer_support',
          'receiver' : 'user',
          'text' : message,

        }
      );
    });
  }

  sendWelcomeMessages() async {
    await FirebaseFirestore.instance.runTransaction((transaction) async{

      Timestamp helloId = Timestamp.now();

      await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').doc(helloId.millisecondsSinceEpoch.toString()).set(
        {
          'sender' : 'customer_support',
          'receiver' : 'user',
          'text' : 'Hello there!',
          'timeStamp' : helloId
        }
      );

      Timestamp sendMessageId = Timestamp.now();
      await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').doc(sendMessageId.millisecondsSinceEpoch.toString()).set(
          {
            'sender' : 'customer_support',
            'receiver' : 'user',
            'text' : 'Send us a message or',
            'timeStamp' : sendMessageId
          }
      );
      Timestamp callUsId = Timestamp.now();
      await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').doc(callUsId.millisecondsSinceEpoch.toString()).set(
          {
            'sender' : 'customer_support',
            'receiver' : 'user',
            'text' : 'Call us directly by clicking the phone icon in the top right corner',
            'timeStamp' : callUsId
          }
      );



    });
  }



}