import 'package:flutter/material.dart';
 import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/view_more_bar.dart';
import 'package:myegypt/features/Hotels/presentation/widgets/hotel_item.dart';
import '../widgets/recommended_hotel.dart';

class HotelView extends StatelessWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12.0),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 12,) ,
      const ViewMoreBar(text: "Popular Hotels") ,
      const SizedBox(height: 12,) ,
      SizedBox(
        height: dimHeight(context)*0.39,
        child: ListView.builder(
            itemCount: 16,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: HotelItem(),
          ) ;
        }),
      ),
      const SizedBox(height: 16,) ,
      const ViewMoreBar(text: "Recommended") ,
      const SizedBox(height: 16,) ,
      const RecommendedHotel()
    ],),
) ;
  }
}
