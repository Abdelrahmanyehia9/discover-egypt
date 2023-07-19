
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/model/tour_package.dart';

class TourGuidePackage extends StatelessWidget {
  const TourGuidePackage({Key? key, required this.p}) : super(key: key);
final  TourGuidePackageModel p ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 15,
      minVerticalPadding: 0,
      leading: CachedNetworkImage(

        imageUrl: p.images.first ,
        fit: BoxFit.fill,
        width: 80,
        height: 100,
        placeholder: (context , url)=>Image.asset(placeHolder),
      ),
      title:  CustomText(
        text: p.tittle,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
              height: 30,
              child: CustomText(
                text:
                p.subTittle,
                fontWeight: FontWeight.w100,
              )),
          CustomText(
            text: "${p.price} \$",
            color: mainColor,
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: CircleAvatar(
            backgroundColor: mainColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
