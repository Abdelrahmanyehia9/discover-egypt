import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../view/tour_guid_details.dart';

class TourGuideItem extends StatelessWidget {
  const TourGuideItem({Key? key, required this.model}) : super(key: key);
final TourGuideModel  model ;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                children:  [
                  CircleAvatar(radius: 50,
                    backgroundImage: NetworkImage(model.imagePath),

                  ),
                   Positioned(right: 15,
                      child: CircleAvatar(radius: 10,backgroundColor: Colors.white,
                          child: CircleAvatar(radius: 8, backgroundColor: model.isAvailable? Colors.green :Colors.red.shade700,)))
                ],
              ),
              const SizedBox(width: 8,),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomText(text:model.name , fontWeight: FontWeight.bold,
                    size: 16,),
                  const SizedBox(height: 3,),
                   CustomText(text: model.location ,size: 12,color: Colors.grey, ) ,
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
    );
  }
}
