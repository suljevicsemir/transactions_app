

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class ChatScreen extends StatefulWidget {

  static const route = '/chat';

  final ChatInfo chatInfo;
  ChatScreen({this.chatInfo});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Palette.themeGreen,
        title: Text('User Display Name', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.0),),
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
              //this is where messages go
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              height: 0.2 * MediaQuery.of(context).size.height -50,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Container(

                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(

                              decoration: InputDecoration(
                                  hintText: '  Type your query here...',
                                  hintStyle: TextStyle(color: Colors.grey),
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
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        child: IconButton(
                          splashColor: Colors.red,
                          splashRadius: 25,
                          padding: EdgeInsets.all(8),
                          color: Palette.themeGreen,
                          onPressed: () async {},
                          icon: Icon(Icons.send),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatInfo {
  final String userDisplayName, chatId, userId;

  ChatInfo({this.userDisplayName, this.chatId, this.userId});
}
