import 'package:flutter/material.dart';

import '../common/color_extension.dart';

 
class HomeCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  const HomeCell({super.key, required this.pObj, required this.onPressed});

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
            height: 100,
          ),
        )
      ]),
    );
  }
}
