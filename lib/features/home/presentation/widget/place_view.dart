import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import '../../../../core/utils/dim.dart';
import 'img_item.dart';
import 'our_tourisms_now.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: "45 Places",
              size: 18,
              fontWeight: FontWeight.w900,
            ),
            SizedBox(
                child: Row(
              children: [
                CustomText(
                  text: "see more",
                  color: mainColor,
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.list_alt_sharp,
                  size: 12,
                  color: mainColor,
                ),
              ],
            )),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          height: dimHeight(context) * 0.37,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const MyImageContainer(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0, top: 8),
          child: CustomText(
            text: "Recently Tourists",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: dimHeight(context) * .15,
          child: const InEgyptNow(),
        ),
      ]),
    );
  }
}
