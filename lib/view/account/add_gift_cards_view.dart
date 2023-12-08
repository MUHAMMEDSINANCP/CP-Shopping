import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class AddGiftCardView extends StatefulWidget {
  const AddGiftCardView({super.key});

  @override
  State<AddGiftCardView> createState() => _AddGiftCardViewState();
}

class _AddGiftCardViewState extends State<AddGiftCardView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: TColor.white,
        appBar: AppBar(
          backgroundColor: TColor.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 25,
                height: 25,
                color: TColor.title,
              )),
          title: Text(
            "Add Gift cards",
            style: TextStyle(
                color: TColor.title, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enter the long number and scratch off the panel on your card to reveal your pin as shown below.",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2))
                    ]),
                child: Column(children: [
                  Text(
                    "Back of Gift Card",
                    style: TextStyle(color: TColor.secondaryText, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "123456789456789",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.primaryText, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    "assets/img/bar_code.png",
                    width: 240,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 280,
                    height: 20,
                    color: TColor.secondaryText.withOpacity(0.2),
                  ),
                ]),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RoundTextField(
                        title: "16-Digit Code", hitText: "Enter 16-Digit Code"),
                    const SizedBox(
                      height: 8,
                    ),
                    const RoundTextField(
                        title: "4-Digit Pin", hitText: "Enter 4-Digit Pin"),
                    SizedBox(
                      height: media.width * 0.55,
                    ),
                    RoundButton(title: "Add gift cards", onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
