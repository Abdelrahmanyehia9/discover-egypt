import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/Hotels/presentation/view/hotels_view.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_view.dart';
import '../../../Guide/presentation/view/tour_guide.dart';

class MyButtonTabBar extends StatelessWidget {
  const MyButtonTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          /// tabs
          ButtonsTabBar(
              height: 64,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
              backgroundColor: mainColor,
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
                  color: mainColor, fontWeight: FontWeight.bold),
              radius: 100,
              tabs: const [
                Tab(icon: Icon(Icons.place), text: "Place"),
                Tab(icon: Icon(Icons.hotel), text: "Hotel"),
                Tab(
                    icon: Icon(Icons.emoji_transportation),
                    text: "Transportation"),
                Tab(icon: Icon(Icons.tour), text: "Tour guide"),
              ]),

          /// tabs view
          const Expanded(
            child: TabBarView(children: [
              PlacesView(),
              HotelsView(),
              Center(child: Text("Not Available yet ")),
              TourGuide(),
            ]),
          ),
        ],
      ),
    );
  }
}
