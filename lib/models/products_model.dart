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

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['typeId'];
  }
}