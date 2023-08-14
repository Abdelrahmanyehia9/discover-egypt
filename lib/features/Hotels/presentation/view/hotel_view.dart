import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/core/utils/main_app_bar.dart';
import 'package:myegypt/features/Hotels/data/model/hotel_model.dart';
import 'package:myegypt/features/Hotels/presentation/viewModel/book_hotel_view_model.dart';
import 'package:myegypt/features/auth/presentation/widgets/custom_buttom.dart';
import 'package:myegypt/features/home/presentation/controller/favourite.dart';
import '../../../../core/function/bookingsFunctions.dart';
import '../../../../core/helper/sign_up_data.dart';
import '../../../../core/widgets/custom_text.dart';
import '../viewModel/hotel_view_model.dart';
import '../widgets/feature_hotel.dart';

class HotelView extends StatefulWidget {
  HotelView({Key? key, required this.model}) : super(key: key);
  final HotelModel model;

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool liked = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mainAppBar(
          liked: widget.model.isLiked ,
            favOnTap: () {
              if(widget.model.isLiked == true){


                  FavouriteController().removeFavouriteHotel(model:widget.model) ;
                  FavouriteController().hotelList.remove(widget.model) ;

              }else{
                HotelViewModel().addToMyFavourite(model: widget.model) ;
              }
          setState(() {
            widget.model.isLiked = !(widget.model.isLiked) ;
          });

        }),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                  height: dimHeight(context) * .3,
                  indicatorBackgroundColor: Colors.white,
                  indicatorColor: mainColor,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.network(
                      widget.model.imagePath,
                      fit: BoxFit.fill,
                    )
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: widget.model.name,
                          fontWeight: FontWeight.bold,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 100,
                          height: 18,
                          child: ListView.builder(
                              itemCount: widget.model.rating,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade600,
                                    size: 16,
                                  )),
                        )
                      ],
                    ),
                    CustomText(
                      text: widget.model.location,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: const [
                          HotelFeature(icon: Icons.wifi, text: 'Wifi'),
                          HotelFeature(icon: Icons.ac_unit, text: 'AC'),
                          HotelFeature(
                              icon: Icons.access_time_filled_sharp,
                              text: '24 Hours'),
                          HotelFeature(icon: Icons.pool, text: 'Swimming'),
                          HotelFeature(icon: Icons.bathtub, text: 'bath'),
                          HotelFeature(
                              icon: Icons.clean_hands_outlined,
                              text: 'House Keeping'),
                          HotelFeature(icon: Icons.local_parking, text: ''),
                          HotelFeature(
                              icon: Icons.fitness_center, text: "sports gym"),
                          HotelFeature(
                              icon: Icons.restaurant, text: 'restaurant'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: CustomText(
                        text: '${widget.model.price}  \$ per night',
                        color: double.parse(widget.model.price) <= 120
                            ? Colors.green
                            : Colors.red,
                        size: 16,
                      ),
                    ),
                    Text(
                      widget.model.overView,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                      text: 'Book Now',
                      color: mainColor,
                      onTap: () {
                        BookingsFunctions.bookHotel(
                            onConfirm: () {
                              if (globalKey.currentState!.validate()) {
                                BookHotelViewModel().bookHotel(
                                    hotelName: widget.model.name,
                                    dateFrom:
                                        BookHotelViewModel.range.toString(),
                                    numOfDays: AppInfoHelper.instance.numOfDays,
                                    adults: AppInfoHelper.instance.adults,
                                    children: AppInfoHelper.instance.children,
                                    rate: widget.model.rating.toString(),
                                    pic: widget.model.imagePath,
                                    price: widget.model.price);
                              }
                            },
                            model: widget.model,
                            globalKey: globalKey);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
