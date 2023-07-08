import 'package:flutter/material.dart';
import 'package:myegypt/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Explore",
              size: 28,
              fontWeight: FontWeight.w900,
            ),
            CustomText(
              text: "Explore  My Egypt Beauty ",
              size: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            "https://cdn.arageek.com/magazine/2017/09/David-Beckham-1.jpg",
            width: 65,
            height: 65,
          ),
        ),
      ],
    );
  }
}
