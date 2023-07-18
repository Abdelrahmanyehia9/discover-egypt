
import 'package:flutter/material.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:shimmer/shimmer.dart';

class PlacesViewLoading extends StatelessWidget {
  const PlacesViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: dimHeight(context) * 0.37,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.black,
                        width: dimWidth(context) * 0.6,
                        height: dimHeight(context) * 0.25,
                      ),

                    ),
                  ),
                )
            ),
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 8),
          ),
          SizedBox(
              height: dimHeight(context) * .15,
              width: dimWidth(context),
              child:  ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4 ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            color: Colors.white,
                            width: dimWidth(context) * .22,
                          ),
                        ),
                      ),
                    );
                  })
          ),

        ]),
      ),
    );
  }
}
