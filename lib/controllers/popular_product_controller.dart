import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print("Data fetched from server: ${response.body}");
    if (response.statusCode == 200) {
      _popularProductList=[];
      print("Got products....!");
      // _popularProductList.addAll(Product.fromJson(response.body).products);
      _popularProductList.addAll(Product.fromJson(response.body).products as Iterable<ProductModel>);
      // _popularProductList.addAll(response.body);
      update();
      print("The product list in App : $_popularProductList");
    } else {
      print("Error fetching data from server: ${response.statusCode}");
    }
  }
}