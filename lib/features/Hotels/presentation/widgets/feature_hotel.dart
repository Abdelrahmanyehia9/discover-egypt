import 'package:flutter/material.dart';
import 'package:myegypt/constant.dart';

class HotelFeature extends StatelessWidget {
  const HotelFeature({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        children: [
          Icon(
            icon,
            size: 12,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}
