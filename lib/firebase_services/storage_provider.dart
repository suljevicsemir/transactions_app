import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageProvider{

  Future<void> updateProfilePicture() async {
    var imagePicker = ImagePicker();
    final StorageReference storageReference = FirebaseStorage.instance.ref();
    File image;
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if( pickedFile != null) {
      image = File(pickedFile.path);
      StorageTaskSnapshot addImg = await storageReference.child("profilePictures/").putFile(image).onComplete;
      var downloadUrl = await addImg.ref.getDownloadURL();
      String profilePictureUrl = downloadUrl.toString();
      if(addImg.error == null) {
        print('Successfully updated picture');
      }
      else print('E ne valja nesto');

    }
  }





}