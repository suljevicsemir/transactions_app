

import 'package:flutter/material.dart';
import 'package:transactions_app/palette.dart';

class CustomerSupportScreen extends StatefulWidget {

  static const route = '/customer_support';

  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {

  var _listHeight = 0.8;
  final _scrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
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
              onPressed: () {

              },
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
              height: _listHeight * MediaQuery.of(context).size.height,
              child: Text('Ja sam semir'),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Container(
              height: 0.2 * MediaQuery.of(context).size.height - 50,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

