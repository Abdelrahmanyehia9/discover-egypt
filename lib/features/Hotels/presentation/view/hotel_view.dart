import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Hotels/data/model/hotel_model.dart';
import 'package:myegypt/features/Hotels/presentation/book_hotel.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';

import '../../../../core/widgets/custom_text.dart';


class HotelView extends StatelessWidget {
  const HotelView({Key? key, required this.model}) : super(key: key);
final HotelModel model ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlideshow(
              height: dimHeight(context) * .3,
              indicatorBackgroundColor: Colors.white,
              indicatorColor: mainColor,
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                Image.network(model.imagePath , fit: BoxFit.fill,)
              ]
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,) ,
                Row(
                  children: [

                     CustomText(text: model.name ,fontWeight: FontWeight.bold, size: 28,),
                    const SizedBox(width: 8,) ,
                    SizedBox(
                      width: 100,
                      height: 18,
                      child: ListView.builder(
                          itemCount: model.rating,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                            size: 16,
                          )),
                    )

                  ],
                ),
                CustomText(text: model.location , size: 18, color: Colors.grey.shade600,) ,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: const [
                      HotelFeature(icon: Icons.wifi, text: 'Wifi') ,
                      HotelFeature(icon: Icons.ac_unit, text: 'AC') ,
                      HotelFeature(icon: Icons.access_time_filled_sharp, text: '24 Hours') ,
                      HotelFeature(icon: Icons.pool, text: 'Swimming') ,
                      HotelFeature(icon: Icons.bathtub, text: 'bath') ,
                      HotelFeature(icon: Icons.clean_hands_outlined, text: 'House Keeping') ,
                      HotelFeature(icon: Icons.local_parking, text: '') ,

                      HotelFeature(icon: Icons.fitness_center, text: "sports gym") ,
                      HotelFeature(icon: Icons.restaurant, text: 'restaurant') ,




                    ],
                  ),
                ) ,
                 Text(
                   model.overView ,
                style: TextStyle(fontSize: 14 , color: Colors.grey.shade600),),
                SizedBox(height: 24,),
                CustomButton(text: 'Book Now' , color: mainColor,
                  onTap: (){
                  bookHotel();
                  },
                )

              ],
            ),
          )
        ],
      ),
    ));
  }
}
class HotelFeature extends StatelessWidget {
  const HotelFeature({Key? key, required this.icon, required this.text}) : super(key: key);
final IconData icon ;
final String text ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: mainColor ,
      borderRadius: BorderRadius.circular(8) ,
      ),
      child: Wrap(
        children: [
          Icon(icon , size: 14, color: Colors.white,) ,
          const SizedBox(width: 4,) ,
          Text(text ,style: const TextStyle(color: Colors.white , fontSize: 12), )
        ],
      ),);

  }
}
