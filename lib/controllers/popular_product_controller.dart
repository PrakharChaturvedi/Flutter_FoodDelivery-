import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    print("Fetching data from server...");
    Response response = await popularProductRepo.getPopularProductList();
    print("Data fetched from server: ${response.body}");

    if (response.statusCode == 200) {
      List<dynamic> responseBody = response.body;
      List<ProductModel> products = responseBody.map((item) => ProductModel.fromJson(item)).toList();

      _popularProductList = products;
      _isLoaded = true;
      update();
    } else {
      print("Error fetching data from server: ${response.statusCode}");
    }
  }
}