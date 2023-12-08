import 'package:cp_shopping/view/cart/cart_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/pending_order_row.dart';
import '../../../common_widget/tab_text_button.dart';
import '../../common_widget/round_button.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({
    super.key,
  });

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List listArr = [
    {
      "name": "Ladie's Bag ",
      "order_id": "491324",
      "date": "2023-02-15 12:10",
      "payment_type": "Prepaid",
      "price": "\$131",
      "image": "assets/img/4.png",
    },
    {
      "name": "Women's hoodie ",
      "order_id": "456789",
      "date": "2023-07-29 08:00",
      "payment_type": "Cash on Delivery",
      "price": "\$99",
      "image": "assets/img/5.png",
    },
  ];

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                width: 25,
                height: 25,
                color: TColor.title,
              )),
          title: Text(
            "My Orders",
            style: TextStyle(
                color: TColor.title, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  listArr.clear();
                  setState(() {});
                },
                icon: Image.asset(
                  "assets/img/search_tab.png",
                  width: 25,
                  height: 25,
                  color: TColor.title,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartView()));
                },
                icon: Image.asset(
                  "assets/img/cart_tab.png",
                  width: 25,
                  height: 25,
                  color: TColor.title,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            if (selectTab == 0 && listArr.isNotEmpty)
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
                  },
                ),
              ),
            if (listArr.isEmpty && selectTab == 0)
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Image.asset(
                      "assets/img/my_order_empty.png",
                      width: media.width * 0.9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Nothing in Order list..!",
                            style: TextStyle(
                                color: TColor.title,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundButton(
                            title: "Start shopping", onPressed: () {})),
                  ],
                ),
              ),
            if (selectTab == 1)
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Image.asset(
                      "assets/img/my_order_empty.png",
                      width: media.width * 0.9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "You currently have no past orders!",
                            style: TextStyle(
                                color: TColor.title,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RoundButton(
                            title: "Start shopping", onPressed: () {})),
                  ],
                ),
              ),
          ],
        ));
  }
}
