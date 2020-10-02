import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transactions_app/firebase_services/firestore_provider.dart';
import 'package:transactions_app/firebase_services/storage_provider.dart';
import 'package:transactions_app/models/account.dart';
import 'package:transactions_app/palette.dart';

class PersonalizationScreen extends StatefulWidget {
  @override
  _PersonalizationScreenState createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen>  with SingleTickerProviderStateMixin {

  final _storageProvider = StorageProvider();
  final _firestore = FirestoreProvider();
  Account _userData;
  String _imageURL;


  Uint8List imageBytes;
  String errorMsg;

  _loadImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
     await FirebaseStorage.instance.ref().child('profilePictures/$uid').getData(100000000).then((value) =>
          setState(() {
            imageBytes = value;
          })
      );
    } catch( e) {
      print(e.error.toString());
    }
  }





  @override
  void initState() {
    super.initState();
    _firestore.getUserData(current: true).then((value) {
      setState(() {
        _userData = value;
      });
    });
    _loadImage();



  }


  @override
  void dispose() {
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
                onTap: () => _storageProvider.updateProfilePictureFromGallery(),
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
                onTap: () {},
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
          child : Container(
            child: Column(
              children: [

              ],
            ),
          ),
        )
    );
  }
}


