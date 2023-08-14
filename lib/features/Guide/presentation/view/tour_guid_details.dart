import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myegypt/core/function/bookingsFunctions.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:myegypt/features/Guide/presentation/ViewModel/tour_guide_view_model.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';
import 'package:myegypt/features/home/presentation/controller/favourite.dart';
import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';
import '../ViewModel/booking_tour_guide.dart';
import '../widgets/information_row.dart';
import '../widgets/profile_pic_of_tour_guide.dart';
import '../widgets/score_column_tour_guide.dart';
import '../widgets/shopping_cart.dart';
import '../widgets/tour_guied_package.dart';

class TourGuideDetails extends StatefulWidget {
  const TourGuideDetails({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TourGuideModel model;

  @override
  State<TourGuideDetails> createState() => _TourGuideDetailsState();
}

class _TourGuideDetailsState extends State<TourGuideDetails> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingTourGuideController>(
      autoRemove: true,
      init: BookingTourGuideController(),
      builder: (controller) => Scaffold(
        /// shopping cart and like
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade800,
            ),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ViewShoppingCard(
                          tModel: widget.model,
                        ));
                  },
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                ),
                CircleAvatar(
                  radius: 8,
                  child: Text(
                    controller.tourGuideSet.length.toString(),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: (){
                if(widget.model.isLiked == true){
                  FavouriteController().removeFavouriteGuide(model: widget.model) ;

                }else{
                  TourGuideViewModel().addToMyFavourite(model: widget.model) ;
                }

                setState(() {
                  widget.model.isLiked = !(widget.model.isLiked) ;

                });
                print(widget.model.isLiked) ;
              },
              child:  Icon(
                widget.model.isLiked == false ?  Icons.favorite_outline_outlined : Icons.favorite,
                color: Colors.grey.shade800,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              /// profile image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// profile and name of guide
                  ProfilePicOfGuide(model: widget.model),

                  /// likes and trips
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        ScoreColumn(num: widget.model.liked.toString(), text: "likes"),
                        const SizedBox(
                          width: 12,
                        ),
                        ScoreColumn(num: widget.model.trips.toString(), text: "Trips")
                      ],
                    ),
                  )
                ],
              ),

              /// information of tour guide
              InformationRow(
                text: widget.model.phoneNumber.toString(),
                icon: Icons.call,
              ),
              InformationRow(
                text: widget.model.email,
                icon: Icons.email,
              ),

              /// packages
              Expanded(
                child: ListView.builder(
                    itemCount: widget.model.packages.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TourGuidePackage(
                            packageModel: widget.model.packages[index],
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
                    BookingsFunctions.bookTourGuide(
                        context: context, model: controller, tModel: widget.model);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.tourGuideSet.isEmpty
                        ? Colors.grey.shade300
                        : mainColor,
                  ),
                  child: CustomText(
                    text: "Book Selected Trip",
                    color: controller.tourGuideSet.isEmpty
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white,
                  ),
                ),
              ]),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

