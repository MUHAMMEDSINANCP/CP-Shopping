import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class TabTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isActive;
  const TabTextButton(
      {super.key,
      required this.title,
      this.isActive = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Spacer(),
                if (isActive)
                  Container(
                    color: TColor.primary,
                    width: double.maxFinite,
                    height: 2,
                  ),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                  color: isActive ? TColor.primary : TColor.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
