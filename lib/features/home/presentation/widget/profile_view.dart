import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/auth/presentation/manger/info_user_controller.dart';
import 'package:myegypt/features/auth/presentation/manger/pick_image_controller.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.controller,  }) : super(key: key);
  final PickImage controller;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall:widget.controller.isLoading ,
          child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: dimHeight(context) * 0.7,
                child: Image.file(widget.controller.image! , fit: BoxFit.fill,),
              ),
              const Spacer(),
              CustomButton(
                text: 'confirm',
                color: mainColor,
                onTap: () async {
                  setState(() {
                    widget.controller.isLoading = true;
                  });
                  await widget.controller.uploadImages();

                 setState(() {
                    widget.controller.isLoading = false;
                    Get.back();
                  }
                  );
                },
              ),
              const SizedBox(
                height: 4,
              ),
              CustomButton(
                text: 'cancel',
                color: Colors.black,
                onTap: () {
                  Get.back();
                },
              ),
              const Spacer()
            ],
          ),
      ),
    ),
        ));
  }
}
