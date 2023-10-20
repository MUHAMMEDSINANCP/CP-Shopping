import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/pending_order_row.dart';
import '../../../common_widget/tab_text_button.dart';
import '../../common_widget/round_buttom.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List listArr = [
    {
      "name": "Women's hoodie ",
      "order_id": "456789",
      "date": "2023-07-29 08:00",
      "payment_type": "Cash on Delivery",
      "price": "\$123",
      "image": "assets/img/5.png",
    }
  ];

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          elevation: 0.5,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
                color: TColor.secondaryText,
              )),
          title: Text(
            "My Orders",
            style: TextStyle(color: TColor.primaryText, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  listArr.clear();
                  setState(() {});
                },
                icon: Image.asset(
                  "assets/img/search_tab.png",
                  width: 22,
                  height: 22,
                  color: TColor.secondaryText,
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/cart_tab.png",
                  width: 22,
                  height: 22,
                  color: TColor.secondaryText,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (listArr.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TabTextButton(
                        title: "Pending Orders",
                        isActive: selectTab == 0,
                        onPressed: () {
                          setState(() {
                            selectTab = 0;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TabTextButton(
                        title: "Past orders",
                        isActive: selectTab == 1,
                        onPressed: () {
                          setState(() {
                            selectTab = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (listArr.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/my_order_empty.png",
                    width: media.width * 0.9,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You currently have no orders",
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 20),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Best get shopping App pronto... ",
                            style: TextStyle(
                                color: TColor.secondaryText, fontSize: 14),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: media.width * 0.75,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RoundButton(
                          title: "Start shopping", onPressed: () {})),
                ],
              ),
            if (listArr.isNotEmpty && selectTab == 0)
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: listArr.length,
                    itemBuilder: (context, index) {
                      var pObj = listArr[index] as Map? ?? {};

                      return PendingOrderRow(
                        pObj: pObj,
                        onPressed: () {},
                      );
                    }),
              )
          ],
        ));
  }
}
