import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

class FirebaseStorageService {
  final FirebaseStorage firebaseStorage;

  FirebaseStorageService({
    @required this.firebaseStorage,
  });

  Future<String> uploadPic(File image) async {
    String fileName = basename(image.path);
    UploadTask uploadTask =
        firebaseStorage.ref().child(fileName).putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    if (taskSnapshot != null) {
      return taskSnapshot.ref.getDownloadURL();
    } else {
      return '';
    }
  }
}
