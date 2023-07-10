import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';
import '../widgets/information_row.dart';
import '../widgets/profile_pic_of_tour_guide.dart';
import '../widgets/score_column_tour_guide.dart';
import '../widgets/tour_guied_package.dart';

class TourGuideDetailsBody extends StatelessWidget {
  const TourGuideDetailsBody({Key? key}) : super(key: key);

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
              const ProfilePicOfGuide(),
              /// likes and trips
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  children: const [
                    ScoreColumn(num: "104", text: "likes"),
                    SizedBox(
                      width: 12,
                    ),
                    ScoreColumn(num: "44", text: "Trips")
                  ],
                ),
              )
            ],
          ),
          /// information of tour guide
          const InformationRow(
            text: "0123456789",
            icon: Icons.call,
          ),
          const InformationRow(
            text: "MohamedAli@yahoo.com",
            icon: Icons.email,
          ),
          /// packaged
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TourGuidePackage(),
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          /// my buttons
          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: mainColor ,),
                    child: const Text("Book Custom Trip")),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300 , ),
                  child: CustomText(text :"Book Selected Trip" , color: Colors.black.withOpacity(0.6),),
                ),
              ]
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
