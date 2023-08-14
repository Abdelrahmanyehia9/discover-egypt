import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/dim.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../Hotels/data/model/hotel_model.dart';
import '../../../../Hotels/presentation/view/hotel_view.dart';
import '../../controller/favourite.dart';

class HotelFavourite extends StatefulWidget {
  final List<HotelModel> model;

  const HotelFavourite({Key? key, required this.model}) : super(key: key);

  @override
  State<HotelFavourite> createState() => _HotelFavouriteState();
}

class _HotelFavouriteState extends State<HotelFavourite> {
  bool viewDelete = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Hotels",
              style: GoogleFonts.rubik(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
      widget.model.isEmpty
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
              child: CustomText(
                text:
                    "Always be sure to add it to your favorites so that you can get it on your next trip",
                color: Colors.white.withOpacity(0.7),
              ),
            )
          : SizedBox(
              height: dimHeight(context) * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.length,
                  itemBuilder: (context, index) => Stack(
                        children: [
                          InkWell(
                            onLongPress: () {
                              setState(() {
                                viewDelete = !viewDelete;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => HotelView(
                                          model: widget.model[index],
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                          width: 120,
                                          height: dimHeight(context) * 0.2,
                                          child: Image.network(
                                            widget.model[index].imagePath,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CustomText(
                                        text: widget.model[index].name,
                                        size: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      CustomText(
                                        text: widget.model[index].location,
                                        size: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          viewDelete == true
                              ? InkWell(
                                  onTap: () {
                                    FavouriteController().removeFavouriteHotel(
                                        model: widget.model[index]);

                                    setState(() {
                                      widget.model.remove(widget.model[index]);
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 12,
                                    child: Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      )))
    ]);
  }
}
