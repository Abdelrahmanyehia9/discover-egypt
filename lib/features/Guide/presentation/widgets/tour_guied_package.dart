import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/model/tour_package.dart';
import '../ViewModel/booking_tour_guide.dart';

class TourGuidePackage extends StatefulWidget {
  const TourGuidePackage({Key? key, required this.packageModel, this.view})
      : super(key: key);
  final TourGuidePackageModel packageModel;
  final bool? view;

  @override
  State<TourGuidePackage> createState() => _TourGuidePackageState();
}

class _TourGuidePackageState extends State<TourGuidePackage> {
  bool isSelected = false;

 List<Widget> imagesOfPackages(){
   List<Widget> images = []  ;
   for(int i = 0 ; i < widget.packageModel.images.length ; i++ ){
     images.add(CachedNetworkImage(
         imageUrl : widget.packageModel.images[i] ,
         placeholder:(BuildContext context , String url ) => Center(child: CircularProgressIndicator())
   ) ,


     ) ;
   }
   return images ;
 }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingTourGuideController>(
      builder: (controller) => InkWell(
        onTap: (){
          Get.defaultDialog(
            title: widget.packageModel.tittle ,
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(children: [
                ImageSlideshow(
                    height: dimHeight(context) * .35,
                    indicatorBackgroundColor: Colors.white,
                    indicatorColor: mainColor,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: imagesOfPackages()
                ),
                SizedBox(height: 12,) ,
                CustomText(text: widget.packageModel.subTittle , size: 12,) ,
                SizedBox(height: 8,) ,
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CustomText(text: "Price:  " , fontWeight: FontWeight.bold, size: 12,),
                        CustomText(text: "${widget.packageModel.price}\$" , size: 10,),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(text: widget.packageModel.rating??"not rated" , size: 10,),
                        Icon(Icons.star , color: Colors.yellow.shade700, size: 18,) ,

                      ],
                    ),

                  ],
                )



              ],),
            )
          );
        },
        child: ListTile(
          horizontalTitleGap: 15,
          minVerticalPadding: 0,
          leading: CachedNetworkImage(
            imageUrl: widget.packageModel.images.first,
            fit: BoxFit.fill,
            width: 80,
            height: 100,
            placeholder: (context, url) => Image.asset(placeHolder),
          ),
          title: CustomText(
            text: widget.packageModel.tittle,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 30,
                  child: CustomText(
                    text: widget.packageModel.subTittle,
                    fontWeight: FontWeight.w100,
                  )),
              CustomText(
                text: "${widget.packageModel.price} \$",
                color: mainColor,
              )
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {

                controller.addToCart(widget.packageModel);

              });
            },
            icon: const CircleAvatar(
                backgroundColor: mainColor,
                child: Icon(Icons.add, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
