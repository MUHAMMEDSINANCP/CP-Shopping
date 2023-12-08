import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class PriceView extends StatefulWidget {
  const PriceView({super.key});

  @override
  State<PriceView> createState() => _PriceViewState();
}

class _PriceViewState extends State<PriceView> {
  RangeValues value = const RangeValues(8.0, 361.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TColor.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
              color: TColor.title,
            )),
        title: Text(
          "Price",
          style: TextStyle(color: TColor.title, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RangeSlider(
                          max: 500,
                          min: 5,
                          values: value,
                          onChanged: (newVal) {
                            setState(() {
                              value = newVal;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${value.start.toInt().toString()}",
                              style: TextStyle(
                                  color: TColor.primary, fontSize: 16),
                            ),
                            Text(
                              "\$${value.end.toInt().toString()}",
                              style: TextStyle(
                                  color: TColor.primary, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RoundButton(
                  title: "Apply",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
