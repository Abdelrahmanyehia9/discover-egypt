import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../home/data/local_shared_prefrences.dart';
import '../widgets/information_row.dart';
import '../widgets/profile_pic_of_tour_guide.dart';
import '../widgets/score_column_tour_guide.dart';
import '../widgets/tour_guied_package.dart';

class TourGuideDetailsBody extends StatelessWidget {
  const TourGuideDetailsBody({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TourGuideModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// profile and name of guide
              ProfilePicOfGuide(
                model: model,
              ),

              /// likes and trips
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  children: [
                    ScoreColumn(num: model.liked.toString(), text: "likes"),
                    const SizedBox(
                      width: 12,
                    ),
                    ScoreColumn(num: model.trips.toString(), text: "Trips")
                  ],
                ),
              )
            ],
          ),

          /// information of tour guide
          InformationRow(
            text: model.phoneNumber.toString(),
            icon: Icons.call,
          ),
          InformationRow(
            text: model.email,
            icon: Icons.email,
          ),

          /// packaged
          Expanded(
            child: ListView.builder(
                itemCount: model.packages.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TourGuidePackage(
                        p: model.packages[index],
                      ),
                    )),
          ),
          const SizedBox(
            height: 12,
          ),

          /// my buttons
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                child: const Text("Book Custom Trip")),
            ElevatedButton(
              onPressed: () {
                setValue(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
              ),
              child: CustomText(
                text: "Book Selected Trip",
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ]),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
