import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';

import '../../data/model/hotel_model.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({Key? key, required this.model}) : super(key: key);
final HotelModel model ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(16), color: Colors.white),
      width: dimWidth(context) * 0.6,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
                width: dimWidth(context) * 0.55,
                height: dimHeight(context) * 0.265,
                child: CachedNetworkImage(
                  placeholder: (context , url)=>Image.asset(placeHolder),
                  imageUrl: model.imagePath ,
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomText(
                    text: model.name,
                    fontWeight: FontWeight.w400,
                    size: 16,
                  ),
                  CustomText(
                    text: model.location,
                    fontWeight: FontWeight.normal,
                    size: 12,
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor, borderRadius: BorderRadius.circular(4)),
                  width: 30,
                  height: 30,
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
