import 'package:flutter/material.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/controller/cheack_out_controller.dart';
import 'package:test_project/view/widget/custome_text.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheackOutController>(
      init: CheackOutController(),
      builder: (controller) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                CustomeText(
                  text: 'Billing Address same as Delivering Address',
                  fontSize: 18,
                ),
                SizedBox(height: 25),
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CustomeText(
                          text: 'Street 1',
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '21, Alex Divison united',
                          ),
                          onSaved: (value) {
                            controller.street1 = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'the field must fill';
                            }
                          }
                        ),
                        SizedBox(height: 25),
                        CustomeText(
                          text: 'Street 2',
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Oppesite omegtaron, vicent Qatar'),
                              
                          onSaved: (value) {
                            controller.street2 = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'the field must fill';
                            }
                          }
                        ),
                        SizedBox(height: 25),
                        CustomeText(
                          text: 'city',
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: '21, Alex Divison united'),
                              
                          onSaved: (value) {
                            controller.city = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'the field must fill';
                            }
                          }
                        ),
                        SizedBox(height: 25),
                        CustomeText(
                          text: 'state',
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: '21, Alex Divison united'),
                          onSaved: (value) {
                            controller.state= value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'the field must fill';
                            }
                          }
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
