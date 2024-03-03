import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page_body.daryt.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            margin: EdgeInsets.only(top: Dimensions.width25, bottom: Dimensions.height10),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "India",
                      color: Colors.teal,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Indore",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.iconSizeSearch,
                    height: Dimensions.iconSizeSearch,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal,
                    ),
                    child: const Icon(Icons.search_sharp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
