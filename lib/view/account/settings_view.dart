import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../../common_widget/account_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
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
                width: 20,
                height: 20,
                color: TColor.secondaryText,
              )),
          title: Text(
            "Settings",
            style: TextStyle(color: TColor.primaryText, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    AccountRow(
                      title: "Shop in",
                      icon: "assets/img/shop_in.png",
                      value: "United State",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Currency",
                      icon: "assets/img/currency.png",
                      value: "USD",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Size",
                      icon: "assets/img/measurement.png",
                      value: "US",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Notifications",
                      icon: "assets/img/notification.png",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Face ID",
                      icon: "assets/img/face_id.png",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Shop",
                      icon: "assets/img/shop.png",
                      value: "Men",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Screenshot",
                      icon: "assets/img/smartphone.png",
                      onPressed: () {},
                    ),
                    AccountRow(
                      title: "Terms & Conditions",
                      icon: "assets/img/terms.png",
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
