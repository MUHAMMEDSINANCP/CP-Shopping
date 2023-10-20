import 'package:flutter/material.dart';

import '../common/color_extension.dart';

 
class IconTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  const IconTextButton({super.key, required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: TColor.white,
            border: Border.all(color: TColor.primary, width: 1),
            borderRadius: BorderRadius.circular(3)),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}