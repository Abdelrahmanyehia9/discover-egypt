import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/dim.dart';

class TourGuideLoading extends StatelessWidget {
  const TourGuideLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8),
          child: Shimmer.fromColors(
            highlightColor: Colors.grey.shade100,
            baseColor: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          color: Colors.white,
                          height: 20,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 100,
                          color: Colors.white,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 12,
                          width: dimWidth(context) * 0.24,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade600,
                                    size: 16,
                                  )),
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_rounded),
                ),
              ],
            ),
          )),
    );
  }
}
