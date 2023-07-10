import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';

import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';

class ProfilePicOfGuide extends StatelessWidget {
  const ProfilePicOfGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: dimWidth(context) * .36,
          height: dimHeight(context) * 0.25,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: dimHeight(context) * 0.22,
            width: dimWidth(context) * 0.35,
            child: Image.network(
              "https://www.turkishdrama.com/wp-content/uploads/2013/11/burak-ozcivit-actor-16.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: dimHeight(context) * 0.004,
          left: dimWidth(context) * 0.06,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 4,),
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(16)),
            width: dimWidth(context) * 0.24,
            height: dimHeight(context) * 0.04,
            child: const CustomText(
              text: "Mohamed",
              size: 10,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
