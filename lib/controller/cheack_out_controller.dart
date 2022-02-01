import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/view/screen/tab_screen.dart';

class CheackOutController extends GetxController {
  int get index => _index;
  int _index = 0;
  String street1, street2, city, state;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  void changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.DeliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    } else if (i == 2) {
      formKey.currentState.save();
      if (formKey.currentState.validate()) {
        _pages = Pages.Summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(() => TabScreen());
       _pages = Pages.DeliveryTime;
      _index = 0;
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
