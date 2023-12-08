import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class AddCreditDebitCardView extends StatefulWidget {
  const AddCreditDebitCardView({super.key});

  @override
  State<AddCreditDebitCardView> createState() => _AddCreditDebitCardViewState();
}

class _AddCreditDebitCardViewState extends State<AddCreditDebitCardView> {
  int? mm;
  int? year;

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
            "Credit / Debit Card",
            style: TextStyle(
                color: TColor.title, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RoundTextField(
                        title: "Card Number", hitText: "Enter card number"),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Expiry date",
                          style: TextStyle(
                              color: TColor.secondaryText, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            openExpriyDate();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: TColor.primaryText.withOpacity(0.5),
                                    width: 1),
                                borderRadius: BorderRadius.circular(3)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${mm?.toString().padLeft(2, '0') ?? "MM"} / ${year ?? "YYYY"}",
                                  style: TextStyle(
                                      color: TColor.primaryText, fontSize: 18),
                                ),
                                Image.asset(
                                  "assets/img/bottom.png",
                                  width: 15,
                                  height: 15,
                                  color: TColor.primaryText,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const RoundTextField(
                        title: "Name on card", hitText: "Enter name on card"),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    RoundButton(title: "Save Card", onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "We accept",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: TColor.secondaryText, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/visa (1).png",
                            width: 35,
                            height: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/paypal (2).png",
                            width: 35,
                            height: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/mastercard (1).png",
                            width: 35,
                            height: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/american-express (1).png",
                            width: 35,
                            height: 25,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ]),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/Klarna.png",
                            width: 35,
                            height: 25,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void openExpriyDate() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(3)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: CupertinoPicker.builder(
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                mm = index + 1;
                                setState(() {});
                              },
                              selectionOverlay: Container(
                                width: double.maxFinite,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: TColor.secondaryText
                                            .withOpacity(0.2),
                                        width: 1),
                                  ),
                                ),
                              ),
                              childCount: 12,
                              itemBuilder: (context, index) {
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${index + 1}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 16),
                                      )
                                    ]);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: CupertinoPicker.builder(
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                year = index + 2023;
                                setState(() {});
                              },
                              selectionOverlay: Container(
                                width: double.maxFinite,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: TColor.secondaryText
                                            .withOpacity(0.2),
                                        width: 1),
                                  ),
                                ),
                              ),
                              childCount: 15,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${index + 2023}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 16),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundButton(
                            title: "Cancel",
                            type: RoundButtonType.textPrimary,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: RoundButton(
                            title: "Done",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
