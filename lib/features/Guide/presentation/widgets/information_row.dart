import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 12,
          ),
          CustomText(
            text: text,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
