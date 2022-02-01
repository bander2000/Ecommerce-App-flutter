import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/auth_controller.dart';
import 'package:test_project/controller/bottom_tab_controller.dart';
import 'package:test_project/controller/cart_controller.dart';
import 'package:test_project/controller/catogry_products_controller.dart';
import 'package:test_project/controller/cheack_out_controller.dart';
import 'package:test_project/controller/home_controller.dart';
import 'package:test_project/controller/profile_controller.dart';
import 'package:test_project/helpers/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    void dependencies() {
      Get.lazyPut(() => AuthController());
      Get.lazyPut(() => HomeController());
      Get.lazyPut(() => BottomTabController());
      Get.lazyPut(() => CartController());
      Get.lazyPut(() => ProfileController());
      Get.lazyPut(() => CheackOutController());

    }
  }
}
