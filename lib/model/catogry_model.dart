class CategoryModel {
  String id,name, image;

  CategoryModel({ this.name,  this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    id = map['id'];
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
  
}
