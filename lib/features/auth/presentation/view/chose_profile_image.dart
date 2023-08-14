import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';
import 'package:myegypt/features/home/presentation/view/toggle_pages.dart';
import '../manger/Auth_view_model.dart';
import '../manger/pick_image_controller.dart';

class ChoseProfilePic extends StatelessWidget {
  const ChoseProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: GetBuilder<PickImage>(
        init: PickImage(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "Upload your profile picture",
                size: 36,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomText(
                text:
                    'this data will be displayed in your  account  profile for security',
                size: 18,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                height: 18,
              ),
              controller.image == null
                  ? Column(
                      children: [
                        kPicContainer("assets/images/Gallery.png", () {
                          controller.uploadFromMyDevice(imgSource: ImageSource.gallery);
                        }),
                        kPicContainer("assets/images/Camera.png", () {
                          controller.uploadFromMyDevice(imgSource: ImageSource.camera);
                        }),
                      ],
                    )
                  : Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: SizedBox(
                            height: 200,
                            width: dimWidth(context) * 0.5,
                            child: Image.file(
                              controller.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.removeProfileImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: mainColor,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                text: controller.image == null ? 'skip' : "Next",
                color: mainColor,
                onTap: () async {
                  await controller.profileToFireStorage();
                  AuthViewModel().updateInfoSignUp();
                  Get.to(() =>  TogglePages(currentIndex: 1,));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget kPicContainer(String image, VoidCallback onTap) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            width: double.infinity,
            height: 100,
            child: SizedBox(width: 100, height: 100, child: Image.asset(image)),
          ),
        ),
      );
}
