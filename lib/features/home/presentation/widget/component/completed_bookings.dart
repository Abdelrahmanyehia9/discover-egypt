import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constant.dart';
import '../../controller/bookings.dart';
import '../alll_previus_bookings.dart';
import 'bookings_component.dart';

class CompletedBookings extends StatelessWidget {
  const CompletedBookings({Key? key, required this.controller})
      : super(key: key);
  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hotel Booking",
                  style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor)),
              InkWell(
                  onTap: () {
                    Get.to(() => AllPreviousBookingsHotel(
                          model: controller,
                        ));
                  },
                  child: const Text(
                    "view all ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          controller.completedHotel.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    "You have no previous bookings  ",
                  ),
                )
              : BookingsComponent.customTileOfBookHotel(
                  model: controller.completedHotel.first,
                  view: false,
                  onTap: () {}),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Guide Booking",
                  style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor)),
              InkWell(
                  onTap: () {
                    Get.to(() => AllPreviousBookingsGuide(
                          model: controller,
                        ));
                  },
                  child: const Text(
                    "view all ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          controller.completedGuide.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    "You have no previous bookings  ",
                  ),
                )
              : BookingsComponent.customTileOfBookGuide(
                  model: controller.completedGuide.first,
                  view: false,
                  onTap: () {})
        ],
      ),
    );
  }
}
