import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key,required this.text});

  @override

  State<ExpandableTextWidget> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/2.40;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: Colors.black54 ,size:Dimensions.font16 ,text: firstHalf):Column(
        children: [
          SmallText(height: 1.5,size: Dimensions.font16, color: Colors.black54,text: hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText?SmallText(text: "Show more", color: Colors.lightGreen):SmallText(text: "Show less", color: Colors.lightGreen),
                Icon(hiddenText?Icons.arrow_drop_down_rounded:Icons.arrow_drop_up_rounded, color: Colors.black87,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
