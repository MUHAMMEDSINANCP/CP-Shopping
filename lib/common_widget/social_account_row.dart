import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SocialAccountsRow extends StatelessWidget {
  final Map tlbj;
  final VoidCallback onPressed;
  final bool isActive;

  const SocialAccountsRow(
      {super.key,
      required this.tlbj,
      required this.onPressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
          color: tlbj["color"],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              tlbj["icon"],
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                tlbj["name"],
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              "assets/img/tick.png",
              width: 30,
              height: 30,
              color: isActive ? Colors.lightGreenAccent : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
