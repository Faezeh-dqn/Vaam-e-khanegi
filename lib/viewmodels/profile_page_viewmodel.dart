import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:vaam_khanegi/models/user.dart';
import 'package:vaam_khanegi/services/firebase_storage_service.dart';
import 'package:vaam_khanegi/services/firestore_service.dart';

class ProfilePageViewModel extends BaseViewModel {
  FirestoreService firestoreService;
  FirebaseStorageService firebaseStorageService;
  String imagePath;
  User retrivedUser;
  String firstName;
  String lastName;
  String email;
  ProfilePageViewModel(
      {@required this.firestoreService, @required this.firebaseStorageService});
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

  Future updateUser() async {
    User user = User(
      firstName: retrivedUser.firstName,
      lastName: retrivedUser.lastName,
      email: retrivedUser.email,
      image: imagePath,
      role: retrivedUser.role,
      id: retrivedUser.id,
    );

    await firestoreService.updateUser(user);
  }

  Future init() async {
    setBusy(true);
    retrivedUser = await firestoreService.retrivedUser();

    setBusy(false);
    imagePath = retrivedUser.image;
    imagePath = retrivedUser.image;
    firstName = retrivedUser.firstName;
    lastName = retrivedUser.lastName;
    email = retrivedUser.email;

    notifyListeners();
  }
}
