import 'package:flutter/material.dart';

import '../common/color_extension.dart';

 
class SearchRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const SearchRow({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            Image.asset(
              sObj["icon"],
              width: 20,
              height: 20,
              color: TColor.secondaryText,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                sObj["name"],
                style: TextStyle(color: TColor.primaryText, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}