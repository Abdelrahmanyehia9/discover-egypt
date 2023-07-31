
import 'package:flutter/material.dart';
import 'package:myegypt/features/home/presentation/view/profile_view.dart';
import 'package:myegypt/features/home/presentation/widget/home_view_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'booking_hotel.dart';
import 'favourite_view.dart';

class TogglePages extends StatefulWidget {
  const TogglePages({Key? key}) : super(key: key);

  @override
  State<TogglePages> createState() => _TogglePagesState();
}

class _TogglePagesState extends State<TogglePages> {
  int currentIndex = 1;

  List<Widget> pages = [
    const FavouriteViewBody(),
    const HomeViewBody(),
    const MyBookingBody(),
    const ProfileViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        currentIndex: currentIndex,
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.favorite, size: 30),
              title: const Text("Favourite")),
          SalomonBottomBarItem(
              icon: const Icon(Icons.home, size: 30),
              title: const Text("Home")),
          SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_today, size: 24),
              title: const Text("Booking")),
          SalomonBottomBarItem(
              icon: const Icon(Icons.person, size: 30),
              title: const Text("Profile")),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}




