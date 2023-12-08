import 'package:cp_shopping/common_widget/round_button.dart';
import 'package:cp_shopping/view/main_tab/main_tabview.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const MainTabView()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios_new,
        //     color: TColor.title,
        //     size: 25,
        //   ),
        // ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "My Cart",
          style: TextStyle(
              letterSpacing: 1.2,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: TColor.title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: media.width * 0.25,
              ),
              Image.asset(
                "assets/img/search_black.png",
                width: media.width * 0.7,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "🛒 Your CP Shopping Cart is empty!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                title: "Start Shopping Now",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
