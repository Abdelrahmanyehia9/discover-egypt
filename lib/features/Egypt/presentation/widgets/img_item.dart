import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/data/model/place_model.dart';

class MyImageContainer extends StatelessWidget {
  const MyImageContainer({Key? key, required this.model}) : super(key: key);
final PlaceModel model ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: model.image,
          placeholder: (context ,url)=>Center(
            child: SizedBox(width: dimWidth(context)*.25,
                height: dimHeight(context)*.16,
                child: Image.asset("assets/images/plackholder.png")),
          ),
          fit: BoxFit.fill,
          width: dimWidth(context) * 0.6,
          height: dimHeight(context) * 0.25,
        ),
      ),
    );
  }
}
