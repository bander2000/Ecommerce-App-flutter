import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/model/catogry_model.dart';
import 'package:test_project/model/product_model.dart';
import 'package:test_project/view/screen/cart_screen.dart';
import 'package:test_project/view/screen/home_screen.dart';
import 'package:test_project/view/screen/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  HomeController() {
    getCategory();
    getProducts();
  }

//get catogry information
  getCategory() async {
    isLoading.value = true;

    await FirebaseFirestore.instance
        .collection('catogries')
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
      }
      isLoading.value = false;

      update();
    });
  }
//end catogry information

//get prodcuts information
  getProducts() async {
    isLoading.value = true;

    await FirebaseFirestore.instance.collection('products').get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));
      }

      print(_productModel);

      isLoading.value = false;

      update();
    });
  }
//end products information

}
