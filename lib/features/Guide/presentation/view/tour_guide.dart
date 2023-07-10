import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guid_details.dart';
import '../widgets/tour_guide_item.dart';


class TourGuide extends StatelessWidget {
  const TourGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourGuideViewModel>(
      init: TourGuideViewModel() ,
      builder:(controller)=> ListView.builder(itemCount: controller.listOfTour.length,
          clipBehavior: Clip.none,
          itemBuilder: (context , index)=>  Padding(
        padding: const EdgeInsets.only(left: 4.0 , bottom: 8),
        child: InkWell(onTap: (){


            Get.to(()=> TourGuideDetails(
              mode: controller.listOfTour[index],) , transition: Transition.fade , duration: const Duration(milliseconds: 1500) , ) ;

        },
            child: TourGuideItem(model: controller.listOfTour[index],)),
      )),
    );
  }
}

