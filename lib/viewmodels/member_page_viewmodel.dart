import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/service_locator.dart';
import 'package:vaam_khanegi/services/firebase_storage_service.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';
import 'package:vaam_khanegi/services/global_state.dart';

import 'package:flutter/material.dart';

class MemberPageViewModel extends BaseViewModel {
  List members = [];
  String imagePath;
  User retrivedUser;
  FirestoreService firestoreService;
  FirebaseStorageService firebaseStorageService;
  MemberPageViewModel(
      {@required this.firestoreService, @required this.firebaseStorageService});
  Future getMembers() async {
    setBusy(true);
    members = await firestoreService.getMembers();

    setBusy(false);
  }

  loan() {
    GlobalState globalState = getIt<GlobalState>();
    List fetchedLoans = [];
    globalState.loans = fetchedLoans;
  }

  List loans = getIt<GlobalState>().loans;

  uploadPic() async {
    File imageFile;
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      String result = await firebaseStorageService.uploadPic(imageFile);
      if (result != null) {
        imagePath = result;
        User updatedUSeresheha = retrivedUser.copyWith(
          image: imagePath,
        );
        await firestoreService.updateUser(updatedUSeresheha);
      }
    }
    notifyListeners();
  }
}
