import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/gift_row.dart';
import 'add_credit_debit_card_view.dart';

class AddPaymentMethodView extends StatefulWidget {
  const AddPaymentMethodView({super.key});

  @override
  State<AddPaymentMethodView> createState() => _AddPaymentMethodViewState();
}

class _AddPaymentMethodViewState extends State<AddPaymentMethodView> {
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.sizeOf(context);
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
            "Add Payment",
            style: TextStyle(
                color: TColor.title, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "You curently have no saved paymend method. Get stard by adding one.",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 15,
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
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddCreditDebitCardView()));
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [5, 5],
                        color: TColor.secondaryText,
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/contactless-card.png",
                            width: 25,
                            height: 25,
                            color: TColor.secondaryText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
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
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
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
                        width: 40,
                        height: 40,
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Need help with these options?",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: TColor.secondaryText, fontSize: 14),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
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
                    GiftRow(
                      title: "What is 4 eassy payments with Klarna?",
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
