import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';
import '../../../../core/utils/dim.dart';
import '../widget/component/completed_bookings.dart';
import '../widget/component/upcoming_booking.dart';

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
