import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_project/helpers/local_storage_data.dart';
import 'package:test_project/model/user_model.dart';
import 'package:test_project/view/screen/login_screen.dart';

class ProfileController extends GetxController {
  LocalStorageData localStorageData = Get.put(LocalStorageData());
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void onInit() async {
    super.onInit();
    getCurrentUser();
  }

  UserModel get user => _user;
  UserModel _user;

  Future<Void> signOut() async {
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserData();
    Get.offAll(LoginScreen());
  }

  getCurrentUser() async {
    isLoading.value = true;
    await localStorageData.getUser.then((value) => _user = value);
    isLoading.value = false;
    update();
  }
}
