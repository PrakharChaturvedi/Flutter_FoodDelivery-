import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = []; // Change to List<ProductModel>
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isloaded => _isLoaded;

  Future<void> getPopularProductList() async {
    print("Fetching data from server...");
    Response response = await popularProductRepo.getPopularProductList();
    print("Data fetched from server: ${response.body}");

    if (response.statusCode == 200) {
      // Parse response body to List<dynamic>
      List<dynamic> responseBody = response.body;

      // Convert List<dynamic> to List<ProductModel>
      List<ProductModel> products = responseBody
          .map((item) => ProductModel.fromJson(item))
          .toList();

      // Print received data to console
      print("List of popular products: $products");

      // Store received data
      _popularProductList = products;

      _isLoaded = true;
      update(); // Notify listeners of changes
    } else {
      print("Error fetching data from server: ${response.statusCode}");
      // Handle the error case
    }
  }
}
