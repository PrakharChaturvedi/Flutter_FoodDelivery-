import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                },
                    child: AppIcon(icon: Icons.clear)
                ),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                    text: "Chinese Bowl",
                    color: Colors.black,
                    size: Dimensions.font26,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                      )),
                )),
            pinned: true,
            backgroundColor: Colors.cyan,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/foodImage01.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: """Chinese cuisine, with its deep roots in tradition and regional variations, places a strong emphasis on the balance of yin and yang, the harmony of contrasting elements in food. This philosophy extends beyond flavors to encompass the importance of incorporating a variety of ingredients for nutritional balance. The use of fresh, seasonal produce and a wide array of cooking methods, such as stir-frying, steaming, and braising, contributes to the overall healthfulness of Chinese dishes. Additionally, the symbolic significance of certain foods, like longevity noodles and dumplings during celebrations, adds a cultural layer to the dining experience.
                Each region in China boasts its own distinct culinary identity. For instance, the fiery and numbing dishes of Sichuan province reflect a love for bold, spicy flavors, while the refined and diverse dim sum offerings of Cantonese cuisine showcase meticulous craftsmanship. In the north, wheat-based dishes like hand-pulled noodles and dumplings are prevalent, while the south favors rice-based dishes and a greater emphasis on seafood. This regional diversity reflects the vast landscapes and cultural influences that shape China's gastronomic landscape.
            Moreover, the art of tea is intricately woven into the fabric of Chinese dining culture. Tea is not just a beverage but a complementary element that enhances the overall dining experience. Whether it's the soothing notes of green tea or the robust flavors of oolong, the pairing of tea with various dishes is a practiced art that further enriches the sensory journey of Chinese cuisine.
                In recent times, Chinese food has transcended national borders, becoming a global culinary phenomenon. Chinese restaurants around the world offer a taste of the country's culinary delights, adapting to local preferences while retaining the essence of traditional flavors. As a result, Chinese cuisine continues to captivate food enthusiasts worldwide, fostering an appreciation for its depth, complexity, and cultural significance."""),
                    margin : EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.height20)
                ),
              ],
            )
          ),
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: Colors.cyan,
                  icon: Icons.remove),

                BigText(text: "\$12.88 "+" X "+" 0",color: Colors.black,size: Dimensions.font26,),

                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: Colors.cyan,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      left: Dimensions.width25,
                      right: Dimensions.width25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.cyan,
                    size: Dimensions.iconSize24,
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
        ],
      ),
    );
  }
}
