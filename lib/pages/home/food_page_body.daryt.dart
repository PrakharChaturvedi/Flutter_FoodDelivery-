// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'dart:math' as Math;
// ... (imports)

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        children: [
          //Slider section
          GetBuilder<PopularProductController>(builder:(popularProducts){
            return Container(
              height: Dimensions.pageView,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                // popularProducts.popularProductList.length
                itemBuilder: (context, position) {
                  // setState(() {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => a)
                  // });
                  return _buildPageItem(position);
                },
              ),
            );
          }),

          //Dot indicator

          GetBuilder<PopularProductController>(builder:(popularProducts){
            return DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue.toInt(),
              decorator: DotsDecorator(
                activeColor: Colors.teal,
                size: Size.square(9.0),
                activeSize: Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          }),

          //Popular Text
          Container(
            margin: EdgeInsets.only(left: Dimensions.width25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(
                  text: "Popular",
                  color: Colors.black,
                ),
                SizedBox(width: Dimensions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                ),
                SizedBox(width: Dimensions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: SmallText(
                    text: "Food pairing",
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          //list of food and images
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //Image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image/foodImage02.jpg"),
                          ),
                        ),
                      ),
                      //Text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white54,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text: "Nutritious fruit meal in China",
                                    color: Colors.black),
                                SizedBox(height: Dimensions.height10),
                                SmallText(text: "With chinese characteristics"),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:[
                                    IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: Colors.deepOrangeAccent,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: Colors.lightGreen,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32 mins",
                                      iconColor: Colors.teal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ) ,
    );
  }

  //Animations and top food recommendations
  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    double scaleFactor;
    double translation;
    double applyCircularEasing(double value) {
      return 0.5 * (1 - Math.cos(value * Math.pi));
    }

    if (index == _currentPageValue.floor()) {
      double t = (_currentPageValue - index);
      scaleFactor = 1 - t * (1 - _scaleFactor);
      translation = _height * (1 - scaleFactor);
      scaleFactor = applyCircularEasing(scaleFactor);
    } else if (index == _currentPageValue.floor() + 1) {
      double t = (_currentPageValue - index + 1);
      scaleFactor = _scaleFactor + t * (1 - _scaleFactor);
      translation = _height * (1 - scaleFactor);
      scaleFactor = applyCircularEasing(scaleFactor);
    } else if (index == _currentPageValue.floor() - 1) {
      scaleFactor = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      translation = _height * (1 - scaleFactor);
    } else {
      scaleFactor = 0.8;
      translation = _height * (1 - _scaleFactor);
    }

    matrix = Matrix4.diagonal3Values(1, scaleFactor, 1)..setTranslationRaw(0, translation, 0);

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/foodImage04.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width25,
                  right: Dimensions.width25,
                  bottom: Dimensions.width30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: CupertinoColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 5.0,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: AppColumn(text: "Chinese Bowls"),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
