import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PendingOrderRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  const PendingOrderRow(
      {super.key, required this.pObj, required this.onPressed});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order #${pObj["order_id"]}",
                        style: TextStyle(color: TColor.primary, fontSize: 14),
                      ),
                      Text(
                        pObj["date"],
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pObj["name"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Image.asset(
                        "assets/img/next_detail.png",
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pObj["payment_type"],
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 16),
                      ),
                      Text(
                        pObj["price"],
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              pObj["image"],
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
