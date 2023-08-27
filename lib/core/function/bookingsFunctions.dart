import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/dim.dart';
import '../../constant.dart';
import '../../features/Guide/data/model/tour_guide_model.dart';
import '../../features/Guide/presentation/ViewModel/booking_tour_guide.dart';
import '../../features/Hotels/data/model/hotel_model.dart';
import '../../features/Hotels/presentation/widgets/book_personal.dart';
import '../../features/Hotels/presentation/widgets/range_time.dart';
import '../../features/auth/presentation/widgets/custom_buttom.dart';
import '../helper/sign_up_data.dart';
import '../utils/country_picker.dart';
import '../utils/date_picker.dart';
import '../widgets/custom_text.dart';

class BookingsFunctions {
  static bookTourGuide(
      {required BuildContext context,
      required BookingTourGuideController model,
      required TourGuideModel tModel}) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: globalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const DatePicker(),
                    const SizedBox(
                      height: 12,
                    ),
                    const CountryPicker(),
                    BookPersonHotel(
                      text: 'Adults',
                      num: AppInfoHelper.instance.adults,
                    ),
                    BookPersonHotel(
                      text: 'children',
                      num: AppInfoHelper.instance.children,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                      text: "confirm",
                      color: mainColor,
                      onTap: () async {
                        if (globalKey.currentState!.validate()) {
                          await model.bookingToDatabase(
                              imgOfPack: tModel.imagePath,
                              guideName: tModel.name,
                              date: DateTime.now().toString(),
                              numOfPeople: AppInfoHelper.instance.adults +
                                  AppInfoHelper.instance.children,
                              country: AppInfoHelper.instance.country!,
                              price: model.totalPrice.toString(),
                              model: model.tourGuideSet.toList());

                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomButton(
                      text: "cancel",
                    ),
                  ],
                ),
              ),
            ));
  }

  static void bookHotel(
      {required VoidCallback onConfirm,
      required HotelModel model,
      required GlobalKey<FormState> globalKey,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(

              actions: [
                CustomButton(
                  text: "book",
                  color: mainColor,
                  onTap: onConfirm,
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomButton(
                  text: "cancel",
                  onTap: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
              contentPadding:
                  const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              title: const Center(
                child: CustomText(
                  text: "Book Hotel",
                  size: 24,
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(height: dimHeight(context)*.6,width: dimWidth(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(model.name),
                      const SizedBox(
                        height: 8,
                      ),
                      CachedNetworkImage(
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.fill,
                        imageUrl: model.imagePath,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomText(text: "choose period"),
                      const SizedBox(
                        height: 8,
                      ),
                      RangeTimePicker(
                        globalKey: globalKey,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      BookPersonHotel(
                          text: 'Adults', num: AppInfoHelper.instance.adults),
                      BookPersonHotel(
                          text: 'Children', num: AppInfoHelper.instance.children),
                    ],
                  ),
                ),
              ),
            ));
  }
}
