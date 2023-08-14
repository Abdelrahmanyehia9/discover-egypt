import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details_view.dart';
import '../../../../core/utils/main_app_bar.dart';
import '../../data/model/place_model.dart';
import '../viewmodel/places_view_model.dart';

class DiscoverALlEgypt extends StatelessWidget {
  const DiscoverALlEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlacesViewModel>(
      builder: (controller) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: mainAppBar(view: false),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSlideshow(
                  height: dimHeight(context) * .35,
                  indicatorBackgroundColor: Colors.white,
                  indicatorColor: mainColor,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      'assets/images/trip2.jpg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/trip1.jpg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/trip4.jpg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/trip3.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/images/trip5.jpg',
                      fit: BoxFit.fill,
                    ),
                  ]),
              const Padding(
                padding: EdgeInsets.all(16),
                child: CustomText(
                  text: "Discover Beautiful Places in Beautiful Country ",
                  color: Colors.black,
                  size: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.places.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Item(
                            model: controller.places[index],
                          ),
                        )),
              ),
            ],
          )),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key? key, required this.model}) : super(key: key);
  final PlaceModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PlaceDetailsView(
              model: model,
            ));
      },
      child: Stack(
        children: [
          Container(
            height: dimHeight(context) * 0.2,
            width: dimWidth(context) * 0.5,
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: CachedNetworkImage(
              imageUrl: model.image,
              fit: BoxFit.fill,
              placeholder: (context, url) => Image.asset(placeHolder),
            ),
          ),
          Container(
            height: dimHeight(context) * 0.2,
            width: dimWidth(context) * 0.5,
            decoration: BoxDecoration(color: mainColor.withOpacity(0.5)),
          ),
          Center(
              child: CustomText(
            text: model.name,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            size: 18,
          ))
        ],
      ),
    );
  }
}
