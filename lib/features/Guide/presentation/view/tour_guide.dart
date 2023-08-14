import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:myegypt/core/widgets/view_more_bar.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guid_details.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guide_loading.dart';
import '../../data/model/tour_guide_model.dart';
import '../widgets/tour_guide_item.dart';

class TourGuide extends StatelessWidget {
  const TourGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourGuideViewModel>(
      init: TourGuideViewModel(),
      builder: (controller) => controller.loading.value
          ? const TourGuideLoading()
      /// tour guides list
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all( 18.0),
                child: ViewMoreBar(text: "Popular Tour Guide" , onTap: (){
                  Get.to(()=>const AllTourGuide()) ;

                },),
              ) ,

              Expanded(
                child: ListView.builder(
                    itemCount: controller.listOfTour.length,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 4.0, bottom: 8),
                          child: InkWell(
                              onTap: () {
                                Get.to(
                                  () => TourGuideDetails(
                                    model: controller.listOfTour[index],
                                  ),
                                  transition: Transition.fade,
                                  duration: const Duration(milliseconds: 1500),
                                );
                              },
                              child: TourGuideItem(
                                model: controller.listOfTour[index],
                              )),
                        )),
              ),
            ],
          ),
    );
  }
}
class AllTourGuide extends StatelessWidget {
  const AllTourGuide({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourGuideViewModel>(
      init: TourGuideViewModel(),
      builder:(controller)=> Scaffold(
        appBar: AppBar(title: const Text("Tour Guides"),) ,
        body: controller.loading.value
            ? const TourGuideLoading()
        /// tour guides list
            :Column(
          children: [
           const SizedBox(height: 12,) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 18),
              child:  CustomText(color: Colors.grey.shade400,
                  text: "Always make sure to choose a tour guide to show you the best places to explore and guide you to the best places and explore the historical sights of these places"),
            ) ,
            Expanded(
              child: ListView.builder(
                itemCount:controller.listOfTour.length ,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: InkWell(
                      onTap: (){
                        Get.to(()=>TourGuideDetails(model: controller.listOfTour[index])) ;
                      },
                        child: TourGuideItem(model: controller.listOfTour[index])),
                  ) ),
            ),
          ],
        ),
      ),
    );
  }
}
