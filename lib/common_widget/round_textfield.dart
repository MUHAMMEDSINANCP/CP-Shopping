import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final String hitText;
  final String subtext;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const RoundTextField(
      {super.key,
      required this.title,
      required this.hitText,
      this.controller,
      this.subtext = "",
      this.obscureText = false,
      this.keyboardType,
      this.validator});

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
          child: TextFormField(
            validator: validator,
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
// Eye Icon TextField

class RoundTextFieldWithEyeIcon extends StatefulWidget {
  final String title;
  final String hitText;
  final String subtext;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool showEyeIcon;
  final String? Function(String?)? validator;

  const RoundTextFieldWithEyeIcon({
    super.key,
    required this.title,
    required this.hitText,
    this.controller,
    this.subtext = "",
    this.keyboardType,
    this.showEyeIcon = false,
    this.validator,
  });

  @override
  State<RoundTextFieldWithEyeIcon> createState() =>
      _RoundTextFieldWithEyeIconState();
}

class _RoundTextFieldWithEyeIconState extends State<RoundTextFieldWithEyeIcon> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: TColor.secondaryText, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: TColor.primaryText.withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: widget.validator,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: widget.hitText,
                    hintStyle: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              if (widget
                  .showEyeIcon) // Show the eye icon if showEyeIcon is true
                IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? TColor.primaryText : TColor.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
            ],
          ),
        ),
        SizedBox(height: widget.subtext.isNotEmpty ? 8 : 0),
        if (widget.subtext.isNotEmpty)
          Text(
            widget.subtext,
            style: TextStyle(color: TColor.secondaryText, fontSize: 12),
          ),
      ],
    );
  }
}
