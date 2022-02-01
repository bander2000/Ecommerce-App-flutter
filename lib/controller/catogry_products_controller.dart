import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/model/catogry_model.dart';
import 'package:test_project/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatogryProductController extends GetxController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  CategoryModel model;

  CatogryProductController(this.model) {
    getAllProductsForCatogry();
  }

  Future<void> getAllProductsForCatogry() async {
    isLoading.value = true;
    print(this.model.name);

    await FirebaseFirestore.instance
        .collection('products')
        .where('catogryId', isEqualTo: this.model.id)
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));
      }

      isLoading.value = false;

      update();
    });
  }
}
