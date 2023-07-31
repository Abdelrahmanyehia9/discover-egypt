import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guide_details_body.dart';

class TourGuideDetails extends StatelessWidget {
  const TourGuideDetails({
    Key? key,
    required this.mode,
  }) : super(key: key);
  final TourGuideModel mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          Icon(
            Icons.favorite_outline_outlined,
            color: Colors.grey.shade800,
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
      body: TourGuideDetailsBody(model: mode),
    );
  }
}
