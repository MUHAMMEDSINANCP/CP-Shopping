import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class HomeSectionRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  final VoidCallback onPressed;
  const HomeSectionRow(
      {super.key,
      required this.title,
      this.subtitle = "",
      required this.img,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(alignment: Alignment.topRight, children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 120,
            decoration: BoxDecoration(color: TColor.white, boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4)
            ]),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: TColor.primaryText.withOpacity(0.6),
                      letterSpacing: 2,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                if (subtitle != "")
                  const SizedBox(
                    height: 8,
                  ),
                if (subtitle != "")
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: TColor.title.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
              ],
            ),
          ),
          Image.asset(
            img,
            width: 120,
            height: 140,
          )
        ]),
      ),
    );
  }
}
