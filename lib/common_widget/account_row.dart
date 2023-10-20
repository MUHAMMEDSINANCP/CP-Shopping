import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class AccountRow extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  final VoidCallback onPressed;

  const AccountRow(
      {super.key,
      required this.title,
      required this.icon,
      this.value = "",
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  icon,
                  width: 25,
                  height: 25,
                  color: TColor.primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(color: TColor.primaryText, fontSize: 16),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  "assets/img/right.png",
                  width: 15,
                  height: 15,
                  color: TColor.secondaryText,
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          )
        ],
      ),
    );
  }
}
