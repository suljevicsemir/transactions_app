import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/screens/chats/widgets/chat_tile.dart';
import 'package:transactions_app/screens/chats/widgets/custom_app_bar.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final FirestoreProvider _firestore = FirestoreProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: ChatsAppBar(context),
      body: SafeArea(
        child: StreamBuilder(
          stream: _firestore.userChats,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();
            return Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Colors.black, height: 0.0,),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot x = snapshot.data.documents[index];
                  if(x.get('lastMessage') == null)
                    return Container();
                  return ChatTile(snapshot.data.documents[index]);
                }
              ),
            );
          }
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }
}
