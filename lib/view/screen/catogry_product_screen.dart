import 'package:flutter/material.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/catogry_products_controller.dart';
import 'package:test_project/model/catogry_model.dart';
import 'package:get/get.dart';
import 'package:test_project/view/screen/details_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';

class CatogryProductScreen extends StatelessWidget {
  CategoryModel catogryModel;

  CatogryProductScreen(this.catogryModel);

  // final controller = Get.put(CatogryProductController(catogryModel));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.catogryModel.name} products'),
      ),
      body: GetBuilder<CatogryProductController>(
        init: CatogryProductController(this.catogryModel),
        builder: (controller) => 
        controller.isLoading.value 
        ? const Center(child:  CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
                itemCount: controller.productModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, int index) => GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            DetailsScreen(controller.productModel[index]));
                      },
                      child: Container(
                        height:300,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: Get.width/1.5,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomeText(
                                  text: controller.productModel[index].name,fontSize: 25),
                              const SizedBox(height: 15),
                              CustomeText(
                                  text:
                                      controller.productModel[index].description,fontSize: 25),
                              const SizedBox(height: 15),
                              CustomeText(
                                text: controller.productModel[index].price
                                         +
                                    ' \$',
                                color: primaryColor,
                                fontSize: 25
                              )
                            ],
                          ),
                        ),
                      ),
                    ))),
      ),
    );
  }
}
