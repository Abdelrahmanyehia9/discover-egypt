import 'package:flutter/material.dart';
import 'package:myegypt/features/Egypt/data/model/place_model.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/dim.dart';
import '../../../../../core/widgets/custom_text.dart';

class ThingsToDoView extends StatelessWidget {
  const ThingsToDoView({Key? key, required this.model, this.view})
      : super(key: key);
  final PlaceModel model;
  final bool? view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: ListView.builder(
                itemCount: model.thingsTodo.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: thingsToDoItem(
                              model: model.thingsTodo[index] ,
                              context: context
                          )
                        ),
                  model.thingsTodo[index].isRecommended == true ?  Positioned(
                      left: dimWidth(context)*0.01,top: dimHeight(context)*0.006,
                      child: SizedBox(height: dimHeight(context)*0.2,width: dimWidth(context)*0.27,
                          child: Image.asset("assets/images/reco.png" , fit: BoxFit.fill,)),
                    ):const SizedBox()

                  ],
                ))));
  }

  Widget thingsToDoItem({required ThingsToDoModel model ,required BuildContext context}
          ) =>
      Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 28),
          child: Column(children: [
            CustomText(
              text: model.tittle,
              size: 24,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: dimHeight(context) * 0.3,
                width: double.infinity,
                child: Image.network(
                  fit: BoxFit.fill,
                   model.imagePath
                )),
            const SizedBox(
              height: 12,
            ),
            view == null ? Text(
              model.subTittle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ) :const SizedBox(),
            view != null
                ? Column(children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children:  [
                        const SizedBox(
                            width: 64,
                            child: CustomText(
                              text: "Available",
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomText(text: model.open?? "24 hours")
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                            width: 64,
                            child: CustomText(
                              text: "Price",
                              fontWeight: FontWeight.bold,
                            )),
                       const SizedBox(width: 12,) ,
                        model.price.contains("hours")?CustomText(
                          text: model.price  ,
                          fontWeight: FontWeight.bold,
                        ):
                        CustomText(
                          text: "${model.price}\$"  ,
                          fontWeight: FontWeight.bold,),
                      ],
                    )
                  ])
                : const SizedBox(
                    height: 0,
                  )
          ]),
        ),
      );
}
