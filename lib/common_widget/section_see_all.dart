import 'package:flutter/material.dart';

 
class SectionSeeAll extends StatelessWidget {
  final String title;
  final String titleAll;
  final Color titleColor;

  final VoidCallback onPressed;

  const SectionSeeAll({
    super.key,
    required this.title,
    required this.onPressed,
    this.titleAll = "View All",
    this.titleColor = const Color(0xff895F44),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: titleColor, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              titleAll,
              style: const TextStyle(
                  color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
