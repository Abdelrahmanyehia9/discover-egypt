
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';
import 'package:myegypt/features/home/presentation/view/profile_view.dart';
import 'package:myegypt/features/home/presentation/widget/home_view_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../data/local_shared_prefrences.dart';
import 'bookins.dart';
import 'favourite_view.dart';

class TogglePages extends StatefulWidget {
   TogglePages({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex ;
  @override
  State<TogglePages> createState() => _TogglePagesState();
}

class _TogglePagesState extends State<TogglePages> {


  List<Widget> pages = [
    const FavouriteViewBody(),
    const HomeViewBody(),
   const MyBookingBody(),
    const SettingsView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: mainColor,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        currentIndex: widget.currentIndex,
        items: [
          SalomonBottomBarItem(
            activeIcon: const Icon(Icons.favorite, size: 30),
              icon: const Icon(Icons.favorite_outline, size: 30),
              title: const Text("Favourite")),
          SalomonBottomBarItem(
            activeIcon: const Icon(Icons.home, size: 30),
              icon: const Icon(Icons.home_outlined, size: 30),
              title: const Text("Home")),
          SalomonBottomBarItem(
              activeIcon: const Icon(Icons.airplane_ticket, size: 24),
              icon: const Icon(Icons.airplane_ticket_outlined, size: 24),
              title: const Text("Booking")),
          SalomonBottomBarItem(
            activeIcon: const Icon(Icons.settings, size: 30),
              icon: const Icon(Icons.settings_outlined, size: 30),
              title: const Text("Setting")),
        ],
        onTap: (index) {
          setState(() {


            widget.currentIndex = index;
          });
        },
      ),
      body: pages[widget.currentIndex],
    );
  }
}




