import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SectionTitleIcon extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const SectionTitleIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: TColor.title, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              icon,
              width: 18,
              height: 18,
            ))
      ],
    );
  }
}
