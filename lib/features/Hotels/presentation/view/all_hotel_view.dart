import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/widgets/custom_text_field.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guide_loading.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/hotel_view_model.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';

import '../../../../constant.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../widgets/all_hotel_view_body.dart';

class AllHotelView extends StatelessWidget {
  const AllHotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllHotelViewBody(),
    );
  }
}




