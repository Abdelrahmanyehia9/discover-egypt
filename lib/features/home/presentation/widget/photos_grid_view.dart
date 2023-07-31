import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';

class PhotoGelleryProfile extends StatelessWidget {
  PhotoGelleryProfile({Key? key}) : super(key: key);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: 'upload',
                        titlePadding: const EdgeInsets.only(top: 12),
                        titleStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                        backgroundColor: Colors.grey,
                        content: Column(
                          children: [
                            kPicContainer(image: "assets/images/Camera.png"),
                            kPicContainer(image: "assets/images/Gallery.png")
                          ],
                        ));
                  },
                  child: Container(
                      width: dimWidth(context) * 0.1,
                      height: 50,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomText(
                  text: "click here to add your first photo",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                CustomText(
                  text:
                      "Egypt is a country of charm and beauty.\n Souvenir photos should be taken and kept here",
                  align: TextAlign.center,
                  size: 14,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          )
        : GridView.builder(
            itemCount: count,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/images/trip1.jpg',
                    fit: BoxFit.fill,
                  ),
                ));
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
}
