import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/dashboard_controller.dart';
import 'package:test_project/view/screen/admin/products/show_all_products_screen.dart';
import 'package:test_project/view/screen/home_screen.dart';
import 'package:test_project/view/screen/tab_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.green,
        ),
        body: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Card(
                    margin: EdgeInsets.all(40),
                    color: Colors.grey.shade400,
                    child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            const CustomeText(
                              text: 'Statics',
                              alignment: Alignment.center,
                              fontSize: 22,
                            ),
                            const SizedBox(height: 50),
                            const CustomeText(
                              text: 'products',
                              alignment: Alignment.center,
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ShowAllProductsScreen());
                              },
                              child: CustomeText(
                                text: controller.countProducts,
                                alignment: Alignment.center,
                                color: Colors.blueAccent,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 35),
                            const CustomeText(
                              text: 'catogries',
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 20),
                            CustomeText(
                              text: controller.countCatogry,
                              alignment: Alignment.center,
                              fontSize: 18,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(height: 35),
                            const CustomeText(
                              text: 'payment',
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 20),
                            const CustomeText(
                              text: '400' + ' \$',
                              alignment: Alignment.center,
                              fontSize: 18,
                              color: Colors.blueAccent,
                            )
                          ],
                        )),
                  ),
                ),
        ));
  }
}
