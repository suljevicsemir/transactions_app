import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/firebase_services/storage_provider.dart';
import 'package:transactions_app/models/account.dart';
import 'package:transactions_app/palette.dart';
import 'package:transactions_app/screens/personalization/personalization_widgets/user_data_display.dart';
class PersonalizationScreen extends StatefulWidget {
  @override
  _PersonalizationScreenState createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> with TickerProviderStateMixin {

  final _storageProvider = StorageProvider();
  final _firestore = FirestoreProvider();
  Account _userData;
  AnimationController _firstRowController;
  AnimationController _secondRowController;
  AnimationController _thirdRowController;
  Animation<Offset> _offsetFirstRow;
  Animation<Offset> _offsetSecondRow;
  Animation<Offset> _offsetThirdRow;




  Uint8List imageBytes;
  String errorMsg;

  _loadImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
     await _storageProvider.storageReference(uid).getData(100000000).then((value) {
       setState(() {
         imageBytes = value;
       });
     } );

    } catch( e) {
      print(e.error.toString());
    }
  }





  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
    ));
    _firestore.getUserData(current: true).then((value) {
      setState(() {
        _userData = value;
      });
    });
    _loadImage();

    _prepareAnimation();

    Timer(const Duration(milliseconds: 200), ()  {
      _prepareThirdRow();
    });


  }

  _prepareAnimation()  {
    _firstRowController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500)
    );
    _secondRowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    );



    _offsetFirstRow = Tween<Offset>(begin: Offset(0.0, 10.0), end: Offset(0.0, 0.0) ).animate(_firstRowController);
    _offsetSecondRow = Tween<Offset>(begin: Offset(4.0, 0.5), end: Offset(0.0, 0.5) ).animate(_secondRowController);
    _firstRowController.forward();
    _secondRowController.forward();
  }

  _prepareThirdRow() {
    _thirdRowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300)
    );
    _offsetThirdRow = Tween<Offset>(begin: Offset(4.0, 0.5), end: Offset(0.0, 0.5) ).animate(_thirdRowController);
    _thirdRowController.forward();
  }

  String x = 'asdas';
  @override
  void dispose() {
    _firstRowController.dispose();
    _secondRowController.dispose();
    super.dispose();
  }

  _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return Wrap(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text('Edit profile photo', style: TextStyle(color: Colors.black, fontSize: 22),))),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: ListTile(
                onTap: ()  {
                  _storageProvider.updateProfilePictureFromGallery();
                  Navigator.of(context).pop();
                  //initState();
                },
                leading: ClipOval(
                  child: Material(
                    color: Colors.green,
                    child: InkWell(
                      splashColor: Colors.grey,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.photo, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
                title: Text('Gallery'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: ListTile(
                onTap: () {},
                leading: ClipOval(
                  child: Material(
                    color: Colors.blue,
                    child: InkWell(
                      splashColor: Colors.grey,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.camera_alt, color: Colors.white,),
                      )
                    ),
                  ),
                ),
                title: Text('Camera'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: ListTile(
                onTap: () {
                  _storageProvider.deleteProfilePicture();
                  Navigator.of(context).pop();
               // initState();
                },
                leading: ClipOval(
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                        splashColor: Colors.grey,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.delete, color: Colors.white,),
                        )
                    ),
                  ),
                ),
                title: Text('Remove photo'),
              ),
            )
          ],
        );
      }
    );
  }

  double _top = 0.0;
  @override
  Widget build(BuildContext context) {

    return _userData == null  ? Center(child: CircularProgressIndicator()) : NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver : SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  iconTheme: IconThemeData(
                    color: Palette.themeGreen,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 2.0,
                  expandedHeight: MediaQuery.of(context).size.height * 0.45,
                  pinned: true,
                  actions: [
                    IconButton(
                      splashRadius: 20,
                      splashColor: Colors.grey[600],
                      onPressed: () => _showBottomSheet(),
                      icon: Icon(Icons.edit, color: Palette.themeGreen, size: 26,),
                    ),
                    IconButton(
                      splashRadius: 20,
                      splashColor: Colors.grey[600],
                      onPressed: () {},
                      icon: Icon(Icons.settings, color: Palette.themeGreen, size: 26,),
                    ),
                  ],
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      _top = constraints.biggest.height;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 900),
                        child : FlexibleSpaceBar(
                            titlePadding: EdgeInsets.only(left: _top <= 100 ? 50 : 30, bottom: 15),
                            title: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 500),
                              style: _top <= 100 ? TextStyle(color: Colors.black, fontSize: 20) :
                              TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400, letterSpacing: 2.0),
                              child: Text(_userData.displayName),
                              //curve: Curves.fastLinearToSlowEaseIn,
                            ),
                            background: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child,),
                                child: imageBytes == null ?
                                Container(
                                  key: ValueKey<int>(0),
                                  decoration: BoxDecoration(

                                  ),
                                )
                                    :
                                Container(
                                  key: ValueKey<int>(1),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: DecorationImage(
                                          image: MemoryImage(imageBytes),
                                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                )
                            )

                        ),
                      );
                    },
                  ),

                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child : Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SlideTransition(
                  position: _offsetFirstRow,
                  child: UserDataDisplay(dataLeft: _userData.balance, labelLeft: 'Balance', dataRight: _userData.limit, labelRight: 'Limit', inline: false,)
                ),
                SlideTransition(
                  position: _offsetSecondRow,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_userData.monthLimit.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                        Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text('Month limit', style: TextStyle(color: Colors.grey[600], fontSize: 16),)
                        )
                      ],
                    ),
                  ),
                ),
                SlideTransition(
                  position: _offsetThirdRow,
                  child:  Container(
                    margin: EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_userData.email, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                        Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text('Email', style: TextStyle(color: Colors.grey[600], fontSize: 16),)
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }


}


