import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_project/controller/image_picker_controller.dart';
import 'package:test_project/helpers/local_storage_data.dart';
import 'package:test_project/model/user_model.dart';
import 'package:test_project/view/screen/admin/dashboard_screen.dart';
import 'package:test_project/view/screen/home_screen.dart';
import 'package:test_project/view/screen/tab_screen.dart';

class AuthController extends GetxController {
  String email;
  String password;
  String name;
  String role;
  String pic;
  String url = 'defualt';
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential authResult;
  UserModel user;

  bool get isAdmin => _isAdmin;
  bool _isAdmin = false;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ImagePickerController imagePickercontroller =
      Get.put(ImagePickerController());

  LocalStorageData localStorageData = Get.put(LocalStorageData());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (auth.currentUser != null) {
      getAndSetUserForSharedPrefernce(auth.currentUser.uid);
    }
  }

  void signInWihtEmailAndPaaword() async {
    isLoading.value = true;

    try {
      authResult = await auth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());

      // get and set user for shared prefrence
      getAndSetUserForSharedPrefernce(authResult.user.uid);

      Get.offAll(() => TabScreen());
    } catch (e) {
      var message = 'An Error occurred, please check your credantiols';

      if (e.message != null) {
        message = e.message;
      }
      Get.snackbar('Error Login Account', message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value = false;
  }

  void signUpWihtEmailAndPaaword() async {
    isLoading.value = true;

    try {
      authResult = await auth.createUserWithEmailAndPassword(
          email: email.toString().trim(), password: password.toString().trim());

      if (imagePickercontroller.pickedImageFile != null) {
        storeImage();
      }

      user = UserModel(
          userId: authResult.user.uid,
          name: name,
          email: authResult.user.email,
          pic: url,
          role: 'user');

      // set user for shared prefernce
      setUserForSharedPrefernce(user);

      // set user for firestore
      setUserForFireStore(authResult.user.uid);

      Get.offAll(() => const TabScreen());
    } catch (e) {
      var message = 'An Error occurred, please check your credantiols';

      if (e.message != null) {
        message = e.message;
      }
      Get.snackbar('Error Sign up Account', message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }

    isLoading.value = true;
  }

  // git current user and set in shared prefernce for sign in
  void getAndSetUserForSharedPrefernce(String id) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((value) {
      setUserForSharedPrefernce(UserModel.fromJson(value.data()));
    });
  }

  //  set user in firestore for sign up
  void setUserForFireStore(String id) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(user.toJson());
  }

  //set user in shared prefernce for sign in and sign in
  void setUserForSharedPrefernce(UserModel user) async {
    await localStorageData.setUserData(user);
  }

// set user image on fire storage
  void storeImage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(authResult.user.uid + '.jpg');

    await ref.putFile(imagePickercontroller.pickedImageFile);

    url = await ref.getDownloadURL();
  }
}
