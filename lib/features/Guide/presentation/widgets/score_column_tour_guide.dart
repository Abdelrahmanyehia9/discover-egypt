import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';

class ScoreColumn extends StatelessWidget {
  const ScoreColumn({Key? key, required this.num, required this.text})
      : super(key: key);
  final String num;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: num,
          fontWeight: FontWeight.w300,
          size: 24,
        ),
        CustomText(
          text: text,
          fontWeight: FontWeight.w100,
          size: 16,
        ),
      ],
    );
  }
}
