import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/dim.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../Guide/data/model/tour_guide_model.dart';
import '../../../../Guide/presentation/view/tour_guid_details.dart';
import '../../controller/favourite.dart';

class TourGuideFavourite extends StatefulWidget {
  const TourGuideFavourite({Key? key, required this.model}) : super(key: key);
  final List<TourGuideModel> model;

  @override
  State<TourGuideFavourite> createState() => _TourGuideFavouriteState();
}

class _TourGuideFavouriteState extends State<TourGuideFavourite> {
  bool viewDelete = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Text("Tour Guide",
            style: GoogleFonts.rubik(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      const SizedBox(
        height: 18,
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
              height: dimHeight(context) * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.length,
                  itemBuilder: (context, index) => Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() =>
                                  TourGuideDetails(model: widget.model[index]));
                            },
                            onLongPress: () {
                              setState(() {
                                viewDelete = !viewDelete;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 48,
                                    backgroundImage: NetworkImage(
                                        widget.model[index].imagePath),
                                  ),
                                  CustomText(
                                    text: widget.model[index].name,
                                    size: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                      text:
                                          "${widget.model[index].liked} Likes",
                                      size: 12,
                                      color: Colors.white.withOpacity(0.7))
                                ],
                              ),
                            ),
                          ),
                          viewDelete == true
                              ? InkWell(
                                  onTap: () {
                                    FavouriteController().removeFavouriteGuide(
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
