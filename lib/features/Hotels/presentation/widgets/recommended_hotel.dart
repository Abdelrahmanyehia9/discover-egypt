import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';

class RecommendedHotel extends StatelessWidget {
  const RecommendedHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(3, 2), // changes position of shadow
            ),
          ],
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 100,height: 100,
                child: Image.network("https://www.traveltomtom.net/images/nieuwe_indeling/artikels/egypt/fairmont_nile_city_review/fairmont_hotel_cairo.jpg",
                  fit: BoxFit.fill,),

              ),
              const SizedBox(width: 8,),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text:"Fairmont Nile City" , fontWeight: FontWeight.bold,
                    size: 16,),
                  const SizedBox(height: 3,),
                  const CustomText(text: "Corniche El Nile, Cairo " ,size: 12, ) ,
                  SizedBox( height: 12,width: dimWidth(context)*0.24,
                    child: ListView.builder(scrollDirection: Axis.horizontal,
                        itemCount: 5,
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
