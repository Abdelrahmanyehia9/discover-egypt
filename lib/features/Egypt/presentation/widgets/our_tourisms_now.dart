import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import '../../data/model/tourists_model.dart';

class InEgyptNow extends StatelessWidget {
  const InEgyptNow({Key? key, required this.model}) : super(key: key);
final List<TouristsModel> model ;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: (model.length).ceil(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                placeholder:(context, url)=> Image.asset(placeHolder),
                imageUrl: model[index].image,
                width: dimWidth(context) * .22,
                fit: BoxFit.cover,
              )
            ),
          );
        });
  }
}
