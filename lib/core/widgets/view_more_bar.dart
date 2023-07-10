import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';

import 'custom_text.dart';

class ViewMoreBar extends StatelessWidget {
  const ViewMoreBar({Key? key,this.onTap ,  required this.text, this.size, this.weight}) : super(key: key);
  final String text  ;
  final double? size ;
  final FontWeight? weight ;
  final VoidCallback? onTap  ;
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
        InkWell(onTap: onTap ,
          child: CustomText(
            fontWeight: FontWeight.w300,
            size: 18,
            text: "view all",
            color: mainColor,
          ),
        ),

      ],

    )  ;

  }
}
