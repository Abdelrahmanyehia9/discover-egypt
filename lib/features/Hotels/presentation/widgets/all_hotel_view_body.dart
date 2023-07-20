import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myegypt/features/Hotels/presentation/view/hotel_view.dart';
import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../Guide/presentation/view/tour_guide_loading.dart';
import '../viewModel/hotel_view_model.dart';
import 'hotel_item_list.dart';

class AllHotelViewBody extends StatelessWidget {
  const AllHotelViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelViewModel>(
        builder: (controller) => controller.loading.value
            ? const TourGuideLoading()
            : Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageSlideshow(
                height: dimHeight(context) * .35,
                indicatorBackgroundColor: Colors.white,
                indicatorColor: mainColor,
                autoPlayInterval: 3000,
                isLoop: true,
                children: controller.hotelImage),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, right: 16, left: 16),
              child: CustomText(
                text: "Discover Popular Hotels in Egypt ",
                color: Colors.black,
                size: 18,
                fontWeight: FontWeight.w900,
              ),
            ),

            Expanded(
             child: ListView.builder(

                  itemCount: controller.hotelList.length,
                  itemBuilder: (context , index)=> InkWell(onTap: (){
                    Get.to(()=>HotelView(model: controller.hotelList[index])) ;
                  },
                      child: HotelItemList(model: controller.hotelList[index],))),
             )
          ],
        ));
  }
}
