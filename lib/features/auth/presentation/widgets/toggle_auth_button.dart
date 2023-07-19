import 'package:flutter/material.dart';
import '../../../../../constant.dart';

class ToggleAuthButton extends StatelessWidget {
  const ToggleAuthButton(
      {Key? key, required this.text1, required this.text2, this.onPress})
      : super(key: key);
  final String text1;
  final String text2;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(

            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
            onTap: onPress,
            child: Text(
              text2,
              style:
                  const TextStyle( color: Colors.white, fontSize: 14),
            )),
      ],
    );
  }
}
