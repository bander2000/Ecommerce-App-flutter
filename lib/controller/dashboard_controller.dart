import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardController extends GetxController {
  String _countProducts="5";
  String get countProducts => _countProducts;

  String _countCatogry="4";
  String get countCatogry => _countCatogry;

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  DashboardController() {
    getCountOfProductsAndCatogry();
  }

  Future<void> getCountOfProductsAndCatogry() async {
    isLoading.value = true;

    // await Firestore.instance
    //     .collection('products')
    //     .get()
    //     .then((snapshot) => _countProducts = snapshot.docs.length.toString());

    // await Firestore.instance
    //     .collection('catogries')
    //     .get()
    //     .then((snapshot) => _countCatogry = snapshot.docs.length.toString());

    isLoading.value = false;


    update();
  }
}
