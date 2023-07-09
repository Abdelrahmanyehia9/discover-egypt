import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, this.color, this.size, this.fontWeight, this.align})
      : super(key: key);
  final TextAlign? align ;
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      textAlign: align,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? 14,
          fontWeight: fontWeight),
    );
  }
}
