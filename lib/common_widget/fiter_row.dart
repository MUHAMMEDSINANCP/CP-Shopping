import 'package:flutter/material.dart';

import '../common/color_extension.dart';

 
class FilterRow extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;

  const FilterRow(
      {super.key,
      required this.title,
      required this.value,
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
                Text(
                  title,
                  style: TextStyle(color: TColor.primaryText, fontSize: 16),
                ),
                Text(
                  value,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
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
