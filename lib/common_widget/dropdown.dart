import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class Dropdown extends StatelessWidget {
  final String placeholder;
  final List valueList;
  final String? selectValue;
  final Function(String?) didChange;
  const Dropdown(
      {super.key,
      required this.placeholder,
      required this.valueList,
      this.selectValue,
      required this.didChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          border: Border.all(
              color: selectValue == null || selectValue!.isEmpty
                  ? Colors.red
                  : TColor.primaryText.withOpacity(0.5),
              width: 1),
          borderRadius: BorderRadius.circular(3)),
      alignment: Alignment.center,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            icon: Icon(
              Icons.expand_more,
              color: TColor.secondaryText,
            ),
            value: selectValue,
            hint: Text(
              placeholder,
              style: TextStyle(color: TColor.secondaryText, fontSize: 16),
            ),
            isExpanded: true,
            items: valueList.map((obj) {
              return DropdownMenuItem(
                value: obj.toString(),
                child: Text(
                  obj.toString(),
                  style: TextStyle(
                      color: TColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
            onChanged: didChange),
      ),
    );
  }
}
