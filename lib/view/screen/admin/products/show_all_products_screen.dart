import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/admin/products/mange_products_controller.dart';
import 'package:test_project/view/screen/admin/dashboard_screen.dart';
import 'package:test_project/view/screen/admin/products/add_or_edit_product_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';

class ShowAllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MangeproductsController>(
        init: MangeproductsController(),
        builder: (controller) => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  title: Text('All Products'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.to(() => AddOrEditProductScreen(null,1));
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                              controller.productModelList[index].image,
                              fit: BoxFit.fill)),
                      title: CustomeText(
                          text: controller.productModelList[index].name,
                          fontSize: 16),
                      subtitle: CustomeText(
                        text: controller.productModelList[index].price + ' \$',
                        color: primaryColor,
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)),
                      onTap: () {
                        Get.to(() => AddOrEditProductScreen(
                            controller.productModelList[index],2));
                      },
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: controller.productModelList.length,
                  ),
                ),
              ));
  }
}
