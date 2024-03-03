// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    print("page Id is:$pageId");
    print("product name is${product.name}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/foodImage02.jpg"),
                  ),
                ),
              )),
          //icon widget
          Positioned(
              top: Dimensions.width30,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap : (){
                        Get.to(()=> MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back)),
                  AppIcon(icon: Icons.shopping_bag_outlined)
                ],
              )),
          //Introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - Dimensions.height10,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Bowls"),
                    SizedBox(height: Dimensions.height10),
                    BigText(
                      text: "Introduce",
                      color: Colors.black87,
                    ),
                    SizedBox(height: Dimensions.height10),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text:
                                    "Chinese cuisine is renowned for its rich diversity, intricate flavors, and meticulous preparation techniques that have evolved over thousands of years. Characterized by a harmonious balance of taste, texture, and color, Chinese food encompasses a wide range of regional styles, from the spicy and bold flavors of Sichuan cuisine to the delicate and subtle tastes of Cantonese dishes. Staples like rice, noodles, and a myriad of vegetables are complemented by a variety of meats and seafood, often cooked with aromatic spices and seasonings. Dim sum, a popular culinary tradition, showcases an assortment of bite-sized delights, while Peking duck exemplifies the art of crispy and succulent roast duck. Chinese cuisine not only satisfies the palate but also reflects the country's rich cultural history and diverse culinary heritage."))),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          // color: Colors.cyan.withOpacity(0.45),
          color: Colors.cyan.withOpacity(0.65),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.black45),
                  SizedBox(width: Dimensions.width10),
                  BigText(
                    text: "0",
                    color: Colors.black,
                  ),
                  SizedBox(width: Dimensions.width10),
                  Icon(Icons.add, color: Colors.black45),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.green,
              ),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
