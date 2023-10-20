import 'package:flutter/material.dart';

import '../common/color_extension.dart';

enum RoundButtonType { primary, textPrimary }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.primary,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: type == RoundButtonType.primary ? TColor.primary : TColor.white,
      minWidth: double.maxFinite,
      height: 44,
      shape: RoundedRectangleBorder(
          side: type == RoundButtonType.primary
              ? BorderSide.none
              : BorderSide(color: TColor.primary, width: 1.0),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        title,
        style: TextStyle(
            color:
                type == RoundButtonType.primary ? TColor.white : TColor.primary,
            fontSize: 16),
      ),
    );
  }
}
