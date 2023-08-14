import 'package:flutter/material.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';

import '../view/bookins.dart';
import 'component/bookings_component.dart';

class AllPreviousBookingsHotel extends StatelessWidget {
  const AllPreviousBookingsHotel({Key? key, required this.model})
      : super(key: key);
  final BookingsController model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: model.completedHotel.length,
          itemBuilder: (context, index) =>
              BookingsComponent.customTileOfBookHotel(
                  model: model.completedHotel[index], view: false)),
    );
  }
}

class AllPreviousBookingsGuide extends StatelessWidget {
  const AllPreviousBookingsGuide({Key? key, required this.model})
      : super(key: key);
  final BookingsController model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: model.completedGuide.length,
          itemBuilder: (context, index) =>
              BookingsComponent.customTileOfBookGuide(
                  model: model.completedGuide[index], view: false)),
    );
  }
}
