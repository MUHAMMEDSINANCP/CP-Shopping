import 'package:flutter/material.dart';

import '../common/color_extension.dart';

 
class GiftRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const GiftRow(
      {super.key,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(color: TColor.primaryText, fontSize: 16),
                  ),
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
