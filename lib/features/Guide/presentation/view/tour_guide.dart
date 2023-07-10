import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guid_details.dart';


class TourGuide extends StatelessWidget {
  const TourGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 8,
        clipBehavior: Clip.none,
        itemBuilder: (context , index)=> const Padding(
      padding: EdgeInsets.only(left: 4.0 , bottom: 8),
      child: TourGuideItem(),
    ));
  }
}

class TourGuideItem extends StatelessWidget {
  const TourGuideItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Get.to(()=>const TourGuideDetails() , transition: Transition.fade , duration: const Duration(milliseconds: 1500) , ) ;
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 0.002,
                blurRadius: 9,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(radius: 56,
                      backgroundImage: NetworkImage("https://www.turkishdrama.com/wp-content/uploads/2013/11/burak-ozcivit-actor-16.jpg",
                     ),

                    ),
                    Positioned(right: 15,
                        child: CircleAvatar(radius: 10,backgroundColor: Colors.white,
                            child: CircleAvatar(radius: 8, backgroundColor: Colors.green,)))
                  ],
                ),
                const SizedBox(width: 8,),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text:"Mohamed Ali" , fontWeight: FontWeight.bold,
                      size: 16,),
                    const SizedBox(height: 3,),
                     const CustomText(text: "Dokki, Cairo " ,size: 12,color: Colors.grey, ) ,
                     SizedBox( height: 12,width: dimWidth(context)*0.24,
                      child: ListView.builder(scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context , index) =>  Icon(Icons.star , color: Colors.yellow.shade600,size: 16,)),
                    )
                  ],
                ),
              ],) ,
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.arrow_forward_rounded),
            ) ,
          ],
        ),
      ),
    );
  }
}
