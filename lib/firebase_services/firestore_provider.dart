

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/models/account.dart';
import 'package:transactions_app/models/transfer.dart';
import 'package:transactions_app/models/view_models/search_account_data.dart';

class FirestoreProvider {

  final _accounts = FirebaseFirestore.instance.collection('accounts');
  var stream = FirebaseFirestore.instance.collection('accounts')
  .doc(FirebaseAuth.instance.currentUser.uid).collection('transfers').snapshots();
  final  userChats = FirebaseFirestore.instance.collection('accounts').doc(FirebaseAuth.instance.currentUser.uid).collection('chats').snapshots();

  static FirebaseFirestore instance() {
    return FirebaseFirestore.instance;
  }
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

  sendTransfer(Transfer transfer) async {

    await _accounts.doc(transfer.senderId).collection('transfers').add({
      'senderId' : transfer.senderId,
      'receiverId' : transfer.receiverId,
      'transferAmount' : transfer.transferAmount,
      'transferName' : transfer.transferName,
      'timestamp' : transfer.timestamp
    });

    await _accounts.doc(transfer.receiverId).collection('transfers').add({
      'senderId' : transfer.senderId,
      'receiverId' : transfer.receiverId,
      'transferAmount' : transfer.transferAmount,
      'transferName' : transfer.transferName,
      'timestamp' : transfer.timestamp
    });


  }


  //quick solution for sending transfers
  Future<String> getIdFromEmail(String email) async {
    String id;

    var x =  await FirebaseFirestore.instance.collection('accounts').where('email', isEqualTo: email).get();
    x.docs.forEach((element) {
      id = element.id;
      return;
    });

    return id;
  }

  Future<List<SearchAccountData>> getAllAccounts() async {
    List<SearchAccountData> accountsList = List<SearchAccountData>();
    QuerySnapshot accounts = await _accounts.get();
    var list = accounts.docs;
    for(int i = 0; i < list.length; i++) {
      accountsList.add(SearchAccountData.fromJson(list.elementAt(i)));
    }
    return accountsList;
  }


}