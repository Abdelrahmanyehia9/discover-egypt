import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import '../view/profile_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.imgPath}) : super(key: key);
  final String? imgPath;

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
        InkWell(
          onTap: () {
            Get.to(() => const ProfileViewBody());
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: imgPath == null
                ? Image.asset(
                    "assets/images/defrultProfile.png",
                    width: 80,
                    height: 80,
                  )
                : CachedNetworkImage(
                    imageUrl: imgPath!,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                    placeholder: (context, url) => Image.asset(placeHolder),
                  ),
          ),
        ),
      ],
    );
  }
}
