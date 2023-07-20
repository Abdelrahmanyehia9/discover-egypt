import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:myegypt/features/Hotels/presentation/view/hotel_view.dart';

import '../../data/model/hotel_model.dart';

class RecommendedHotel extends StatelessWidget {
  const RecommendedHotel({Key? key, required this.model}) : super(key: key);
final HotelModel model ;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Get.to(()=>HotelView(model: model));
    },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(3, 2), // changes position of shadow
              ),
            ],
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 100,height: 100,
                  child: CachedNetworkImage(
                    placeholder: (context , url )=>Image.asset(placeHolder),
                    imageUrl: model.imagePath ,
                    fit: BoxFit.fill,),

                ),
                const SizedBox(width: 8,),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomText(text:model.name , fontWeight: FontWeight.bold,
                      size: 16,),
                    const SizedBox(height: 3,),
                     CustomText(text: model.location ,size: 12, ) ,
                    SizedBox( height: 12,width: dimWidth(context)*0.24,
                      child: ListView.builder(scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index) =>  Icon(Icons.star , color: Colors.yellow.shade600,size: 16,)),
                    )
                  ],
                ),
              ],) ,
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.arrow_forward_rounded),
            ) ,
          ],
        ),
      ),
    );
  }
}
