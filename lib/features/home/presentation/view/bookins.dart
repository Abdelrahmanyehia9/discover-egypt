import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';
import '../../../../core/utils/dim.dart';
import '../../../Hotels/presentation/view/all_hotel_view.dart';
import '../widget/alll_previus_bookings.dart';
import '../widget/component/bookings_component.dart';

class MyBookingBody extends StatelessWidget {
  const MyBookingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Center(
            child: GetBuilder<BookingsController>(
              init: BookingsController(),
              builder: (controller) => Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonsTabBar(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: dimWidth(context) * 0.099),
                      unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      height: 48,
                      tabs: const [
                        Tab(
                          text: "upcoming",
                        ),
                        Tab(
                          text: "Completed",
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(children: [
                      UpComingsBookings(
                        controller: controller,
                      ),
                      CompletedBookings(
                        controller: controller,
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

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
                        onTap: (){
                          Get.to(()=>const AllHotelView()) ;
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
                      Center(
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
                  onTap: () {}) ,
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
          controller.completedHotel.isEmpty
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
