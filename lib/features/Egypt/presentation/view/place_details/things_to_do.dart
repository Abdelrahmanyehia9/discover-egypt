import 'package:cached_network_image/cached_network_image.dart';
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
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: thingsToDoItem(
                        img: model.image,
                        context: context,
                        overView:
                            'gjdfngjdfgdffvnvd nfdgdfgjdfg gdfkgjkdfgjdf mgfdkjgkdfg ngkdfjgkdfg gdfkgjdfkg jgdfkgjdfk gjdfjgdf ngjdfghjdfghdf gjdfkgjdfkgjdf gjnfdkgjdfk ',
                        tripname: 'dahab trip '),
                  ))),
    ));
  }

  Widget thingsToDoItem(
          {required String img,
          required BuildContext context,
          required String overView,
          required tripname}) =>
      Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 28),
          child: Column(children: [
            CustomText(
              text: tripname,
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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: img,
                  placeholder: (context, url) => Image.asset(placeHolder),
                )),
            const SizedBox(
              height: 12,
            ),
            Text(
              overView,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            view != null
                ? Column(children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                            width: 64,
                            child: CustomText(
                              text: "Available",
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        CustomText(text: "5:00 am to 12:00 pm")
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                            width: 64,
                            child: CustomText(
                              text: "price",
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          width: 12,
                        ),
                        CustomText(text: "75 \$")
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
