

import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/chats/widgets/chat_tile.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Palette.themeGreen,
          automaticallyImplyLeading: false,
          title: Text('Demo Chat App', style: TextStyle(color: Colors.black, fontSize: 22),),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black,),
              splashColor: Colors.white,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _firestore.userChats,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();
            return Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Colors.black, height: 0.0,),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => ChatTile(snapshot.data.documents[index])
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
