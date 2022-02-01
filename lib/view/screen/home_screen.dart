import 'package:flutter/material.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/auth_controller.dart';
import 'package:test_project/controller/home_controller.dart';
import 'package:test_project/controller/profile_controller.dart';
import 'package:test_project/view/screen/catogry_product_screen.dart';
import 'package:test_project/view/screen/details_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      const SizedBox(
                        height: 50,
                      ),
                      const CustomeText(text: 'Catogries', fontSize: 20),
                      const SizedBox(height: 30),
                      _listViewCategory(),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomeText(
                            text: "Best Selling",
                            fontSize: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const CustomeText(
                              text: "See all",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _listViewProducts()
                    ],
                  ),
                ),
              ));
  }

//start searchtextformfield
  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
  //end searchtextformfield

// start listViewCategory
  Widget _listViewCategory() {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(controller.categoryModel[index]);
                  Get.to(() =>
                      CatogryProductScreen(controller.categoryModel[index]));
                },
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                controller.categoryModel[index].image))),
                    const SizedBox(height: 20),
                    CustomeText(
                      text: controller.categoryModel[index].name,
                      fontSize: 18,
                    )
                  ],
                ),
              );
            },
            itemCount: controller.categoryModel.length,
            separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                )),
      ),
    );
  }
  // end listViewCategory

  //start lisViewProducts
  Widget _listViewProducts() {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(controller.productModel[index]));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomeText(
                        text: controller.productModel[index].name,
                        alignment: Alignment.bottomLeft,
                      ),
                      const SizedBox(height: 15),
                      CustomeText(
                        text: controller.productModel[index].description,
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 15),
                      CustomeText(
                        text: controller.productModel[index].price + ' \$',
                        alignment: Alignment.bottomLeft,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
            itemCount: controller.productModel.length),
      ),
    );
  }
  //end lisViewProducts

}
