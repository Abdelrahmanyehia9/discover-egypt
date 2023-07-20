import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/book_personal.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/range_time.dart';

import '../../../constant.dart';
import '../../../core/widgets/custom_text.dart';

void bookHotel(){


  Get.defaultDialog(
      contentPadding: const EdgeInsets.only(left: 24 , right: 24 , bottom: 24),
      cancelTextColor: mainColor,
      confirmTextColor: Colors.white,
      buttonColor: mainColor,
      textCancel: "cancel",
      textConfirm: 'book',
      title: "Book Hotel" ,
      content: Column(children: [
        const Text("Hotel Name") ,
        const SizedBox(height: 8,) ,
        Image.network("https://static.leonardo-hotels.com/image/leonardohotelbucharestcitycenter_room_comfortdouble2_2022_4000x2600_7e18f254bc75491965d36cc312e8111f_1200x780_mobile_3.jpeg"),
        const SizedBox(height: 8,) ,
        const CustomText(text: "choose period") ,
        const SizedBox(height: 8,) ,
        const RangeTimePicker() ,
        SizedBox(height: 16,),
        BookPersonHotel(text: 'Adults', num: 0,) ,
        BookPersonHotel(text: 'Children', num: 0,) ,

      ],)
  );


}