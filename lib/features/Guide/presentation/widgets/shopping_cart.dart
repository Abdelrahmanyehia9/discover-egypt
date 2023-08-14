import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant.dart';
import '../../../../core/function/bookingsFunctions.dart';
import '../../../../core/utils/dim.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../auth/presentation/widgets/custom_buttom.dart';
import '../../data/model/tour_guide_model.dart';
import '../ViewModel/booking_tour_guide.dart';

class ViewShoppingCard extends StatelessWidget {
  final TourGuideModel tModel;

  const ViewShoppingCard({Key? key, required this.tModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingTourGuideController>(
      builder: (model) => Scaffold(
        body: model.tourGuideSet.isEmpty
            ? const Center(
                child: Text('empty'),
              )
            : Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bardy.jpg",
                        ),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: model.tourGuideSet.length,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ListTile(
                                horizontalTitleGap: 15,
                                minVerticalPadding: 0,
                                leading: CachedNetworkImage(
                                  imageUrl: model.tourGuideSet
                                      .toList()[index]
                                      .images
                                      .first,
                                  fit: BoxFit.fill,
                                  width: 80,
                                  height: 100,
                                  placeholder: (context, url) =>
                                      Image.asset(placeHolder),
                                ),
                                title: CustomText(
                                  text:
                                      model.tourGuideSet.toList()[index].tittle,
                                  fontWeight: FontWeight.bold,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 30,
                                        child: CustomText(
                                          text: model.tourGuideSet
                                              .toList()[index]
                                              .subTittle,
                                          fontWeight: FontWeight.w100,
                                        )),
                                    CustomText(
                                      text:
                                          "${model.tourGuideSet.toList()[index].price} \$",
                                      color: mainColor,
                                    )
                                  ],
                                ),
                                trailing: InkWell(
                                    onTap: () {
                                      model.removeFromCart(
                                          model.tourGuideSet.toList()[index]);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red.shade800,
                                      radius: 16,
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )))),
                      )),
                      Container(
                        width: dimWidth(context),
                        height: 1,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text("Check out  :",
                              style: GoogleFonts.pacifico(
                                fontSize: 24,
                                color: Colors.black,
                              )),
                          Text(" ${model.totalPrice} \$",
                              style: GoogleFonts.lilitaOne(
                                fontSize: 24,
                                color: mainColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: dimHeight(context) * 0.055,
                      ),
                      CustomButton(
                        text: "book Now",
                        color: Colors.green,
                        onTap: () {
                          BookingsFunctions.bookTourGuide(
                              context: context, model: model, tModel: tModel);
                        },
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomButton(
                        text: "remove card",
                        color: Colors.red,
                        onTap: () {
                          model.removeAllCard();
                        },
                      ),
                      SizedBox(
                        height: dimHeight(context) * 0.02,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
