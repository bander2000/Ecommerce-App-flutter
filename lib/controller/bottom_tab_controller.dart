import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/view/screen/admin/dashboard_screen.dart';
import 'package:test_project/view/screen/cart_screen.dart';
import 'package:test_project/view/screen/home_screen.dart';
import 'package:test_project/view/screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomTabController extends GetxController {
  int _navigatorValue = 0;
  FirebaseAuth auth = FirebaseAuth.instance;

  get navigatorValue => _navigatorValue;

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;


  BottomTabController() {
    authroizeUser();
  }

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          currentScreen = ProfileScreen();
          break;
        }
      case 3:
        {
          currentScreen = DashboardScreen();
          break;
        }
    }
    update();
  }

  //get and authroize user is admin or defualt user
  Future<void> authroizeUser() async {
  
    final User user = auth.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      // cheack if user is admin or not
      if (value.get("role") == "admin") {
        _isAdmin = true;
        update();
      } else {
        _isAdmin = false;
        update();
      }
    });
  }
}
