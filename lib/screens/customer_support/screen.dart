

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportScreen extends StatefulWidget {

  static const route = '/customer_support';

  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {

  var _listHeight = 0.8;
  final _scrollController = ScrollController();
  final _textFieldController = TextEditingController();
  final _firestoreProvider = FirestoreProvider();
  double _welcomeMessageWidth = 0.0;
  double _welcomeMessageHeight = 0.0;
  var _chatStream;
  bool _hasText = false;
  _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    }
    else {
      Timer(Duration(milliseconds: 300), () => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { _scrollToBottom(); });

    _scrollToBottom();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Palette.themeGreen,
        title: Text('Customer support', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.0, fontFamily: 'Roboto'),),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              splashColor: Colors.grey[700],
              splashRadius: 30,
              onPressed: () async => _callCustomerSupport(),
              icon: Icon(Icons.call, color: Colors.white,),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
            child: StreamBuilder(
              stream: _chatStream,
              builder: (context, snapshot) {
                if(!snapshot.hasData) return Container();
                if(snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: _listHeight * MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) => _displayMessage(snapshot.data.documents[index])
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
               // color: Colors.red
              ),
              height: 0.2 * MediaQuery.of(context).size.height - 50,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Palette.themeGreen,
                                      width: 3
                                  )
                              )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: _textFieldController,
                              onChanged: (value) {
                                setState(() {
                                  if(value.length == 0)
                                    _hasText = false;
                                  else _hasText = true;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  _listHeight = 0.2;
                                });
                              },
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
                           onPressed: () async  {
                            if(_hasText == true) {
                              await _firestoreProvider.sendMessageToCustomerSupport(_textFieldController.text);
                              _textFieldController.clear();
                              await _scrollToBottom();
                            }
                           },
                           icon: _hasText == false ? Icon(Icons.error) : Icon(Icons.send),
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

  _displayMessage(DocumentSnapshot snapshot) {

    bool sentMessage = snapshot.get('sender') == 'user' ? true : false;

    return Align(
        alignment: sentMessage == true ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: Palette.themeGreen,
            borderRadius: BorderRadius.circular(20)
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2
          ),
          child: Text(snapshot.get('text'), style: TextStyle(color: Colors.black),),
        ),
      );
  }

  _sendMessage(String text) async {

  }

  Future<bool> _callCustomerSupport() async {
    const url = "tel:+38762551752";
    if(await canLaunch(url)) {
      await launch(url);
      return true;
    }
    return false;

  }


  _showWelcomeMessage() async {
    await Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _welcomeMessageWidth = 280;
        _welcomeMessageHeight = 140;
      });
    });
  }

  _createChatIfNotExisting() async {
    QuerySnapshot data = await FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').get();
    if(data.size == 0) {
      //show welcome messages
      await _firestoreProvider.sendWelcomeMessages();
    }
  }

  @override
  void initState() {
    super.initState();
    _showWelcomeMessage();
    _chatStream = FirebaseFirestore.instance.collection('customer_support').doc(FirebaseAuth.instance.currentUser.uid).collection('messages').snapshots();
    _createChatIfNotExisting();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }


}

