// ignore_for_file: unused_field, unnecessary_this

import 'package:get/get.dart';

class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel>? get products => _products;

  Product({required totalSize, required typeId, required products, required offset}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(List<dynamic> json) {
    _products = json.map((productJson) => ProductModel.fromJson(productJson)).toList();
    }
  }


class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   print('ID: $id');
  //   name = json['name'];
  //   print('Name: $name');
  //   description = json['description'];
  //   print('Description: $description');
  //   price = json['price'];
  //   print('Price: $price');
  //   stars = json['stars'];
  //   print('Stars: $stars');
  //   img = json['img'];
  //   print('Image: $img');
  //   location = json['location'];
  //   print('Location: $location');
  //   createdAt = json['created_at'];
  //   print('Created At: $createdAt');
  //   updatedAt = json['updated_at'];
  //   print('Updated At: $updatedAt');
  //   typeId = json['typeId'];
  //   print('Type ID: $typeId');
  // }
  ProductModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> products = json['products'];
    print(products);
    id = products[0]['id'] ?? json['_id'] as int?;
    print(id);
    name = products[0]['name'];
    description = products[0]['description'];
    price = products[0]['price'] as int?;
    stars = products[0]['stars'] as int?;
    img = products[0]['img'];
    location = products[0]['location'];
    createdAt = products[0]['createdAt'];
    updatedAt = products[0]['updatedAt'];
    typeId = products[0]['typeId'] as int?;
  }
}