import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transactions_app/assets/images_pathes.dart';
import 'package:transactions_app/screens/chat/chat.dart';

class ChatTile extends StatefulWidget {

  final DocumentSnapshot snapshot;
  ChatTile(this.snapshot);

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  bool tapped = false;
  //TODO last message seen shit



  _messageTimeAgo(Timestamp t) {
    return timeago.format(t.toDate(), locale: 'en_short');
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = true;
        });
        ChatInfo chatInfo = ChatInfo.fromChatsSnapshot(widget.snapshot);
        Timer(const Duration(milliseconds: 350), () {
          Navigator.pushNamed(context, '/chat', arguments: chatInfo);
          setState(() {
            tapped = false;
          });
        });
        },
      onLongPress: () {
        setState(() {
          tapped = true;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          tapped = false;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInQuint,
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 80,
        color: tapped == true ? Colors.grey[800].withOpacity(0.5) : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage(ImagesPaths.avatarWhiteMale),
                radius: 30.0,
                backgroundColor: Colors.transparent,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.snapshot.get('displayName'), style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height: 20,),
                  Text(widget.snapshot.get('lastMessage'), style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 30, top: 5),
              child: Text(_messageTimeAgo(widget.snapshot.get('lastMessageTimestamp')), style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
