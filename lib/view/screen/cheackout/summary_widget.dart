import 'package:flutter/cupertino.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:test_project/view/widget/custome_text.dart';


class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top:15,left: 20,right: 20),
            child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height:20),
         Container(
        height: 200,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                      height: 150,
                      width: 120,
                          child: Image.network(
                              controller.cartModel[index].image,fit: BoxFit.fill,)),
                  const SizedBox(height: 5),
                  CustomeText(
                    text: controller.cartModel[index].name,
                    fontSize: 18,
                  ),
                   const SizedBox(height: 5),
                  CustomeText(
                    text: controller.cartModel[index].price.toString()+' \$',
                    fontSize: 18,
                    color: primaryColor,
                  )
                ],
              );
            },
            itemCount: controller.cartModel.length,
            separatorBuilder: (context, index) => const SizedBox(
                 width: 20,
                )),
      )
          ],
        )
            )
        )
      ),
    );
  }
}
