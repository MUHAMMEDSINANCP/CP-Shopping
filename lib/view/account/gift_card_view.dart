import 'package:cp_shopping/view/account/add_gift_cards_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/gift_row.dart';
import '../../common_widget/round_button.dart';

class GiftCardView extends StatefulWidget {
  const GiftCardView({super.key});

  @override
  State<GiftCardView> createState() => _GiftCardViewState();
}

class _GiftCardViewState extends State<GiftCardView> {
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
            "Gift cards & Voucher",
            style: TextStyle(
                color: TColor.title, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/img/Gifts.png",
                width: media.width * 0.8,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    "You have no card yet",
                    style: TextStyle(color: TColor.primaryText, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You currently have no cards linked to you account. Get started by see redeeming or buying one now.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      title: "Add gift cards",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddGiftCardView(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      title: "Buy gift voucher",
                      type: RoundButtonType.textPrimary,
                      onPressed: () {})
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/contactless-card.png",
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Gift Cards",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 14),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/img/present.png",
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Gift voucher",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 14),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need help with these options?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 14),
                    ),
                    GiftRow(
                      title: "What is a Gift Card?",
                      onPressed: () {},
                    ),
                    GiftRow(
                      title: "What is a Gift Voucher?",
                      onPressed: () {},
                    ),
                    GiftRow(
                      title: "Gift card/ Voucher FAQs",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
