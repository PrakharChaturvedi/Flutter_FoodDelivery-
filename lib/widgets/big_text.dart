import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  String? fontFamily;

  BigText({
    Key? key,
    this.color = Colors.cyan,
    required this.text,
    this.size = double.nan,
    this.overflow = TextOverflow.ellipsis,
    this.fontFamily,
  }) : super(key: key) {
    if (size.isNaN) {
      size = Dimensions.font20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
