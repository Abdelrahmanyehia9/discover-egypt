import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';

class MyImageContainer extends StatelessWidget {
  const MyImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          "https://www.weseektravel.com/wp-content/uploads/2022/05/landmarks-in-egypt-1-2.jpg",
          fit: BoxFit.fill,
          width: dimWidth(context) * 0.6,
          height: dimHeight(context) * 0.25,
        ),
      ),
    );
  }
}
