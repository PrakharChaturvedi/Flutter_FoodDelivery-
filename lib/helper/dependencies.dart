import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  //Api Client
  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com/"));
  //https://mvs.bslmeiyu.com/, https://www.dbestech.com


  //Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}