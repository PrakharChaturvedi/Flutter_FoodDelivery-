// ignore_for_file: prefer_const_constructors
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/food/recommended_food.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class RouteHelper{
  static const String initial ="/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String dependencySize = "/dependency-size";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=> '$popularFood?pageId= $pageId';
  static String getRecommendedFood()=> '$recommendedFood';
  static String getDependencySize() => '$dependencySize';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> MainFoodPage()),

    GetPage(name: popularFood, page:() {
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(pageId!));
      // return PopularFoodDetails();
    }, transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page:(){
      return RecommendedFoodDetail();
    } , transition: Transition.fadeIn
    ),

    GetPage(name: dependencySize, page: (){
      return RecommendedFoodDetail();
    },
    ),
  ];
}