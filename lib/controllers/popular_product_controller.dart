import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isloaded => _isLoaded;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print("Got Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products as Iterable);
      _isLoaded = true;
      // print("List of popular products: $_popularProductList");
      update();
    } else {
      // Handle the error case
    }
  }
}
