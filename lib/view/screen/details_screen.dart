import 'package:flutter/material.dart';
import 'package:test_project/controller/cart_controller.dart';
import 'package:test_project/model/cart_model.dart';
import 'package:test_project/model/product_model.dart';
import 'package:test_project/view/widget/custome_text.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;

  DetailsScreen(this.model);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                model.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomeText(
                        text: model.name,
                        fontSize: 26,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomeText(
                                      text: 'Size',
                                    ),
                                    CustomeText(
                                      text: model.sized,
                                    )
                                  ])),
                          Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const CustomeText(
                                      text: 'Color',
                                    ),
                                    Container(
                                        width: 30,
                                        height: 20,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: model.color,
                                        ))
                                  ]))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomeText(
                        text: 'Details',
                        fontSize: 26,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomeText(
                        text: model.details,
                        height: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomeText(
                        text: 'Price',
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      CustomeText(
                        text: model.price + ' \$',
                        color: Colors.green,
                      )
                    ],
                  ),
                  GetBuilder<CartController>(
                    init: CartController(),
                    builder: (controller) => FlatButton(
                        onPressed: () {
                          controller.addProduct(CartModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                              productId: model.productId));
                        },
                        color: Colors.green,
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
