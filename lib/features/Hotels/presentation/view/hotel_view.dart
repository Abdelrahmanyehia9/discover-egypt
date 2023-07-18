import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/view_more_bar.dart';
import 'package:myegypt/features/Egypt/presentation/view/loading_view.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/hotel_view_model.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/hotel_item.dart';
import '../widgets/recommended_hotel.dart';

class HotelView extends StatelessWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12.0),
  child:   GetBuilder<HotelViewModel>(
    init:  HotelViewModel(),
    builder:(controller) => controller.loading.value ? const PlacesViewLoading() :Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12,) ,
        const ViewMoreBar(text: "Popular Hotels") ,
        const SizedBox(height: 12,) ,
        SizedBox(
          height: dimHeight(context)*0.39,
          child: ListView.builder(
              itemCount: controller.hotelList.length,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: HotelItem(model: controller.hotelList[index]),
            ) ;
          }),
        ),
        const SizedBox(height: 16,) ,
        const ViewMoreBar(text: "Recommended") ,
        const SizedBox(height: 16,) ,
         RecommendedHotel(model: controller.hotelList[1],)
      ],),
  ),
) ;
  }
}
