class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel>? _products;
  List<ProductModel>? get products => _products;

  Product({required totalSize, required typeId, required products, required offset}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size']; // Updated key
    _typeId = json['typeId']; // Updated key
    _offset = json['offset'];

    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products!.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stars;
  final String img;
  final String location;
  final String createdAt;
  final String updatedAt;
  final int typeId;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stars: json['stars'],
      img: json['img'],
      location: json['location'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      typeId: json['typeId'],
    );
  }
}