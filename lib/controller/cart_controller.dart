import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/helpers/cart_database_helper.dart';
import 'package:test_project/model/cart_model.dart';

class CartController extends GetxController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  List<CartModel> get cartModel => _cartModel;
  List<CartModel> _cartModel = [];

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;

  CartController() {
    getAllProduct();
  }

  addProduct(CartModel model) async {
    for (var i = 0; i < _cartModel.length; i++) {
      if (model.productId == _cartModel[i].productId) {
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.instance;
    await dbHelper.insert(model);
    _cartModel.add(model);
    _totalAmount += (double.parse(model.price)) * (model.quantity);

    update();
  }

  getAllProduct() async {
    isLoading.value = true;
    var dbHelper = CartDatabaseHelper.instance;
    _cartModel = await dbHelper.queryAllRows();
    isLoading.value = false;

    getTotal();
    update();
  }

  getTotal() async {
    for (var i = 0; i < _cartModel.length; i++) {
      _totalAmount +=
          (double.parse(_cartModel[i].price)) * (_cartModel[i].quantity);
    }
    update();
  }

  increaseQuantity(int index) async {
    var dbHelper = CartDatabaseHelper.instance;
    _cartModel[index].quantity++;
    _totalAmount += double.parse(_cartModel[index].price);
    await dbHelper.updateProduct(_cartModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    var dbHelper = CartDatabaseHelper.instance;
    _cartModel[index].quantity--;
    _totalAmount -= double.parse(_cartModel[index].price);
    await dbHelper.updateProduct(_cartModel[index]);
    update();
  }

  deleteProduct(int index) async {
    var dbHelper = CartDatabaseHelper.instance;
    await dbHelper.delete(_cartModel[index].productId);
    _totalAmount -= double.parse(_cartModel[index].price) * (_cartModel[index].quantity) ;
    _cartModel.removeAt(index);
    update();
  }
  
}
