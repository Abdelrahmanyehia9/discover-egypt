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
        child: Image.network(
          model.image,
          fit: BoxFit.fill,
          width: dimWidth(context) * 0.6,
          height: dimHeight(context) * 0.25,
        ),
      ),
    );
  }
}
