import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details_view.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guid_details.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';
import 'package:myegypt/features/home/presentation/controller/favourite.dart';
import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../widget/component/guide_favourite.dart';
import '../widget/component/hotel_favourite.dart';
import '../widget/component/place_favourite.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      builder: (controller) => Scaffold(
          backgroundColor: mainColor,
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: dimHeight(context) * 0.042),
              const SizedBox(
                height: 12,
              ),
              TourGuideFavourite(model: controller.guideList),
              HotelFavourite(
                model: controller.hotelList,
              ),
              PlaceFavourite(model: controller.placesList),
              const SizedBox(
                height: 18,
              ),
            ]),
          )),
    );
  }
}
