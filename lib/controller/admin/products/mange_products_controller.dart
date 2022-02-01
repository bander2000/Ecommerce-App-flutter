import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_project/view/screen/admin/products/show_all_products_screen.dart';

class MangeproductsController extends GetxController {
  List<ProductModel> get productModelList => _productModelList;
  List<ProductModel> _productModelList = [];

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController imageUrlController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController detailsController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController sizedController = new TextEditingController();
  TextEditingController catogryIdController = new TextEditingController();
  TextEditingController colorController = new TextEditingController();

  MangeproductsController() {
    getAllProducts();
  }

  //get prodcuts information
  Future<void> getAllProducts() async {
    isLoading.value = true;

    await FirebaseFirestore.instance.collection('products').get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _productModelList.add(ProductModel.fromJson(value.docs[i].data()));
      }

      isLoading.value = false;
    });

    update();
  }
  //end products information

  //add or update prodcuts information
  Future<void> addOrUpdateProduct(String id, int addOrEditFlag) async {
    isLoading.value = true;
    final isValid = formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState.save();
    if (addOrEditFlag == 2) {
      CollectionReference product =
          FirebaseFirestore.instance.collection("products");
      product.doc(id).update({
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'details': detailsController.text,
        'catogryId': catogryIdController.text,
        'sized': sizedController.text,
        'color': colorController.text,
        'image': imageUrlController.text
      });
    } else {
      DocumentReference ref =
          Firestore.instance.collection("products").document();
      ref.setData({
        'productId': ref.documentID,
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'details': detailsController.text,
        'catogryId': catogryIdController.text,
        'sized': sizedController.text,
        'color': colorController.text,
        'image': imageUrlController.text
      });
      _productModelList.add(ProductModel.fromJson({
        'productId': ref.documentID,
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'details': detailsController.text,
        'catogryId': catogryIdController.text,
        'sized': sizedController.text,
        'color': colorController.text,
        'image': imageUrlController.text
      }));
    }
    isLoading.value = false;
    update();
  }
}
