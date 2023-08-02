import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myegypt/features/auth/presentation/manger/info_user_controller.dart';
import 'package:myegypt/features/auth/presentation/manger/pick_image_controller.dart';
import 'package:myegypt/features/home/presentation/widget/profile_view.dart';

import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../auth/data/model/images_model.dart';

class PhotoGelleryProfile extends StatelessWidget {
 const PhotoGelleryProfile({Key? key, required this.images,}) : super(key: key);
  final List<ImagesModel> images ;

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? GetBuilder<PickImage>(
      init: PickImage(),
          builder:(controller)=> Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                      addNewPhoto(controller ) ;
                    },
                    child: Container(
                        width: dimWidth(context) * 0.1,
                        height: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
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
            ),
        )

        :   GridView.builder(

              itemCount: images.length ,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.network(
                    images[index].images,
                      fit: BoxFit.fill,
                    ),
                  )) ;
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
  void addNewPhoto(PickImage controller){


    Get.defaultDialog(
        title: 'upload',
        titlePadding: const EdgeInsets.only(top: 12),
        titleStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w900),
        backgroundColor: Colors.grey,
        content: Column(
          children: [
            InkWell(
                onTap:()async{

                 await controller.uploadFromMyDevice(imgSource: ImageSource.camera)  ;
                  Get.off(()=>ProfileView(controller: controller, ));


                } ,
                child: kPicContainer(image: "assets/images/Camera.png")),
            kPicContainer(image: "assets/images/Gallery.png")
          ],
        ));

  }
}
