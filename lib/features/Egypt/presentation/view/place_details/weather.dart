import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Egypt/presentation/viewmodel/places_view_model.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../data/model/place_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key, required this.model}) : super(key: key);
  final PlaceModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (DateTime.now().hour + 1) < 18
          ? Colors.cyan.shade700
          : const Color(0xff00003b),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 18,
            ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Row(
                 children: [
                   CustomText(
                     text: "${model.name}\t",
                     color: Colors.white,
                     size: 36,
                   ),
                   const SizedBox(
                     width: 4,
                   ),
                   const Icon(
                     Icons.location_on,
                     color: Colors.white,
                   )
                 ],
               ),
               Row(
                 children:  [
                   CustomText(
                     text: "${model.temp}°",
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     size: 72,
                   ),
                   CustomText(
                     text: model.weather ?? "",
                     color: Colors.white,
                     size: 36,
                   ),
                 ],
               ),
             ],),
             Container(
               padding: EdgeInsets.all(2),
               decoration: BoxDecoration(border: Border.all(color: Colors.white , width: 4)),
               child: Container(
                 height: dimHeight(context)*0.14, width: dimWidth(context)*0.25,
                   decoration: BoxDecoration(border: Border.all(color: Colors.white , width: 2 )),
                   child: Image.network(model.image , fit: BoxFit.fill,)),
             )
           ],
         ), 
            Center(
              child: SizedBox(
                  height: dimHeight(context) * .35,
                  width: dimWidth(context),
                  child: Image.asset(
                    (DateTime.now().hour + 1) < 18
                        ? "assets/images/sunn.png"
                        : "assets/images/moon.png",
                  )),
            ),
            Center(child: expectationContainer(context: context))
          ],
        ),
      ),
    );
  }

  Widget expectationContainer({required BuildContext context}) {
    String tomorrow =
        DateFormat.EEEE().format(DateTime.now().add(const Duration(days: 1)));
    String afterTomorrow =
        DateFormat.EEEE().format(DateTime.now().add(const Duration(days: 2)));

    return Container(
      width: dimWidth(context) * .8,
      height: dimHeight(context) * .2,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      color: Colors.white.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "today ",
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              CustomText(text: "${model.temp}°", color: Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: tomorrow,
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              CustomText(text: "${model.weatherExpectation![0]}°", color: Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: afterTomorrow,
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.bold,
              ),
               CustomText(
                text: "${model.weatherExpectation![1]}°",
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
