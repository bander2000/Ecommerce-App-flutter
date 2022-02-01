import 'package:flutter/material.dart';
import 'package:test_project/controller/cart_controller.dart';
import 'package:test_project/view/screen/cheackout/cheackout_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) => controller.cartModel.length == 0
            ? Column(
                children: [
                  Image.asset('assets/images/empty_cart.png'),
                  const SizedBox(height: 30),
                  const CustomeText(
                    text: 'Empty Cart',
                    alignment: Alignment.center,
                  )
                ],
              )
            : Column(children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(controller.cartModel[index].productId),
                              onDismissed: (direction) {
                                controller.deleteProduct(index);
                              },
                              background: Container(
                                child: Icon(Icons.delete),
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                              ),
                              child: Container(
                                  height: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Image.network(
                                            controller.cartModel[index].image),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomeText(
                                            text: controller
                                                .cartModel[index].name,
                                            fontSize: 20,
                                          ),
                                          const SizedBox(height: 10),
                                          CustomeText(
                                            text: controller
                                                    .cartModel[index].price +
                                                ' \$',
                                            color: Colors.green,
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            width: 100,
                                            height: 40,
                                            color: Colors.grey.shade200,
                                            child: GetBuilder<CartController>(
                                              builder: (controller) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  CustomeText(
                                                    text: controller
                                                        .cartModel[index]
                                                        .quantity
                                                        .toString(),
                                                    color: Colors.black,
                                                    alignment: Alignment.center,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          Icons.minimize,
                                                          color: Colors.black,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemCount: controller.cartModel.length)),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CustomeText(
                            text: 'Total',
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          const SizedBox(height: 15),
                          GetBuilder<CartController>(
                            builder: (controller) => CustomeText(
                                text: '\$' + controller.totalAmount.toString(),
                                color: Colors.green),
                          )
                        ],
                      ),
                      FlatButton(
                          onPressed: () {
                            Get.to(() => CheackoutScreen());
                          },
                          color: Colors.green,
                          child: const Text(
                            'Cheack Out',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                )
              ]));
  }
}
