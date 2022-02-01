import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_project/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  
  //get user from method get user
  Future<UserModel> get getUser async {
    try {
      UserModel user = await getUserData();
      if (user == null) {
        return null;
      }
      return user;
    } catch (e) {
      return null;
    }
  }

  //set user in shared prefrnce
  setUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user.toJson()));
  }

  //get user in shred prefernce
  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('user');
    return UserModel.fromJson(json.decode(value));
  }

  //delete user data from prefernce
  deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.clear();
  }

}
