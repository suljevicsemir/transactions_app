

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/chat_service.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/chat/message_send_view_model.dart';

class ChatScreen extends StatefulWidget {

  static const route = '/chat';

  final ChatInfo chatInfo;
  ChatScreen({this.chatInfo});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _chatService = ChatService();
  final _textFieldController = TextEditingController();
  Stream _chatStream;
  bool _hasText = false;


  @override
  void initState() {
    super.initState();
    _chatStream = FirebaseFirestore.instance.collection('chats').doc(widget.chatInfo.chatId).collection('messages').limit(300).snapshots();
    _textFieldController.addListener(() {
      setState(() {
        if(_textFieldController.text.isNotEmpty)
          _hasText = true;
        else _hasText = false;
      });
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async{
    String text = _textFieldController.text;
    if(text.isEmpty) return;
    _textFieldController.clear();
    await _chatService.sendMessage(MessageSend(chatId: widget.chatInfo.chatId, messageText: text, receiverId: widget.chatInfo.userId));
  }

  @override
  Widget build(BuildContext context) {
    print('view insets bottom: ${MediaQuery.of(context).viewInsets.bottom.toString()}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Palette.themeGreen,
        title: Text(widget.chatInfo.userDisplayName, style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.0),),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              splashColor: Colors.grey[700],
              splashRadius: 30,
              onPressed: () {},
              icon: Icon(Icons.call, color: Colors.white,),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
            child: Container(
             //color: Colors.pink,
              margin: EdgeInsets.only(top: 10),
              child: StreamBuilder(
                stream: _chatStream,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return CircularProgressIndicator();
                  return Container(
                    //color: Colors.blue,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => _buildMessage(context, snapshot.data.documents[index])
                    ),
                  );
                },
              ),
            )
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  //color: Colors.blue,
                  border: Border(
                      top: BorderSide(
                          width: 0.5,
                          color: Colors.grey
                      )
                  )
              ),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _textFieldController,
                              decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 19),
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Palette.themeGreen, width: 3)
                                  ),
                                  enabledBorder: InputBorder.none
                              ),
                              cursorColor: Palette.themeGreen,
                              cursorHeight: 26,
                              cursorWidth: 2,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                          child: IconButton(
                            splashColor: Colors.red,
                            splashRadius: 25,
                            padding: EdgeInsets.all(8),
                            color: Palette.themeGreen,
                            onPressed: () async => await _sendMessage(),
                            icon: _hasText == true ? Icon(Icons.send) : Icon(Icons.thumb_up)
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(Icons.animation),
                        ),
                        IconButton(icon: Icon(Icons.ac_unit), onPressed: () {})
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 dynamic _buildMessage(BuildContext context, DocumentSnapshot snapshot) {
    if(snapshot == null) return;

    bool sentMessage = snapshot.get('senderId') == FirebaseAuth.instance.currentUser.uid ? true : false;
    return Align(
      alignment: sentMessage == true ?
      Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: sentMessage == true ? EdgeInsets.only(right: 10, bottom: 30) : EdgeInsets.only(left: 10, bottom: 30),
        decoration: BoxDecoration(
          color: Palette.themeGreen,
          borderRadius: BorderRadius.circular(10)
        ),
        constraints: BoxConstraints(
          maxWidth:  MediaQuery.of(context).size.width / 2
        ),
        child: Text(snapshot.get('text'), style: TextStyle(color: Colors.black, fontSize: 20 ),),
      ),
    );


  }
}

class ChatInfo {
  String userDisplayName, chatId, userId;

  ChatInfo({this.userDisplayName, this.chatId, this.userId});

  ChatInfo.fromChatsSnapshot(DocumentSnapshot snapshot) {
    userDisplayName = snapshot.get('displayName');
    chatId = snapshot.id;
    userId = snapshot.get('participantUserId');
  }

}
