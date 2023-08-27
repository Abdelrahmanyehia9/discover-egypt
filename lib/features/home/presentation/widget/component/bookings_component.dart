import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Guide/data/model/bookingtourGuide.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guid_details.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../Hotels/data/model/book_hotel_model.dart';

class BookingsComponent {
  static Widget customTileOfBookHotel(
      {required BookHotelModel model, GestureTapCallback? onTap, bool? view}) {
    String from = DateTime.parse(model.dateFrom).toString().substring(0, 11);
    String to = DateTime.parse(model.dateFrom)
        .add(Duration(days: model.numOfDays))
        .toString()
        .substring(0, 11);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 140,
                        width: 100,
                        child: Image.network(
                          model.hotelPic,
                          fit: BoxFit.fill,
                        )),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.yellow.shade800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.hotelRate,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: model.hotelName,
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: "from : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          CustomText(
                            text: from,
                            size: 10,
                            fontWeight: FontWeight.w100,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: "to : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          CustomText(
                            text: to,
                            size: 10,
                            fontWeight: FontWeight.w100,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: "Adults : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          CustomText(
                            text: model.adults.toString(),
                            size: 10,
                            fontWeight: FontWeight.w100,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: "children : ",
                            fontWeight: FontWeight.bold,
                            size: 12,
                          ),
                          CustomText(
                            text: model.children.toString(),
                            size: 10,
                            fontWeight: FontWeight.w100,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CustomText(
                        text:
                            "total Price ${((double.parse(model.hotelPrice) * model.numOfDays) * (model.adults + model.children * 0.5)).toStringAsFixed(2)}\$",
                        color: mainColor.withOpacity(0.7),
                        fontWeight: FontWeight.w900,
                        size: 16,
                      ),
                      CustomText(
                        text: "for ${model.numOfDays} nights",
                        color: mainColor.withOpacity(0.7),
                        fontWeight: FontWeight.w900,
                        size: 8,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bookStatues(model.status),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomText(
                      text: "${model.hotelPrice}\$ per Night",
                      size: 8,
                    )
                  ],
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
          ),
        ),
        view == null
            ? InkWell(
                onTap: onTap,
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  static Widget customTileOfBookGuide(
      {required BookingTourGuideModel model,
      GestureTapCallback? onTap,
      bool? view}) {
    List<Widget> images() {
      List<Widget> img = [
        Image.network(
          model.imageOfPacker,
          fit: BoxFit.fill,
        )
      ];
      for (int i = 0; i < model.images.length; i++) {
        img.add(
          Image.network(
            model.images[i],
            fit: BoxFit.fill,
          ),
        );
      }
      return img;
    }

    String lDate = DateTime.parse(model.date).toString().substring(0, 11);
    String eDate = DateTime.parse(model.date)
        .add(Duration(days: model.numOfTrips - 1))
        .toString()
        .substring(0, 11);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: InkWell(
            onTap: () {
              Get.defaultDialog(
                titlePadding: const EdgeInsets.only(top: 16),
                contentPadding: const EdgeInsets.all(24),
                titleStyle: const TextStyle(
                    color: mainColor, fontWeight: FontWeight.bold),
                title: "guide info",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const CustomText(
                          text: "trips:\t ",
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Expanded(
                            child: CustomText(
                                text: model.tittle
                                    .substring(0, model.tittle.length - 1))),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "Start:\t",
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: lDate,
                          size: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "end:\t",
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: eDate,
                          size: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ImageSlideshow(
                        disableUserScrolling: false,
                        indicatorBackgroundColor: Colors.white,
                        indicatorColor: mainColor,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: images().reversed.toList()),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "number of Trips:\t",
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: model.numOfTrips.toString(),
                          size: 16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "Trip With:\t",
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Text(
                          model.packBy,


                        )
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "Statues:\t",
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: model.status == null
                              ? "under review"
                              : model.status == true
                                  ? "accepted"
                                  : "rejected",
                          color: model.status == null
                              ? Colors.grey
                              : model.status == true
                                  ? Colors.green
                                  : Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(2, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  ImageSlideshow(
                      disableUserScrolling: false,
                      height: 140,
                      width: 100,
                      indicatorBackgroundColor: Colors.white,
                      indicatorColor: mainColor,
                      isLoop: true,
                      children: images()),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 42,
                          child: Text(
                            model.tittle.substring(0, model.tittle.length - 1),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: "from : ",
                              fontWeight: FontWeight.bold,
                              size: 12,
                            ),
                            CustomText(
                              text: lDate,
                              size: 10,
                              fontWeight: FontWeight.w100,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const CustomText(
                              text: "We are :",
                              fontWeight: FontWeight.bold,
                              size: 12,
                            ),
                            CustomText(
                              text: model.numOfPeople.toString(),
                              size: 10,
                              fontWeight: FontWeight.w100,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text:
                              "total Price\n${double.parse(model.totalPrice)}\$",
                          color: mainColor.withOpacity(0.7),
                          fontWeight: FontWeight.w900,
                          size: 16,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          color: mainColor,
                          child: CustomText(
                            text: model.packBy,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      bookStatues(model.status),
                      model.status == true
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                const CustomText(
                                  text: ' ends in  ',
                                  size: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: eDate,
                                  size: 8,
                                )
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
            ),
          ),
        ),
        view == null
            ? InkWell(
                onTap: onTap,
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  static Widget bookStatues(bool? statues) => Container(
      color: statues == null
          ? Colors.grey.shade300
          : statues == true
              ? Colors.green
              : Colors.red,
      padding: const EdgeInsets.all(8),
      child: statues == null
          ? Text(
              'under Review',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          : statues == true
              ? const Text(
                  'accepted',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )
              : const Text(
                  'rejected',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ));
}
