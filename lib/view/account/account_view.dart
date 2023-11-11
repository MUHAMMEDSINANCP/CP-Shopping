import 'package:cp_shopping/view/account/about_us.dart';
import 'package:cp_shopping/view/account/gift_card_view.dart';
import 'package:cp_shopping/view/account/my_order_view.dart';
import 'package:cp_shopping/view/account/settings_view.dart';
import 'package:cp_shopping/view/account/social_accounts.dart';
import 'package:cp_shopping/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../../common_widget/account_row.dart';
import 'add_payment_method_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 250,
                pinned: true,

                floating: true,
                centerTitle: true,
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: TColor.title.withOpacity(0.4),
                    border: Border.all(
                        color: TColor.white.withOpacity(0.4), width: 2.0),
                  ),
                  child: Text(
                    " My Account ",
                    style: TextStyle(
                        letterSpacing: 1.4,
                        color: TColor.white.withOpacity(0.6),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "assets/img/account_top.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.asset(
                                "assets/img/u2.png",
                                width: 80,
                                height: 80,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: TColor.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/img/pencil.png",
                                    width: 15,
                                    height: 15,
                                    color: TColor.primary,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Jennifer",
                            style: TextStyle(
                                letterSpacing: 1.7,
                                color: TColor.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "rinza@gmail.com",
                            style: TextStyle(
                                letterSpacing: 1.2,
                                color: TColor.white.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsView(),
                        ),
                      );
                    },
                    icon: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: TColor.title.withOpacity(0.5),
                        border: Border.all(
                            color: TColor.white.withOpacity(0.5), width: 2.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/img/gear.png",
                          color: TColor.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ];
          },
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
                        title: "My Order",
                        icon: "assets/img/box-3d-50.png",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyOrderView(),
                            ),
                          );
                        },
                      ),
                      AccountRow(
                        title: "Premier Delivery",
                        icon: "assets/img/crown.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
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
                        title: "My Details",
                        icon: "assets/img/window-paragraph.png",
                        onPressed: () {},
                      ),
                      AccountRow(
                        title: "Address Book",
                        icon: "assets/img/pin-3.png",
                        onPressed: () {},
                      ),
                      AccountRow(
                        title: "Payment Methods",
                        icon: "assets/img/contactless-card.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddPaymentMethodView()));
                        },
                      ),
                      AccountRow(
                        title: "Contact preference",
                        icon: "assets/img/b-meeting.png",
                        onPressed: () {},
                      ),
                      AccountRow(
                        title: "Social Accounts",
                        icon: "assets/img/profile_tab.png",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SocialAccounts(
                                        didSelect: (newVal) {},
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
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
                        title: "Gift Cards & Voucher",
                        icon: "assets/img/present.png",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GiftCardView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
                        title: "About us",
                        icon: "assets/img/exclamation.png",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUs(),
                            ),
                          );
                        },
                      ),
                      AccountRow(
                        title: "Tell us what you think of CP Shopping!",
                        icon: "assets/img/smartphone.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
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
                        title: "Sign Out",
                        icon: "assets/img/logout (1).png",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text(
                                  'Confirm Sign Out',
                                  style: TextStyle(color: TColor.title),
                                )),
                                content: const Text(
                                  'Are you sure you want to sign out?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const OnBoardingView(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
