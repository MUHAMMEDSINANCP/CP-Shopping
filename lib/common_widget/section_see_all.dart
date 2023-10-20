import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SectionSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionSeeAll(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              "View All",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )),
      ],
    );
  }
}
