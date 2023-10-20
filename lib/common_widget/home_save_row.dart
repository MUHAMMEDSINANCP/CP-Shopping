import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class HomeSaveRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  const HomeSaveRow({super.key, required this.pObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 45),
              padding: const EdgeInsets.only(
                  left: 45, top: 15, bottom: 15, right: 15),
              decoration: BoxDecoration(color: TColor.white, boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4)
              ]),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pObj["name"].toString(),
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pObj["price"],
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 16),
                      ),
                      Image.asset(
                        "assets/img/next_detail.png",
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              pObj["image"],
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
