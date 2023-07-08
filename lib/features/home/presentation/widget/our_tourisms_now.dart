import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';

class InEgyptNow extends StatelessWidget {
  const InEgyptNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://dreamfiancee.com/wp-content/uploads/2023/04/russian-mail-order-bride.jpg",
                width: dimWidth(context) * .3,
              ),
            ),
          );
        });
  }
}
