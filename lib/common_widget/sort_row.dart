import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class SortRow extends StatelessWidget {
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;

  const SortRow(
      {super.key,
      required this.title,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: TColor.primaryText, fontSize: 16),
                ),
                if (isSelect)
                  Image.asset(
                    "assets/img/checked.png",
                    width: 15,
                    height: 15,
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
