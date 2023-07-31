import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/book_personal.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/range_time.dart';
import '../../../constant.dart';
import '../../../core/widgets/custom_text.dart';
import '../data/model/hotel_model.dart';

void bookHotel({required VoidCallback onConfirm ,required HotelModel model , required GlobalKey<FormState> globalKey }) {


  Get.defaultDialog(
    onConfirm: onConfirm ,
      contentPadding: const EdgeInsets.only(left: 24 , right: 24 , bottom: 24),
      cancelTextColor: mainColor,
      confirmTextColor: Colors.white,
      buttonColor: mainColor,
      textCancel: "cancel",
      textConfirm: 'book',
      title: "Book Hotel" ,
      content: Column(children: [
         Text(model.name) ,
        const SizedBox(height: 8,) ,
        CachedNetworkImage(width: double.infinity, height: 150,fit: BoxFit.fill,
          imageUrl: model.imagePath , ),
        const SizedBox(height: 8,) ,
        const CustomText(text: "choose period") ,
        const SizedBox(height: 8,) ,
          RangeTimePicker(globalKey: globalKey,) ,
        const SizedBox(height: 16,),
        BookPersonHotel(text: 'Adults', num: BookHotelViewModel.adults) ,
        BookPersonHotel(text: 'Children', num: BookHotelViewModel.children) ,

      ],)
  );


}