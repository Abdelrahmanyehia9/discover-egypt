import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';
import '../../../../core/widgets/view_more_bar.dart';
import '../widgets/img_item.dart';
import '../widgets/our_tourisms_now.dart';

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
        const ViewMoreBar(text: "45 Places") ,
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
         const SizedBox(height: 12,),
         const Padding(
          padding: EdgeInsets.only(bottom: 16.0, top: 8),
          child:  ViewMoreBar(text: "Recently Tourists" , weight: FontWeight.w500,size: 16,) ,

         ),
        SizedBox(
          height: dimHeight(context) * .12,
          width: dimWidth(context),
          child: const InEgyptNow(),
        ),
      ]),
    );
  }
}
