import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/function/bookingsFunctions.dart';
import 'package:myegypt/features/Hotels/data/model/hotel_model.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';
import '../../../../constant.dart';
import '../../../../core/helper/sign_up_data.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';

class HotelItemList extends StatelessWidget {
  HotelItemList({Key? key, required this.model}) : super(key: key);
  final HotelModel model;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 100,
                    width: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: model.imagePath,
                      placeholder: (context, url) => Image.asset(placeHolder),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///tittle and rating
                      Row(
                        children: [
                          /// hotel name
                          CustomText(
                            text: model.name,
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 4,
                          ),

                          ///rating
                          SizedBox(
                            width: 40,
                            height: 18,
                            child: ListView.builder(
                                itemCount: model.rating,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade600,
                                      size: 8,
                                    )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      /// overview and book button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: dimHeight(context) * .0772,
                              width: dimWidth(context) * 0.4,
                              child: Text(
                                model.overView,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(fontSize: 12),
                              )),
                          GetBuilder<BookHotelViewModel>(
                            init: BookHotelViewModel(),
                            builder: (controller) => Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  BookingsFunctions.bookHotel(
                                    context: context,
                                      globalKey: globalKey,
                                      model: model,
                                      onConfirm: () {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          controller.bookHotel(
                                            pic: model.imagePath,
                                              price: model.price,
                                              rate: model.rating.toString(),
                                              hotelName: model.name,
                                              dateFrom: BookHotelViewModel.range.toString(),
                                              numOfDays:
                                              AppInfoHelper.instance.numOfDays,
                                              adults: AppInfoHelper.instance.adults,
                                              children:
                                              AppInfoHelper.instance.children);
                                        }
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: mainColor),
                                child: const Text("book"),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /// price
                      CustomText(
                        text: "${model.price}\$ per Night",
                        color: mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 8,
              right: 9,
              child: Text(
                model.isRecommended ? "recommended" : "",
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
