import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/admin/products/mange_products_controller.dart';
import 'package:test_project/model/product_model.dart';

class AddOrEditProductScreen extends StatefulWidget {
  ProductModel product;
  int addOrEditFlag;

  AddOrEditProductScreen(this.product, this.addOrEditFlag);

  @override
  State<AddOrEditProductScreen> createState() => _AddOrEditProductScreenState();
}

class _AddOrEditProductScreenState extends State<AddOrEditProductScreen> {
  MangeproductsController Controller = Get.put(MangeproductsController());

  @override
  void initState() {
      if (widget.product != null && widget.product.productId != null) {
        // print(Controller.product.name);
        Controller.nameController.text = widget.product.name;
        Controller.descriptionController.text = widget.product.description;
        Controller.detailsController.text = widget.product.details;
        Controller.colorController.text = widget.product.color.toString();
        Controller.sizedController.text = widget.product.sized;
        Controller.imageUrlController.text = widget.product.image;
        Controller.priceController.text = widget.product.price;
      }
     

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MangeproductsController>(
        init: Get.find(),
        builder: (controller) => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Or Create Product'),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () => controller.addOrUpdateProduct(
                            widget.product.productId, widget.addOrEditFlag)),
                  ],
                ),
                body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: controller.nameController,
                              decoration: InputDecoration(labelText: 'Title'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please provide a value.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.nameController.text = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.descriptionController,
                              decoration:
                                  InputDecoration(labelText: 'Description'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please provide a value.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.descriptionController.text = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.detailsController,
                              decoration: InputDecoration(labelText: 'Details'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please provide a value.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.detailsController.text = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.sizedController,
                              decoration: InputDecoration(labelText: 'Sized'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please provide a value.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.sizedController.text = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.colorController,
                              decoration: InputDecoration(labelText: 'Color'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please provide a value.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.colorController.text = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.priceController,
                              decoration: InputDecoration(labelText: 'Price'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a price.';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Please enter a valid number.';
                                }
                                if (double.parse(value) <= 0) {
                                  return 'Please enter a number greater than zero.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.priceController.text = value;
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 100,
                                  margin: EdgeInsets.only(
                                    top: 8,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: controller
                                          .imageUrlController.text.isEmpty
                                      ? Text('Enter a URL')
                                      : FittedBox(
                                          child: Image.network(
                                            controller.imageUrlController.text,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Image URL'),
                                    keyboardType: TextInputType.url,
                                    textInputAction: TextInputAction.done,
                                    controller: controller.imageUrlController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter an image URL.';
                                      }
                                      if (!value.startsWith('http') &&
                                          !value.startsWith('https')) {
                                        return 'Please enter a valid URL.';
                                      }

                                      return null;
                                    },
                                    onSaved: (value) {
                                      controller.imageUrlController.text =
                                          value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ));
  }
}
