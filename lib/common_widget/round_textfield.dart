import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final String hitText;
  final String subtext;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const RoundTextField(
      {super.key,
      required this.title,
      required this.hitText,
      this.controller,
      this.subtext = "",
      this.obscureText = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(color: TColor.secondaryText, fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: TColor.primaryText.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.circular(3)),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: hitText,
                hintStyle:
                    TextStyle(color: TColor.secondaryText, fontSize: 14)),
          ),
        ),
        SizedBox(
          height: subtext != "" ? 8 : 0,
        ),
        if (subtext != "")
          Text(
            subtext,
            style: TextStyle(color: TColor.secondaryText, fontSize: 12),
          ),
      ],
    );
  }
}
