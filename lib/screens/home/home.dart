import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/models/account.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/home/home_widgets/drawer_widgets/drawer_items_list.dart';
import 'package:transactions_app/utils/circle_painter.dart';
import 'package:transactions_app/widget/transfer_list_item.dart';
import 'package:transactions_app/widget/transfers_search_header.dart';


class Home extends StatefulWidget {
  final _firestoreProvider = FirestoreProvider();
  static const route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  Account _userData;
  var _dynamicHeight = 0.0;
  bool isQuickActionsShowed = false;
  final _firebaseMessaging = FirebaseMessaging();


  _getToken() {
    _firebaseMessaging.getToken().then((token) {
      print("Device token: $token");
    });
  }

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message ) async {
        print('onLaunch: $message');
      },
      onLaunch: (Map<String, dynamic> message ) async {
        print('onLaunch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      }
    );
  }


  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarBrightness: Brightness.light
    ));
    if (_userData == null) {
      _getAccountData().then((value) {
        setState(() {
          _userData = value;
        });
      });
    }

    _getToken();
    _configureFirebaseListeners();
  }




  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _userData == null ?
      Scaffold(
        backgroundColor: Palette.themeGreen,
        body: Center(child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator( strokeWidth: 10,backgroundColor: Colors.grey, valueColor:  AlwaysStoppedAnimation<Color>(Palette.themeGreen),))),
      ):
      Scaffold(
        backgroundColor: Palette.themeGreen,
        key: _drawerKey,
        body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                //color: Palette.themeGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text(
                                'Good morning!',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 18,
                                    letterSpacing: 2.0,
                                    fontFamily: 'Roboto'),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: _userData == null
                                      ? Text('')
                                      : Text(
                                    _userData.firstName +
                                        ' ' +
                                        _userData.lastName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 2.0),
                                  ))
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 20),
                          child : Material(
                            color: Colors.white.withOpacity(0.0),
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              splashColor: Colors.grey[800],
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.menu),
                              ),
                              onTap: () async{
                                await Future.delayed(const Duration(milliseconds: 200), () {} );
                                _drawerKey.currentState.openEndDrawer();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: () => _quickActionsChange(),
                        color: Colors.white.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                            BorderSide(color: Colors.white.withOpacity(0.8))),
                        child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 500),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            child: isQuickActionsShowed == true
                                ? Text('Hide Quick Actions')
                                : Text('Show Quick Actions')),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: Center(child: Text('eeo')),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: Center(child: Text('eeo')),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CustomPaint(
                            painter: CirclePainter(),
                            child: Center(child: Text('eeo')),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.only(top: 130 + _dynamicHeight),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.black),
                constraints:
                BoxConstraints(minHeight: 105, maxHeight: double.infinity),
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '+\$ 8,950',
                            style:
                            TextStyle(color: Palette.themeGreen, fontSize: 20),
                          ),
                          TextSpan(
                            text: '.75',
                            style: TextStyle(
                                color: Palette.themeGreen.withOpacity(0.7),
                                fontSize: 14),
                          )
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '-\$ 3,200',
                              style: TextStyle(
                                  color: Colors.yellow[600], fontSize: 20)),
                          TextSpan(
                              text: '.25',
                              style: TextStyle(
                                  color: Colors.yellow[600].withOpacity(0.7),
                                  fontSize: 14))
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                  width: double.infinity,
                  height: double.infinity,
                  duration: const Duration(milliseconds: 500),
                  margin: EdgeInsets.only(top: 185 + _dynamicHeight),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TransferSearchHeader(),
                      StreamBuilder(
                        stream: widget._firestoreProvider.stream,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) return CircularProgressIndicator();

                          return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            shrinkWrap: true,
                            itemBuilder: (builder, index) {
                              return TransferListItem(snapshot.data.documents[index]);
                            },
                          );
                        },

                      )
                    ],
                  )
              ),
            ],
          ),
        floatingActionButton: Material(
          color: Palette.themeGreen,
          borderRadius: BorderRadius.circular(40),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            splashColor: Colors.white,
            radius: 100,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.message, size: 30, color: Colors.grey[700],),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/customer_support');
            },
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            child: DrawerItemsList()
          ),
        ),
      ),
    );
  }

  Future _getAccountData() async {
    return await widget._firestoreProvider.getUserData(current: true);
  }

  _quickActionsChange() {
    setState(() {
      if (isQuickActionsShowed) {
        isQuickActionsShowed = false;
        _dynamicHeight = 0.0;
      } else {
        isQuickActionsShowed = true;
        _dynamicHeight = 100;
      }
    });
  }
}
