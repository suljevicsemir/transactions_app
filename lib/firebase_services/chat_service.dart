import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transactions_app/screens/chat/message_send_view_model.dart';

class ChatService {

  final _chats = FirebaseFirestore.instance.collection('chats');
  final _instance = FirebaseFirestore.instance;
  final _users = FirebaseFirestore.instance.collection('accounts');


  Future<void> sendMessage(MessageSend messageInfo) async {
    String currentUserId = FirebaseAuth.instance.currentUser.uid;
    Timestamp timestamp = Timestamp.now();

    //add message to message chats
    await _instance.runTransaction((transaction) async {
      transaction.set(_chats.doc(messageInfo.chatId).collection('messages').doc(DateTime.now().millisecondsSinceEpoch.toString()), {
        'senderId' : currentUserId,
        'text' : messageInfo.messageText,
        'time' : timestamp
      });

    });

    await _instance.runTransaction((transaction) async {
      transaction.update(_users.doc(currentUserId).collection('chats').doc(messageInfo.chatId), {
        'lastMessage' : messageInfo.messageText,
        'lastMessageTimestamp' : timestamp,
        'senderId' : currentUserId
      });

      print('zavrsila transakcija');
    });

    await _instance.runTransaction((transaction) async {
      transaction.update(_users.doc(messageInfo.receiverId).collection('chats').doc(messageInfo.chatId), {
        'lastMessage' : messageInfo.messageText,
        'lastMessageTimestamp' : timestamp,
        'senderId' : currentUserId
      });
    });







  }





}