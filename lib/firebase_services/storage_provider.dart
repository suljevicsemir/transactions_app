import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageProvider{

  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateProfilePictureFromGallery() async {
    var imagePicker = ImagePicker();
    final StorageReference storageReference = FirebaseStorage.instance.ref();
    File image;
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if( pickedFile != null) {
      image = File(pickedFile.path);
      StorageTaskSnapshot addImg = await storageReference.child("profilePictures/${FirebaseAuth.instance.currentUser.uid}").putFile(image).onComplete;
      var downloadUrl = await addImg.ref.getDownloadURL();
      String profilePictureUrl = downloadUrl.toString();
      if(addImg.error == null) {
        print('Successfully updated picture');
      }
      else print('E ne valja nesto');

    }
  }

  Future<void> updateProfilePictureFromCamera() async {

  }


  Future<dynamic> loadImage() async {
    String uid = auth.currentUser.uid;
    return await storage.ref().child('profilePictures/$uid').getDownloadURL();
  }

  String getProfilePictureURL() {
   String url =  loadImage().toString();
    if(url == null) return "NO PICTURE";

    return url;
  }







}