// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, color: Colors.black, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(children: List.generate(5,(index) => Icon(Icons.star,color: Colors.amber, size: 15))),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "4.5/5", color: Colors.black54),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "1287", color: Colors.black54),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "comments", color: Colors.black54),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
    );
  }
}
