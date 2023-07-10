
import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../core/widgets/custom_text.dart';

class TourGuidePackage extends StatelessWidget {
  const TourGuidePackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 15,
      minVerticalPadding: 0,
      leading: Image.network(
        "https://www.weseektravel.com/wp-content/uploads/2022/05/landmarks-in-egypt-1-2.jpg",
      ),
      title: const CustomText(
        text: "Pyramids Trip",
        fontWeight: FontWeight.bold,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              height: 30,
              child: CustomText(
                text:
                "lets see pyramids and Sphinks wint great jkff fhdjsfhd fdjfhjfd",
                fontWeight: FontWeight.w100,
              )),
          CustomText(
            text: "120 \$",
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
