
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SaveItemRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  const SaveItemRow({super.key, required this.pObj, required this.onPressed});

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
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      "Color: ",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: HexColor.fromHex(pObj["color"]),
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ]),
                  if (pObj["size"].toString() != "")
                    const SizedBox(
                      height: 4,
                    ),
                  if (pObj["size"].toString() != "")
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        "Size: ",
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        pObj["size"],
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 14),
                      ),
                    ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pObj["price"],
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 18),
                      ),
                      Image.asset(
                        "assets/img/cart_tab.png",
                        width: 20,
                        height: 20,
                        color: TColor.secondaryText,
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
