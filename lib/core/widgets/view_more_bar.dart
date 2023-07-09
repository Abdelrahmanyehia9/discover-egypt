import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';

import 'custom_text.dart';

class ViewMoreBar extends StatelessWidget {
  const ViewMoreBar({Key? key, required this.text, this.size, this.weight}) : super(key: key);
  final String text  ;
  final double? size ;
  final FontWeight? weight ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         CustomText(
          text: text,
          size: size ?? 18,
          fontWeight: weight?? FontWeight.w800 ,
        ),
        CustomText(
          fontWeight: FontWeight.w300,
          size: 18,
          text: "view all",
          color: mainColor,
        ),

      ],

    )  ;

  }
}
