import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myegypt/features/auth/presentation/manger/info_user_controller.dart';
import 'custom_app_bar.dart';
import 'my_tab_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<UserInfoController>(
        init: UserInfoController(),
        builder: (controller) {
          return controller.userModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomAppBar(
                      imgPath: controller.userModel!.imagePath,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Expanded(child: MyButtonTabBar()),
                  ],
                );
        },
      ),
    );
  }
}
