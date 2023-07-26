import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:myegypt/features/auth/presentation/manger/Auth_view_model.dart';
import 'package:myegypt/features/auth/presentation/view/coplete_info_view.dart';

import '../../../auth/presentation/manger/pick_image_controller.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(

      init: AuthViewModel(),
      builder:(controller) {
        AuthViewModel().getProfileImg();
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
            child: controller.imgUrl == null ? Image.asset("assets/images/defrultProfile.png"
            , width: 80 , height: 80, ): Image.network(
             controller.imgUrl! ,fit: BoxFit.cover,
              width: 65,
              height: 65,
            ),
          ),
        ],
      );
      },
    );
  }
}
