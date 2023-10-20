import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RecentlyCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onFavPressed;
  const RecentlyCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      required this.onFavPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(alignment: Alignment.topRight, children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    pObj["name"].toString(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: onFavPressed,
                    icon: Image.asset(
                      (pObj["is_fav"] as bool? ?? false)
                          ? "assets/img/favorite.png"
                          : "assets/img/favorite_tab.png",
                      width: 18,
                      height: 18,
                    ),
                  )
                ],
              ),
              Text(
                pObj["detail"],
                style: TextStyle(color: TColor.secondaryText, fontSize: 14),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            pObj["image"],
            height: 80,
          ),
        )
      ]),
    );
  }
}
