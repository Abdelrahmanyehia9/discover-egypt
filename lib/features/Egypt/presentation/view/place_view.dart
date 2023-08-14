import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/presentation/view/discover_all_egypt.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details_view.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/tourists_view_model.dart';
import '../../../../core/widgets/view_more_bar.dart';
import '../widgets/img_item.dart';
import '../widgets/our_tourisms_now.dart';
import 'loading_view.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GetBuilder<PlacesViewModel>(
          autoRemove: false,
          init: PlacesViewModel(),
          builder: (controller) => controller.loading.value
              ? const PlacesViewLoading()
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => const DiscoverALlEgypt());
                      },
                      child: ViewMoreBar(
                          text: "${controller.places.length} Places")),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: dimHeight(context) * 0.37,
                    child: ListView.builder(
                      itemCount: (controller.places.length / 2).ceil(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(
                                () => PlaceDetailsView(
                                    model: controller.places[index]),
                                transition: Transition.fade,
                                duration: const Duration(milliseconds: 800));
                          },
                          child: MyImageContainer(
                              model: controller.places[index])),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0, top: 8),
                    child: ViewMoreBar(
                      text: "Recently Tourists",
                      weight: FontWeight.w500,
                      size: 16,
                      view: false,
                    ),
                  ),
                  GetBuilder<TouristsViewModel>(
                    init: TouristsViewModel(),
                    builder: (controller) => SizedBox(
                      height: dimHeight(context) * .15,
                      width: dimWidth(context),
                      child: InEgyptNow(
                        model: controller.tourists,
                      ),
                    ),
                  ),
                ]),
        ),
      ),
    );
  }
}
