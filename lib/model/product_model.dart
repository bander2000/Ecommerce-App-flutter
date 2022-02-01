import 'package:flutter/cupertino.dart';
import 'package:test_project/helpers/extenstion.dart';

class ProductModel {
  String name, image, description, sized, price, details, productId, catogryId;
  Color color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.sized,
      this.price,
      this.productId,
      this.catogryId, String });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    sized = map['sized'];
    price = map['price'];
    details = map['details'];
    productId = map['productId'];
    color = HexColor.fromHex(map['color']);
    catogryId = map['catogryId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'sized': sized,
      'price': price,
      'color': color,
      'details': details,
      'productId': productId,
      'catogryId':catogryId
    };
  }
}
