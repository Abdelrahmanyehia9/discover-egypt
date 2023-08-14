import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myegypt/features/Guide/presentation/view/tour_guide.dart';
import '../../../../../constant.dart';
import '../../../../Hotels/presentation/view/all_hotel_view.dart';
import '../../controller/bookings.dart';
import 'bookings_component.dart';

class UpComingsBookings extends StatelessWidget {
  const UpComingsBookings({Key? key, required this.controller})
      : super(key: key);
  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text("Hotel Booking",
              style: GoogleFonts.rubik(
                  fontSize: 24, fontWeight: FontWeight.bold, color: mainColor)),
          const SizedBox(
            height: 12,
          ),
          controller.upComingHotel == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You have no  upcoming bookings Hotel",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const AllHotelView());
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: mainColor),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : BookingsComponent.customTileOfBookHotel(
                  model: controller.upComingHotel!,
                  onTap: () {
                    controller.removeHotel();
                  }),
          const SizedBox(
            height: 12,
          ),
          Text("TourGuide Booking",
              style: GoogleFonts.rubik(
                  fontSize: 24, fontWeight: FontWeight.bold, color: mainColor)),
          controller.upComingGuide == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You have no  upcoming bookings TourGuide",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>AllTourGuide()) ;
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: mainColor),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : BookingsComponent.customTileOfBookGuide(
                  model: controller.upComingGuide!,
                  onTap: () {
                    controller.removeGuide();
                  })
        ],
      ),
    );
  }
}
