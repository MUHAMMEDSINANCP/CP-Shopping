import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class HomeStylesCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onFavPressed;
  final VoidCallback onLikePressed;
  const HomeStylesCell(
      {super.key,
      required this.pObj,
      required this.onPressed,
      required this.onFavPressed,
      required this.onLikePressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(alignment: Alignment.topRight, children: [
        Container(
          margin: const EdgeInsets.only(
            top: 40,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
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
                  Expanded(
                    child: Text(
                      pObj["name"].toString(),
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: onFavPressed,
                    child: Image.asset(
                      (pObj["is_fav"] as bool? ?? false)
                          ? "assets/img/favorite.png"
                          : "assets/img/favorite_tab.png",
                      width: 15,
                      height: 15,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pObj["price"],
                    style: TextStyle(color: TColor.primaryText, fontSize: 16),
                  ),
                  InkWell(
                    onTap: onFavPressed,
                    child: Image.asset(
                      "assets/img/thumb-down.png",
                      width: 18,
                      height: 18,
                      color: TColor.secondaryText,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            pObj["image"],
            height: 100,
          ),
        )
      ]),
    );
  }
}
