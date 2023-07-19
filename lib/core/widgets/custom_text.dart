import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, this.color, this.size, this.fontWeight, this.align, this.hover,  })
      : super(key: key);
  final TextAlign? align ;
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final ValueChanged<bool>? hover ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: hover ,
      child: Text(

        text,
        textAlign: align,
        style: GoogleFonts.pangolin(

            color: color ?? Colors.black,
            fontSize: size ?? 14,
            fontWeight: fontWeight),
      ),
    );
  }
}
