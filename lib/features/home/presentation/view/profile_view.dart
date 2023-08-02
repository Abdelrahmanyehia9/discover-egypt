import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myegypt/features/auth/presentation/view/login_view.dart';
import 'package:myegypt/features/home/data/local_shared_prefrences.dart';
import 'package:myegypt/features/home/presentation/view/toggle_pages.dart';

import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../auth/presentation/manger/info_user_controller.dart';
import '../../../auth/presentation/manger/pick_image_controller.dart';
import '../widget/photos_grid_view.dart';
import '../widget/profile_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(
      init: UserInfoController(),
      builder: (controller) => controller.userModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(controller.userModel!.userName!,
                      style: const TextStyle(color: Colors.black)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: mainColor),
                  actions: [
                    PopupMenuButton(
                      position: PopupMenuPosition.under,
                      itemBuilder: (BuildContext bc) {
                        return [
                          PopupMenuItem(
                            onTap: () async {
                              setValue(false);
                              await FirebaseAuth.instance.signOut();
                              Get.off(() => LoginView());
                            },
                            child: const Text("Logout"),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              Future.delayed(Duration.zero, () {
                                addNewPhoto(PickImage());
                              });
                            },
                            child: const Text("Add new Photo"),
                          ),
                        ];
                      },
                    )
                  ],
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.userModel!.imagePath == null
                          ? const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(
                                "assets/images/defrultProfile.png",
                              ),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage: CachedNetworkImageProvider(
                                  controller.userModel!.imagePath!),
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: controller.userModel!.userName,
                        fontWeight: FontWeight.bold,
                        size: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "Date of Registration : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          CustomText(
                            text: controller.userModel!.dateOfReges
                                .substring(0, 10),
                            size: 10,
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "IamFrom : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(Country.tryParse(controller.userModel!.country!)!
                              .flagEmoji),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            Country.tryParse(controller.userModel!.country!)!
                                .name,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 10),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          addNewPhoto(PickImage());
                        },
                        child: const SizedBox(
                          height: 24,
                        ),
                      ),
                      ButtonsTabBar(
                        labelStyle: const TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: dimWidth(context) * 0.148),
                        radius: 0,
                        tabs: const [
                          Tab(
                              icon: Icon(Icons.photo_outlined),
                              text: "photo"),
                          Tab(
                              icon: Icon(Icons.photo_album_outlined),
                              text: "album"),
                        ],
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Expanded(
                        child: TabBarView(children: [

                             PhotoGelleryProfile(

                              images: controller.imageList),

                          const Center(
                            child: Text('album'),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget kPicContainer({required String image, VoidCallback? onTap}) => Padding(
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

  void addNewPhoto(PickImage controller) {
    Get.defaultDialog(
        title: 'upload',
        titlePadding: const EdgeInsets.only(top: 12),
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        backgroundColor: Colors.grey,
        content: Column(
          children: [
            InkWell(
                onTap: () async{
                  await controller.uploadFromMyDevice(
                      imgSource: ImageSource.camera,
                      );

                  Get.off(()=>ProfileView(controller: controller ,));

                },
                child: kPicContainer(image: "assets/images/Camera.png")),
            kPicContainer(image: "assets/images/Gallery.png")
          ],
        ));
  }
}
