import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/widgets/custom_text.dart';

import '../../data/model/place_model.dart';
import '../viewmodel/places_view_model.dart';

class DiscoverALlEgypt extends StatelessWidget {
  const DiscoverALlEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlacesViewModel>(
      builder:(controller)=> Scaffold(
backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 16),
                child: CustomText(
                  text: "Discover Beautiful Places in Beautiful Country " , color: mainColor , size: 24,fontWeight: FontWeight.w900,),
              ) ,
              SizedBox(height: 10,)   ,
              Expanded(
                child: GridView.builder(
                    itemCount: controller.places.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 4),
                      child: Item(model: controller.places[index] , ),
                    ) ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
class Item extends StatelessWidget {
  const Item({Key? key, required this.model}) : super(key: key);
final PlaceModel model ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          height: dimHeight(context)*0.2,
          width: dimWidth(context)*0.5,
          decoration: BoxDecoration(

            border: Border.all(color: Colors.white)

          ),

             child:  Image.network(model.image , fit: BoxFit.fill,),


        ),
        Container(

          height: dimHeight(context)*0.2,
          width: dimWidth(context)*0.5,
          decoration: BoxDecoration(
          color: mainColor.withOpacity(0.5)
          ),



        ),
        Center(child: CustomText(text: model.name , color: Colors.white,fontWeight: FontWeight.w900, size: 18,))

      ],
    );
  }
}
