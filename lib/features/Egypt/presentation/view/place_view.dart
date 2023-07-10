import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';
import '../../../../core/widgets/view_more_bar.dart';
import '../widgets/img_item.dart';
import '../widgets/our_tourisms_now.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GetBuilder<PlacesViewModel>(
        init: PlacesViewModel(),
        builder:(controller)=> controller.loading.value==true ? Center(child: CircularProgressIndicator(color: mainColor,)) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 12,
          ),
           ViewMoreBar(text: "${controller.places.length} Places") ,
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: dimHeight(context) * 0.37,
            child: ListView.builder(
              itemCount: (controller.places.length/2).ceil() ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  MyImageContainer(model: controller.places[index]),
            ),
          ),
           const SizedBox(height: 12,),
           const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 8),
            child:  ViewMoreBar(text: "Recently Tourists" , weight: FontWeight.w500,size: 16,) ,

           ),
          SizedBox(
            height: dimHeight(context) * .15,
            width: dimWidth(context),
            child:  InEgyptNow(model: controller.tourists,),
          ),
        ]),
      ),
    );
  }
}
