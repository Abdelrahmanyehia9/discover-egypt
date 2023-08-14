import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import '../../../../../core/utils/dim.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, required this.text , this.onTap , this.color}) : super(key: key);
  final String text;
  VoidCallback? onTap ;
  Color? color  ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: color == null ? Border.all(color: mainColor , width: 2): null,
          color: color ?? Colors.white  ,
          borderRadius: BorderRadius.circular(16),
        ),
        width: dimWidth(context),
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:  TextStyle(fontWeight: FontWeight.w900 , color: color== null ?mainColor : Colors.white),
        ),
      ),
    );
  }
}
